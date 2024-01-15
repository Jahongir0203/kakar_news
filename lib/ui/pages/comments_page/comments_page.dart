import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);
  static const routeName = '/commentsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Comments',style: buildTextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.kBlack,),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              if ((index+1) % 2 == 1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 132,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 1.6,
                                child: BlurHash(
                                  hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                                  imageFit: BoxFit.fill,
                                  image: faker.image.image(
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wilson Franci',
                                  style: buildTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kBlack,
                                  ),
                                ),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: buildTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kGreyScale,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '4w',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '125',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    Text(
                                      'likes',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.reply),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'Reply',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 132,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width:55 ,),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 1.6,
                                child: BlurHash(
                                  hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                                  imageFit: BoxFit.fill,
                                  image: faker.image.image(
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wilson Franci',
                                  style: buildTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kBlack,
                                  ),
                                ),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: buildTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kGreyScale,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '4w',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '125',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    Text(
                                      'likes',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.reply),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'Reply',
                                      style: buildTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kGreyScale,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              }
            },
          ),
        ),
      ),
    );
  }
}
