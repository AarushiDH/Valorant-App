import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        width: double.infinity,
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(14),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              title: Text(
                'aarushidh1306@gmail.com',
                style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: Text(
                '+91-8930647997',
                style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
