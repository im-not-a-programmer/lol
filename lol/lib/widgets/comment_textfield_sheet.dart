import 'package:flutter/material.dart';

class CommentTextFieldSheet extends StatefulWidget {
  final int comment = 246;

  @override
  _CommentTextFieldSheetState createState() => _CommentTextFieldSheetState();
}

class _CommentTextFieldSheetState extends State<CommentTextFieldSheet> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: width/1.5,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                autofocus: true,
                maxLines: 5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' 快来发表你的看法吧(已有${widget.comment})',
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: width / 24)),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _onSubmit(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: width / 7,
                  height: width / 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '发送',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  _onSubmit(BuildContext context) {
    _popSheet(context);
  }

  _popSheet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
