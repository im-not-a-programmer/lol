import 'package:flutter/material.dart';

class HintWidget extends StatelessWidget {
  final bool isHint;
  final Widget child;

  HintWidget(this.isHint, this.child);

  @override
  Widget build(BuildContext context) {
    if(!isHint) return child;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        child,
        Positioned(
            top: 0,
            right: 18,
            child: Container(height: 8,width: 8,decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(24)),))
      ],
    );
  }
}
