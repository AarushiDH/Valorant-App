import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/myhomepage.dart';
import './widget/login.dart';
import './screens/auth_page.dart';
import 'screens/userform.dart';
import 'package:provider/provider.dart';
import './providers/checkform.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    // providers: [ChangeNotifierProvider(create: (ctx)=>CheckForm())],
    //child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
      },
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xffEB4A5F,
          const <int, Color>{
            50: const Color(0xffEB4A5F),
            100: const Color(0xffEB4A5F),
            200: const Color(0xffEB4A5F),
            300: const Color(0xffEB4A5F),
            400: const Color(0xffEB4A5F),
            500: const Color(0xffEB4A5F),
            600: const Color(0xffEB4A5F),
            700: const Color(0xffEB4A5F),
            800: const Color(0xffEB4A5F),
            900: const Color(0xffEB4A5F),
          },
        ),
        accentColor: Color(0xff0F1922),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      title: 'Venatus',
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: LinearProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else if (snapshot.hasData) {
              return MyHomePage();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
