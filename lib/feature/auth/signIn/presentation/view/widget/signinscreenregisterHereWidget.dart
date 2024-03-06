import 'package:flutter/material.dart';
import 'package:mini_social_app/feature/auth/signUp/presentation/view/signUpScreen.dart';

class SigninCcreenRegisterHereWidget extends StatelessWidget {
  const SigninCcreenRegisterHereWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Register Here",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
