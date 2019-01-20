import 'package:flutter/material.dart';
import 'profile_widget.dart';
import 'focus_button.dart';

class PeopleTile extends StatelessWidget {
  final String headImage = 'assets/find/01.png';
  final String name = '斩月精灵';
  final String intro = '二次元棋圣';
  final String fans = '555';
  final bool isVip = true;
  final String vipIcon = 'assets/find/find_vip@3.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ProfileWidget(headImage),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '$name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: size.width/24),
                          ),
                          isVip
                              ? SizedBox(
                                  height: 16,
                                  width: 24,
                                  child: Image.asset(vipIcon),
                                )
                              : SizedBox()
                        ],
                      ),
                      intro != null ? Text('$intro',style: TextStyle(fontSize: size.width/30),) : SizedBox(),
                      Column(
                        children: <Widget>[
                          Text(
                            '粉丝：$fans',
                            style: TextStyle(fontSize: size.width/30,color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                    height: size.width/15,
                    width: size.width/7,
                    child: FocusButton(_onFocusButtonTapped)),
              )
            ],
          )),
    );
  }

  _onFocusButtonTapped() {}
}
