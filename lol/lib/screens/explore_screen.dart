import 'package:flutter/material.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/people_tile.dart';
import '../widgets/lol_card.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _BuildSearchBar(switchTabPage),
          Expanded(child: _BuildListBody(_status))
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  switchTabPage() {
    _status = !_status;
    setState(() {});
    print(11);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _BuildSearchBar extends StatelessWidget {
  final Function changePage;

  _BuildSearchBar(this.changePage);

  @override
  Widget build(BuildContext context) {
    return SearchAppBar(
      '找人',
      '话题',
      _onFindTabTapped,
      _onTopicTabTapped,
      _onSearchButtonTapped,
    );
  }

  _onFindTabTapped() {
    changePage();
    print('find button pressed');
  }

  _onTopicTabTapped() {
    changePage();
    print('topic button pressed');
  }

  _onSearchButtonTapped() {
    print('search button pressed');
  }
}

class _BuildListBody extends StatelessWidget {
  final bool status;

  _BuildListBody(this.status);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(4),
        itemCount: 20,
        itemBuilder: (context, index) {
          //todo:删除测试代码
          if (index % 2 != 0) {
            return status
                ? PeopleTile()
                : Padding(
                    padding: EdgeInsets.all(8),
                    child: LolCard(List.generate(
                        10, (index) => 'assets/home/home_photo1.png')),
                  );
          }

          return status
              ? PeopleTile()
              : Padding(
                  padding: EdgeInsets.all(8),
                  child: LolCard([]),
                );
        });
  }
}
