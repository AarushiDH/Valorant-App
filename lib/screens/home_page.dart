import 'package:flutter/material.dart';
import '../widget/navigation_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'Valorant',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/valoo.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            // Text(
            //   '\n Venatus',
            //   style: TextStyle(color: Colors.white, fontSize: 50),
            // ),
          ],
        ));
  }
}
