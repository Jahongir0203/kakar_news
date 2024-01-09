import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/app_png.dart';

class AuthorProfilePage extends StatelessWidget {
  const AuthorProfilePage({Key? key}) : super(key: key);
  static const routeName = '/authorProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert),
        ]
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children: [
              Image.asset(AppPng.kBBC,height: 100,width: 100,),
              Column(
                children: [
                  Text("1.2M",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Text("Followers",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
              Column(
                children: [
                  Text("124K",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Text("Following",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ), Column(
                children: [
                  Text("326",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Text("News",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            ],
          ),
          Text("    BBC News",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          Text("    is an aperational business division of the\n    British "
              "   Broadcasting Corrporation \n    for the gathering and "
              "broadcasting of news\n    and current affairs.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,width: 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),color: Colors.blue
                ),
                child: Text("Following",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              ), Container(
                height: 50,width: 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),color: Colors.blue
                ),
                child: Text("Following",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              ),
            ],
          )
        ],
      ),

    );
  }
}
