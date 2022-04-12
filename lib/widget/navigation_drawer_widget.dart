import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:venatus_app/page/agents.dart';
import 'package:venatus_app/page/gameinfo.dart';
import 'package:venatus_app/page/maps.dart';
import 'package:venatus_app/page/arsenal.dart';
import 'package:venatus_app/page/music.dart';
import 'package:venatus_app/page/contact.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:venatus_app/screens/agentscreen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    Future google_logout() async {
      final auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      try {
        googleSignIn.disconnect();
        googleSignIn.signOut();
        auth.signOut();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }

    final user = FirebaseAuth.instance.currentUser!;
    // TODO: implement build
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          buildMenuItem(
            text: 'Game Info',
            icon: Icons.videogame_asset,
            onClicked: () => selectedItem(context, 0),
          ),
          const SizedBox(height: 20),
          buildMenuItem(
            text: 'Agents',
            icon: Icons.face_retouching_natural,
            onClicked: () => selectedItem(context, 1),
          ),
          const SizedBox(height: 20),
          buildMenuItem(
              text: 'Maps',
              icon: Icons.map,
              onClicked: () => selectedItem(context, 2)),
          const SizedBox(height: 20),
          buildMenuItem(
            text: 'Arsenal',
            icon: Icons.stacked_line_chart_sharp,
            onClicked: () => selectedItem(context, 3),
          ),
          const SizedBox(height: 15),
          Divider(color: Colors.white),
          const SizedBox(height: 15),
          const SizedBox(height: 20),
          // buildMenuItem(
          //   text: 'Music',
          //   icon: Icons.music_note,
          //   onClicked: () => selectedItem(context, 4),
          // ),
          // const SizedBox(height: 20),
          buildMenuItem(
            text: 'Contact Us',
            icon: Icons.phone,
            onClicked: () => selectedItem(context, 5),
          ),

          Text(
            "\n\n\n\nSigned in as",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            user.email!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: google_logout,
            // FirebaseAuth.instance.signOut(),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 35,
              ),
              title: Text(
                '    Sign Out',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20),
              ),
              // child: ListTileIcon(Icons.run_circle),
              // style: ButtonStyle(),
              // label: Text(
              //   'Sign Out!',
              //   style: TextStyle(color: Colors.white),
              // )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GameInfo(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AgentScreen(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Maps(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Arsenal(),
        ));
        break;

      // case 4:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => Music(),
      //   ));
      //   break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contact(),
        ));
        break;

      default:
        ;
    }
  }
}
