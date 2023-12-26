
import 'Package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPage();
}

class _ForgotPage extends State<ForgotPage> {
//text controller
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future _passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //icon for forgot password
            const Icon(Icons.email, size: 100),
            const SizedBox(height: 50),

            //communicate with user for steps to do
            const Text(
              'Enter you Email To send password Reset Link',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            //ask email to verify
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[400],
                  ),
                  child: TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                        hintText: ' Email', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //Submit button
            MaterialButton(
              onPressed: _passwordReset,
              color: Theme.of(context).colorScheme.primary,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
        ));
  }
}
