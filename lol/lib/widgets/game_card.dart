import 'package:flutter/material.dart';

enum Status { apply, inGame, end }

class GameCard extends StatelessWidget {
  final String image = 'assets/event/01.png';
  final Status status = Status.end;
  final String startTime = '2018-03-05 开始报名';
  final String reward = '1000人民币 5000Q币 硕美123123123';
  //总人数
  final int total = 64;
  //剩余人数
  final int remain = 32;
  //是否参赛
  final bool myStatus = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Card(
        child: Container(
          height: size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: <Widget>[
              _buildImage(size),
              _buildCardBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(Size size) {
    return SizedBox(
      height: size.width / 2.8,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 16,
              child: SizedBox(
                  height: 64, child: Image.asset(getStatusImage(status))))
        ],
      ),
    );
  }

  Widget _buildCardBody() {
    final greenButton = 'assets/event/event_green@3.png';
    final redButton = 'assets/event/event_red@3.png';
    final clock = 'assets/event/event_time@3.png';
    final prize = 'assets/event/event_prize@3.png';
    final people = 'assets/event/event_people@3.png';
    final color = Colors.grey;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _getIcon(clock),
                        Text(
                          '$startTime',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: color),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        _getIcon(prize),
                        SizedBox(
                            width: 180,
                            child: Text(
                              '$reward',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: color),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _getIcon(people),
                        Text('$remain'),
                        Text(' / $total',style: TextStyle(color: color),)
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        myStatus ? _getIcon(redButton) : _getIcon(greenButton),
                        Text(myStatus ? "已参赛" : "未参赛",
                            overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: myStatus?Colors.red:Colors.lightGreen
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getIcon(String icon) {
    return SizedBox(
        height: 14,
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Image.asset(icon),
        ));
  }

  String getStatusImage(Status s) {
    switch (s) {
      case Status.inGame:
        return 'assets/event/event_bsz.png';
      case Status.apply:
        return 'assets/event/event_bmz.png';
      case Status.end:
        return 'assets/event/event_yjs.png';
      default:
        return '';
    }
  }
}
