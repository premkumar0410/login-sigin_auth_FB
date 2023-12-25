import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:login/mainpage.dart';
import 'package:login/login_screen.dart';


final theme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 9, 119, 162)));
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home:
        //firebase switch screen after login succesfully
         StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Mainpage();
            } else {
              return const LoginScreen();
            }
          },
        ));
  }
}
