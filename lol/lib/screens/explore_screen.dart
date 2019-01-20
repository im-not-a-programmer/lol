import 'package:flutter/material.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/people_tile.dart';
import '../widgets/lol_card.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with AutomaticKeepAliveClientMixin{


  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildSearchBar(),
          Expanded(child: _buildListBody(context))
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildSearchBar() {
    return SearchAppBar(
      '找人',
      '话题',
      _onFindTabTapped,
      _onTopicTabTapped,
      _onSearchButtonTapped,
    );
  }

  Widget _buildListBody(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return _status
              ? PeopleTile()
              : Padding(padding: EdgeInsets.all(8),child: LolCard(
          ),);
        });
  }

  _onFindTabTapped() {
    _status = true;
    setState(() {});
    print('find button pressed');
  }

  _onTopicTabTapped() {
    _status = false;
    setState(() {});
    print('topic button pressed');
  }

  _onSearchButtonTapped() {
    print('search button pressed');
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

