import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {

  final String leadingImage;
  final String title;

  MessageTile(this.leadingImage, this.title);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                    height: size.width/7.5 ,
                    width: size.width/4.5,
                    child: Image.asset(leadingImage)),
                Text('$title',style: TextStyle(fontSize: size.width/22),),
              ],
            ),
            Icon(Icons.navigate_next,size: 42,color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
