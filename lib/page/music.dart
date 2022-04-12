import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music',
          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[700],
        child: Column(
          children: const [
            Text(
              'Game Info',
              style: TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
