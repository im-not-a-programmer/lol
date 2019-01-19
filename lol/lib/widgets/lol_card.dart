import 'package:flutter/material.dart';
import 'profile_widget.dart';
import 'focus_button.dart';

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
              _buildDetail(text, image, size),
            ],
          ),
          SizedBox(height: 12,),
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
          SizedBox(
            height: 30,
            width: 68,
            child: FocusButton(_onFocusButtonTapped),
          )
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
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(
              fontSize: size.width / 22,
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
                    style: TextStyle(
                        fontSize: size.width / 32, color: Colors.white),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildDetail(String text, String image, Size size) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                text,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: size.width / 28),
              ),
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
              Icon(
                Icons.redo,
                color: unselectedColor,
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '$forward',
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                  height: 16,
                  child: RotatedBox(
                    quarterTurns: 45,
                    child: Divider(
                      color: Colors.black,
                    ),
                  )),
              Icon(
                Icons.comment,
                color: unselectedColor,
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '$comment',
                  style: Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  _onFocusButtonTapped() {
    print('focus button tapped');
  }
}
