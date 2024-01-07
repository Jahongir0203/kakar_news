import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);
 static const routeName='/explorePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,width: 90,
        color: Colors.green,
      ),
    );
  }
}
