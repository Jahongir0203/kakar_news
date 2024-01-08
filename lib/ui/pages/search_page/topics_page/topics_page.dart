import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/list.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

class SearchTopicsPage extends StatelessWidget {
  const SearchTopicsPage({Key? key}) : super(key: key);
  static const String routeName = '/topicsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: topicsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
            child: SizedBox(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: AspectRatio(
                            aspectRatio: 1.6,
                            child: BlurHash(
                              image: faker.image.image(
                                width: 70,
                                height: 70,
                              ),
                              imageFit: BoxFit.fill,
                              hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                            ),
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(width: 8,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topicsList[index],
                            style: buildTextStyle(
                              color: AppColors.kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting ''',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: buildTextStyle(
                              color: AppColors.kGreyScale,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.kPrimaryBlue),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: buildTextStyle(
                              color: AppColors.kPrimaryBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
