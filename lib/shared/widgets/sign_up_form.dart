import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _size.width * 0.13,
      ),
      child: Form(
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email:",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password:",
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Confirm Password:",
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
