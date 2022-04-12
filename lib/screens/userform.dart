import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venatus_app/screens/myhomepage.dart';
import 'package:venatus_app/main.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerNo = TextEditingController();
  final controllerGame = TextEditingController();
  final controllerAgent = TextEditingController();

  void submit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    final user = Userr(
      name: controllerName.text,
      number: int.parse(controllerNo.text),
      gamename: controllerGame.text,
      agent: controllerAgent.text,
    );

    createUser(user);

    Navigator.pop(context);
  }

  Future createUser(Userr user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Create New Profile',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: controllerName,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    int.tryParse(value.toString()) != null
                        ? 'Enter a valid mobile number'
                        : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: controllerNo,
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'In Game Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: controllerGame,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Main Agent',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: controllerAgent,
                ),
              ),
              ElevatedButton(
                onPressed: submit,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );

  Stream<List<Userr>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Userr.fromJson(doc.data())).toList());
}

class Userr {
  String id;
  final String name;
  final int number;
  final String gamename;
  final String agent;

  Userr({
    this.id = '',
    required this.name,
    required this.number,
    required this.gamename,
    required this.agent,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
        'gamename': gamename,
        'agent': agent,
      };

  static Userr fromJson(Map<String, dynamic> json) => Userr(
        id: json['id'],
        name: json['name'],
        number: json['number'],
        gamename: json['gamename'],
        agent: json['agent'],
      );
}
