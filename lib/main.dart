import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart'; // Import CartProvider
import 'package:store/screens/CartPage.dart';
import 'package:store/screens/CategoryPage.dart';
import 'package:store/screens/Homepage.dart';
import 'package:store/screens/details.dart';
import 'package:store/screens/login.dart';
import 'package:store/screens/signup.dart';
import 'package:store/screens/CategoryPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-key'),
  );


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print(user == null ? 'User is currently signed out!' : 'User is signed in!');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? Loginpage() : Homepage(),
      routes: {
        "home": (context) => Homepage(),
        "login": (context) => Loginpage(),
        "signup": (context) => Signup(),
        "cart" :(context) => CartPage(),

      },
    );
  }
}
