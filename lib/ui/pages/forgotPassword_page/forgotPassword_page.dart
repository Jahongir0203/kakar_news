import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
static const routeName='/forgotPasswordPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/countryPage');
          },
          child: Text("Next"),
        ),
      ),
    );
  }
}
