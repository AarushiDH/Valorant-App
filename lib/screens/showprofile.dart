import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venatus_app/screens/myhomepage.dart';
import 'package:venatus_app/main.dart';
import 'userform.dart';
import '../widget/navigation_drawer_widget.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.grey[700],
        // body: FutureBuilder<Userr?>(
        //     future: readUser(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Text('Something went wrong!');
        //       } else if (snapshot.hasData) {
        //         final user = snapshot.data;

        //         return user == null
        //             ? Center(
        //                 child: Text(
        //                 'Fill the info',
        //                 style: TextStyle(color: Colors.white),
        //               ))
        //             : buildUser(user);
        //       } else {
        //         return Center(child: CircularProgressIndicator());
        //       }
        //     }),
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'User Profiles',
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserForm(),
                ));
              },
              icon: Icon(Icons.add),
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: StreamBuilder<List<Userr>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.white),
                );
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(
                  children: users.map(buildUser).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

  Widget buildUser(Userr user) => Card(
        color: Colors.white.withOpacity(0.9),
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                        fontFamily: 'Quicksand'),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      Text(
                        ' ${user.number}',
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    'In Game Name : ${user.gamename}\nMain Agent : ${user.agent}',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => Updatee(),
                  //     ));
                  //   },
                  //   icon: Icon(Icons.edit),
                  // ),
                  IconButton(
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.id);
                      docUser.delete();
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  // Future<Userr?> readUser() async {
  //   final docUser = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('wrYZJo646L1NM4aiot5v');
  //   final snapshot = await docUser.get();

  //   if (snapshot.exists) {
  //     return Userr.fromJson(snapshot.data()!);
  //   }
  // }

  Stream<List<Userr>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Userr.fromJson(doc.data())).toList());
}
