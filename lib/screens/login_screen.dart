import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/screens/forgot_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //registerpage  logic
  var _islogin = true;

  void _registerpage() {
    setState(() {
      _islogin = !_islogin;
    });
  }

  //text controllers
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  //text contoller for username
  final _usernamecontroller = TextEditingController();

  //sigin-signup logic
  Future sigin() async {
    if (_islogin) {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    } else {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              Icon(_islogin ? Icons.android : Icons.person, size: 100),
              const SizedBox(height: 25),

              //welcome pannel
              Text(
                _islogin ? 'Hello Again!' : 'Hello There',
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
              Text(
                _islogin
                    ? 'Welcome Back,You\'ve been missed'
                    : 'Register below with your details',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25),

              //username when in register page
              if (!_islogin)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _usernamecontroller,
                        decoration: const InputDecoration(
                            hintText: 'Username', border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 8),

              //useremail textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPage(),
                            ));
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ))
                ]),
              ),
              const SizedBox(height: 10),

              //sigin button
//style 1
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    backgroundColor: Colors.grey[200],
                  ),
                  onPressed: sigin,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(_islogin ? 'Sign in' : 'Sign up',
                        style: const TextStyle(fontSize: 18)),
                  ),
                ),
              ),
//style 2
              // GestureDetector(
              //   onTap: sigin,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Theme.of(context).colorScheme.primary,
              //           border: Border.all(color: Colors.white),
              //           borderRadius: BorderRadius.circular(12)),
              //       child: Padding(
              //           padding: const EdgeInsets.all(20),
              //           child: Center(
              //             child: Text('Sigin',
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyMedium!
              //                     .copyWith(
              //                         fontSize: 18,
              //                         color: Theme.of(context)
              //                             .colorScheme
              //                             .background)),
              //           )),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),

              //not an member? create one => only show when in login page

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _islogin ? 'Not an Member?' : 'Not an New Member!',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: _registerpage,
                    child: Text(
                      _islogin ? ' Register Now' : ' Login Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
