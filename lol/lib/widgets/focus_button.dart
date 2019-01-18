import 'package:flutter/material.dart';

enum Status{
  focus,
  focusEach,
  unFocus
}

class FocusButton extends StatefulWidget {
  final Function _onFocusButtonTapped;
  final status = Status.focus;

  FocusButton(this._onFocusButtonTapped);

  @override
  _FocusButtonState createState() => _FocusButtonState();
}

class _FocusButtonState extends State<FocusButton> {
  Status status;

  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: _onFocusButtonTapped,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color: status == Status.unFocus ? Colors.orangeAccent : Colors.grey),
                color: _getCurrentColor(),
                borderRadius: BorderRadius.circular(8)),
            child: _getFocusButton()),
      ),
    );
  }

  Widget _getFocusButton(){
    switch (status){
      case Status.focusEach :return Icon(Icons.repeat,color: Colors.grey,);
      case Status.focus
          :return Text('已关注',style: TextStyle(color: Colors.white),);
      default
          : return Text(
        '关注',
        style: TextStyle(color: Colors.white,),
      );
    }
  }

  _getCurrentColor(){
    switch(status){
      case Status.focusEach: return Colors.white;
      case Status.unFocus: return Colors.orangeAccent;
      case Status.focus:return Colors.grey;
      default: return Colors.white;
    }
  }

  _onFocusButtonTapped(){
    widget._onFocusButtonTapped();
    switch(status){
      case Status.focus : {status = Status.unFocus;break;}
      case Status.focusEach : {status = Status.focus;break;}
      case Status.unFocus : {status = Status.focusEach;break;}
      default: status = Status.unFocus;
    }
    setState(() {});
  }
}
