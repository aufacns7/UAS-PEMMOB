import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Import Firebase Auth
import 'package:uas_152020109/presentation/pages/sign_up_page.dart';
import 'package:uas_152020109/presentation/pages/login_page.dart';
import 'package:uas_152020109/presentation/pages/home_page.dart';
import 'package:uas_152020109/features/app/splash_screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDkDlnzA9spmpNkX3_zzN2xcP7ACODWLZo",
        appId: "1:836208179041:web:b99c86328cb79ca3317720",
        messagingSenderId: "836208179041",
        projectId: "flutter-login-a04be",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
