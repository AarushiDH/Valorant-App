import 'package:flutter/material.dart';
import '../widget/navigation_drawer_widget.dart';

class Agents extends StatelessWidget {
  const Agents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Valorant',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: size.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'AGENTS\nGALLERY',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                        'https://wallpaperaccess.com/full/3717280.jpg')),
              ),
              Text(
                'REYNA\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                        'https://wallpaperaccess.com/full/3712605.jpg')),
              ),
              Text(
                'SAGE\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                        'https://i.pinimg.com/originals/ec/08/9f/ec089f2843413e89f0bfa4d4eab9a0e9.jpg')),
              ),
              Text(
                'PHOENIX\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                        'https://i.pinimg.com/originals/eb/1c/79/eb1c79ccadee18f531c241ee103f724b.jpg')),
              ),
              Text(
                'JETT\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://i.ytimg.com/vi/V2Qm-IPSQ74/maxresdefault.jpg'),
                ),
              ),
              Text(
                'YORU\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://images.hdqwalls.com/wallpapers/raze-valorant-4k-mf.jpg'),
                ),
              ),
              Text(
                'RAZE\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://i.pinimg.com/originals/91/13/43/9113436077b1a2cd2e39c4034269b425.jpg'),
                ),
              ),
              Text(
                'SOVA\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://i.ytimg.com/vi/SNx27IK5D1s/maxresdefault.jpg'),
                ),
              ),
              Text(
                'BREACH\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://i.ytimg.com/vi/pRI982rJwXg/maxresdefault.jpg'),
                ),
              ),
              Text(
                'SKYE\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://i.ytimg.com/vi/hZVuhRFShtU/maxresdefault.jpg'),
                ),
              ),
              Text(
                'OMEN\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://wallpaperaccess.com/full/5461262.jpg'),
                ),
              ),
              Text(
                'CYPHER\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      'https://vsthemes.org/uploads/posts/2020-08/1596889576_screenshot_4.jpg'),
                ),
              ),
              Text(
                'VIPER\n',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
