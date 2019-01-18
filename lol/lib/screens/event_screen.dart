import 'package:flutter/material.dart';
import '../widgets/game_card.dart';

class EventScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(

      body: Column(
        children: <Widget>[
          Container(
            height: top,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
                itemCount: 6,
                itemBuilder: (context,index){
                  return GameCard();
                }),
          )
        ],
      ),
    );
  }
}
