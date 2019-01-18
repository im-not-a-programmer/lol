import 'package:flutter/material.dart';

/**
 * 实际开发若image来自网络
 * 需要将image换成NetworkImage
 */

class ProfileWidget extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  ProfileWidget(this.image, [this.onTap]);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(image),
//      backgroundImage: NetworkImage(image),
    );
  }
}
