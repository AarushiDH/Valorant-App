import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'Game Info',
          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.3,
              margin: EdgeInsets.all(10),
              child: Image.network(
                'https://images3.alphacoders.com/120/thumb-1920-1202248.jpg',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(14),
            child: Text(
              'Valorant is a team-based first-person hero shooter set in the near future. Players play as one of a set of Agents, characters designed based on several countries and cultures around the world. In the main game mode, players are assigned to either the attacking or defending team with each team having five players on it. Agents have unique abilities, each requiring charges, as well as a unique ultimate ability that requires charging through kills, deaths, orbs, or objectives. Every player starts each round with a "classic" pistol and one or more "signature ability" charges.',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Quicksand', fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
