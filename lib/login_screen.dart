import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            const Icon(Icons.android, size: 100),
            const SizedBox(height: 25),

            //welcome pannel
            Text(
              'Hello Again!',
              style: GoogleFonts.bebasNeue(fontSize: 50),
            ),
            const Text(
              'Welcome Back,You\'ve been missed',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            //useremail textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            //userpassword textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            //sigin button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text('Sigin',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background)),
                    )),
              ),
            ),
            const SizedBox(height: 10),

            //not an member? create one
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not an Member?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  ' Register Now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
