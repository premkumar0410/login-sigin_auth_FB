import 'Package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPage();
}

class _ForgotPage extends State<ForgotPage> {
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
                    decoration: const InputDecoration(
                        hintText: ' Email', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //Submit button
            MaterialButton(
              onPressed: () {},
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
