import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/blocs/detailPage_bloc/detail_page_bloc.dart';
import 'package:kakar_news/data/models/detailPage_model.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/data/utils/app_png.dart';
import 'package:kakar_news/ui/pages/comments_page/comments_page.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.detailPageModel}) : super(key: key);
  final DetailPageModel detailPageModel;
  static const routeName = '/detailPage';
   int favorite = 678;
  final int comments = 89;
  List<int> indexs=[2,4,6];
  DetailPageBloc detailPageBloc = DetailPageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailPageBloc,
      child: BlocConsumer<DetailPageBloc, DetailPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex:3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        AppPng.kBBC,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 1.5,
                                            ),
                                            child: Text(
                                              detailPageModel.source ?? 'BBC News',
                                              overflow: TextOverflow.visible,
                                              maxLines: 1,
                                              style: buildTextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.kBlack),
                                            ),
                                          ),
                                          Text(
                                            '14m ago',
                                            style: buildTextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.kGreyScale),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if(indexs.contains(2)) {
                                    detailPageBloc
                                        .add(DetailPageFollowButtonLoadedEvent(1));
                                  }
                                  if(indexs.contains(1)) {
                                    detailPageBloc
                                        .add(DetailPageFollowButtonLoadedEvent(2));
                                  }
                                },
                                child: Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border:
                                          Border.all(color: AppColors.kPrimaryBlue),
                                      color: indexs.contains(1)
                                          ? AppColors.kWhite
                                          : AppColors.kPrimaryBlue,
                                    ),
                                    child: Center(
                                      child: Text(
                                       indexs.contains(2) ? 'Following':'UnFollow',
                                        style: buildTextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: indexs.contains(1)
                                              ? AppColors.kPrimaryBlue
                                              : AppColors.kWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: AspectRatio(
                          aspectRatio: 1.6,
                          child: BlurHash(
                            imageFit: BoxFit.fill,
                            hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                            image: detailPageModel.imageUrl ??
                                'https://s.france24.com/media/display/d1676b6c-0770-11e9-8595-005056a964fe/w:1280/p:16x9/news_1920x1080.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      detailPageModel.category ?? '',
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      detailPageModel.title ?? 'Uch Savdoyi',
                      style: buildTextStyle(
                        color: AppColors.kBlack,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      detailPageModel.body ?? 'Uch Savdoyi',
                      style: buildTextStyle(
                        color: AppColors.kGreyScale,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 78,
              width: MediaQuery.of(context).size.width,
              color: AppColors.kWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      IconButton(
                        onPressed: () {
                          if(indexs.contains(4)){
                            detailPageBloc.add(DetailPageFavoriteButtonLoadedEvent(3));
                          }
                          if(indexs.contains(3)){
                            detailPageBloc.add(DetailPageFavoriteButtonLoadedEvent(4));
                          }
                        },
                        icon: indexs.contains(3)?const Icon(Icons.favorite,color: AppColors.kRed,): const Icon(Icons.favorite_border),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '$favorite',
                        style: buildTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kHello_Clr,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CommentsPage.routeName);
                        },
                        icon: const Icon(Icons.comment),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '$comments',
                        style: buildTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kHello_Clr,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 45,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if(indexs.contains(6)){
                          detailPageBloc.add(DetailPageSaveButtonLoadedEvent(5));
                        }

                        if(indexs.contains(5)){
                          detailPageBloc.add(DetailPageSaveButtonLoadedEvent(6));
                        }
                      },
                      icon:indexs.contains(5) ?const Icon(Icons.bookmark,color: AppColors.kPrimaryBlue,) :const Icon(Icons.bookmark_border),
                    ),
                  ),
                ],
              ),
            ),
          );
        }, listener: (BuildContext context, DetailPageState state) {
          if(state is DetailPageFollowState){
            indexs.removeWhere((element) => element==2);
            indexs.add(1);
          }

          if(state is DetailPageUnFollowState){
            indexs.removeWhere((element) => element==1);
            indexs.add(2);
          }

          if(state is DetailPageFavoriteState){
            indexs.removeWhere((element) => element==4);
            indexs.add(3);
            favorite=favorite+1;
          }

          if(state is DetailPageUnFavoriteState){
            indexs.removeWhere((element) => element==3);
            indexs.add(4);
            favorite=favorite-1;
          }

          if(state is DetailPageSavedState){
            indexs.removeWhere((element) => element==6);
            indexs.add(5);
          }

          if(state is DetailPageUnSavedState){
            indexs.removeWhere((element) => element==5);
            indexs.add(6);
          }
      },
      ),
    );
  }
}
