import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/myhomepage.dart';
import 'package:venatus_app/main.dart';
import './sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future signIn() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => CircularProgressIndicator());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget build(BuildContext context) {
    Future<void> google_login() async {
      User user;
      final auth = FirebaseAuth.instance;
      final googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) => CircularProgressIndicator());
      try {
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          try {
            final UserCredential userCredential =
                await auth.signInWithCredential(credential);

            user = userCredential.user!;

            // ignore: avoid_print
            print("name =============== ${user.displayName}");
            // ignore: avoid_print
            print("uid =============== ${user.uid.toString()}");

            // if (userCredential.additionalUserInfo!.isNewUser) {
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (ctx) => const MyHomePage()),
            //   // );
            // } else {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (ctx) => MainScreen(),
            //   ),
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Signed in as ${user.email} !'),
                duration: const Duration(seconds: 2),
              ),
            );
            // }
          } on FirebaseAuthException catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Unable to sign in!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {}
      } catch (e) {
        print(e);
        rethrow;
      }

      // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 50),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(labelText: 'Email'),
              textInputAction: TextInputAction.next,
              controller: _emailController,
            ),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(labelText: 'Password'),
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              obscureText: true,
            ),
            ElevatedButton.icon(
              onPressed: signIn,
              icon: Icon(
                Icons.lock_open,
                size: 25,
              ),
              label: Text(
                'Sign In',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 24),
            RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  text: 'No account ?           ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
                child: Text(
              'OR',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
            SizedBox(
              height: 60,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: Text('Log in with Google'),
              onPressed: google_login,

              // final provider =
              //     Provider.of<GoogleSignInProvider>(context, listen: false);
              // provider.googleLogin;
            ),
          ],
        ),
      ),
    );
  }
}
