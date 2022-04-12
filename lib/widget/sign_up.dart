import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:venatus_app/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:venatus_app/screens/myhomepage.dart';
import 'package:venatus_app/screens/userform.dart';
import 'package:provider/provider.dart';
import '../providers/checkform.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    // final formData = Provider.of<CheckForm>(context);
    Future signUp() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) => CircularProgressIndicator());

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final User? user = FirebaseAuth.instance.currentUser;
        final uid = user!.uid;

        if (user.uid.isNotEmpty) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserForm()),
          );
        }
      } on FirebaseAuthException catch (e) {
        print(e);
      }

      // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    Future<void> google_login() async {
      User user;
      final auth = FirebaseAuth.instance;
      final googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
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

            if (userCredential.additionalUserInfo!.isNewUser) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (ctx) => const MyHomePage()),
              // );
            } else {
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
            }
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
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 50),
              TextFormField(
                cursorColor: Colors.white,
                decoration: InputDecoration(labelText: 'Email'),
                textInputAction: TextInputAction.next,
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: InputDecoration(labelText: 'Password'),
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => password != null && password.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
              ),
              ElevatedButton.icon(
                onPressed: signUp,
                icon: const Icon(
                  Icons.lock_open,
                  size: 25,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                    text: 'Already have an account ?    ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Log In',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          // ignore: deprecated_member_use
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
      ),
    );
  }
}
