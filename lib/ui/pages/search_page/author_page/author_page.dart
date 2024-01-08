import 'package:flutter/material.dart';
import 'package:kakar_news/data/utils/list.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);
  static const String routeName = '/authorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        itemCount: icNewsSources.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 24,
              left: 24,
            ),
            child: SizedBox(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            icNewsSources[index],
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
