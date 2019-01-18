import 'package:flutter/material.dart';
import 'profile_widget.dart';

class NoticeCard extends StatelessWidget {
  final String profileImage = 'assets/find/01.png';
  final String title = 'ALL-IN电竞平台上线了';
  final String intro = 'ALL-IN电竞平台正式上线了，无尽的娱乐尽在奥义电竞平台！！';
  final String time = '19:00';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: size.width / 3.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: 56, width: 56, child: ProfileWidget(profileImage)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width/24,),
                  ),
                  SizedBox(width: 52,),
                  Text('$time',style: TextStyle(color: Colors.grey),)
                ],),
                SizedBox(
                  width: size.width/2,
                  child: Text(
                    '$intro',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
