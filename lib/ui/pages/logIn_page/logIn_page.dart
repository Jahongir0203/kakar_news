import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);
static const routeName='/logInPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,width: 50,
          child: TextButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/countryPage' );
            },
            child: Text("Next"),
          ),
        ),
      ),
    );
  }
}
