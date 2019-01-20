import 'package:flutter/material.dart';
import 'profile_widget.dart';
import 'focus_button.dart';
import 'comment_textfield_sheet.dart';
import '../screens/text_screen.dart';

class LolCard extends StatelessWidget {
//  final double height;
  final String text = 'LOL和DOTA2撕了这么多年，至今未有定论。'
      '————好在本文大规模使用了数据分析武器，'
      '目的就是打造一个全新的场地，让大家撕个痛快';
  final String image = 'assets/home/home_photo1.png';
  final String title = '是什么导致了LOL败给了DOTA';
  final String name = "浮生";
  final String intro = "二次元棋圣";
  final bool isHot = true;
  final String forward = '710万';
  final String comment = '200万';
  final String time = '1小时前';
  final List<String> images;

  LolCard(
      this.images); //      List.generate(10, (index) => 'assets/home/home_photo1.png');



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildProfileRow(),
              _buildTitle(size),
              images.isNotEmpty
                  ? _buildImageRow(size)
                  : _buildDetail(text, image, size, context),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          _buildStatusRow(context),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildProfileWidget(name, intro),
          FocusButton(_onFocusButtonTapped)
        ],
      ),
    );
  }

  Widget _buildProfileWidget(String name, String intro) {
    return Row(
      children: <Widget>[
        ProfileWidget('assets/home/home_head.png'),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '$intro',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTitle(Size size) {
    final titleTextSize = size.width / 24;
    final labelTextSize = size.width / 32;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(
              fontSize: titleTextSize,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          isHot
              ? Container(
                  height: 18,
                  width: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '热议',
                    style:
                        TextStyle(fontSize: labelTextSize, color: Colors.white),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildDetail(String text, String image, Size size, context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: GestureDetector(
              onTap:() => Navigator.push(context, new MaterialPageRoute(builder: (context) => new TextScreen())),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: size.width / 28),
                ),
              )
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(image),
            ))
      ],
    );
  }

  Widget _buildImageRow(Size size) {
    return SizedBox(
      height: size.width / 4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(images[index]),
            );
          }),
    );
  }

  Widget _buildStatusRow(BuildContext context) {
    final unselectedColor = Colors.black.withOpacity(0.5);

    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            time,
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle
                .copyWith(color: Colors.grey),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => print('转发'),
                child: _buildIconRow(Icons.redo, forward, context),
              ),
              SizedBox(
                  height: 16,
                  child: RotatedBox(
                    quarterTurns: 45,
                    child: Divider(
                      color: Colors.black,
                    ),
                  )),
              GestureDetector(
                  onTap: () => _onCommentButtonPressed(context),
                  child: _buildIconRow(Icons.comment, comment, context)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconRow(IconData icon, String text, BuildContext context) {
    final color = Colors.grey;
    final iconSize = 16.0;

    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '$text',
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle
              .copyWith(color: color),
        )
      ],
    );
  }

  _onCommentButtonPressed(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CommentTextFieldSheet();
        });
  }

  _onFocusButtonTapped() {
    print('focus button tapped');
  }
}
