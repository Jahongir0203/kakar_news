import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);
  static const routeName = '/explorePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  "Explore",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Topic",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                  Text("See all",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                ],
              )
            ]
            )
        )
    );
  }
}
