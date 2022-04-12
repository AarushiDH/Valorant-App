import 'package:flutter/material.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps',
          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Center(
              child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://pbs.twimg.com/media/Ec_Bp0WWkAA1vmM.png')),
            ),
            Container(
              margin: EdgeInsets.all(14),
              child: Text(
                'Each match of VALORANT takes place on a map. Maps feature a spawn area for each team, barriers that limit accessible areas during the Buy Phase, and objective sites where the spike is to be planted. \nFour maps were available at launch, and a six-month cycle is expected for the release of new maps. \nThere are currently seven playable maps in VALORANT, with an additional one for practice and training new players.',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
