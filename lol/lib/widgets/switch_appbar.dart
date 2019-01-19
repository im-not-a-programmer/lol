import 'package:flutter/material.dart';

class SwitchAppBar extends StatefulWidget {
  final String text1;
  final String text2;
  final Widget button;
  final Function text1Pressed;
  final Function text2Pressed;

  SwitchAppBar( this.text1, this.text2, [this.button,this.text1Pressed,this.text2Pressed]);

  @override
  _SwitchAppBarState createState() => _SwitchAppBarState();
}

class _SwitchAppBarState extends State<SwitchAppBar> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener((){
        if(controller.indexIsChanging){
          if(controller.index == 0){
            widget.text1Pressed();
          }else{
            widget.text2Pressed();
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final fontSize = width/20;

    return AppBar(
      centerTitle: true,
      title: SizedBox(
        width: 180,
        child: Theme(
          data: ThemeData(splashColor: Colors.black),
          child: TabBar(
              labelColor: Colors.orangeAccent,
              indicatorColor: Colors.black.withOpacity(0.9),
              unselectedLabelColor: Colors.white,
              controller: controller,
              tabs: [
                Tab(
                  child: Text(
                    widget.text1,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                Tab(
                  child: Text(
                    widget.text2,
                    style: TextStyle(fontSize: fontSize),
                  ),
                )
              ]),
        ),
      ),
      actions: <Widget>[
        Center(
          child: widget.button != null
              ? SizedBox(child: widget.button,)
              : SizedBox(),
        ),
      ],
      elevation: 0,
    );
  }
}
