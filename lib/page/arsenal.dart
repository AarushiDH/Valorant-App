import 'package:flutter/material.dart';

class Arsenal extends StatelessWidget {
  const Arsenal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arsenal',
          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).accentColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                        'https://resource.supercheats.com/library/300w/2020/1587113348weaponsguide.webp')),
              ),
              Container(
                margin: EdgeInsets.all(14),
                child: Text(
                  'The store is composed of two sections: Featured and Offers. In both sections, players can buy weapon skins using Valorant Points that change the appearance of their weapon in-game. Valorant Points (VP) is an in-game currency that can only be purchased with real currency within the game client. The offers section of the store gives players the ability to buy four unowned skins and the four skins offered change randomly every 24 hours. The featured section of the store changes every two weeks. Most of the time, the featured section will have new skin releases from Riot, giving players a limited opportunity to buy them without having to wait for them to appear in the offers section.',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
