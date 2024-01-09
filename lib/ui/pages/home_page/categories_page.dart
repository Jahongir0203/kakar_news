import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/blocs/categories_bloc/categories_bloc.dart';
import 'package:kakar_news/data/services/network_service.dart';
import 'package:dio/dio.dart';

import '../../../data/utils/app_colors.dart';
import '../../../data/utils/app_png.dart';
import '../../widgets/app_textStyle.dart';
class CategoriesPage extends StatelessWidget {
   CategoriesPage({Key? key, required this.category}) : super(key: key);
final String category;
CategoriesBloc categoriesBloc=CategoriesBloc(NetworkService(Dio()));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoriesBloc,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc..add(CategoriesLoadedEvent(category)),
        builder: (context, state) {
          return Scaffold(
            body: buildAllCategoryBody(context, state),
          );
        },
      ),
    );
  }
   buildAllCategoryBody(BuildContext context, CategoriesState state) {
     if (state is CategoriesLoadInProgressState) {
       return const Center(
         child: CircularProgressIndicator(),
       );
     }
     if (state is CategoriesFailureState) {
       return const Center(
         child: Text('Error'),
       );
     }

     if(state is CategoriesLoadSuccessState){
       return SingleChildScrollView(
         physics: const NeverScrollableScrollPhysics(),
         scrollDirection: Axis.vertical,
         child: ListView.builder(
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: state.categoriesModel.articles?.length ?? 0,
           itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.only(top: 16,),
               child: SizedBox(
                 height: 115,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                         flex: 2,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8,right: 4,),
                           child: SizedBox(
                             height: 96,
                             width: 96,
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(6),
                               child: AspectRatio(
                                 aspectRatio: 1.6,
                                 child: BlurHash(
                                   hash: "L6PZfSi_.AyE_3t7t7R**0o#DgR4",
                                   imageFit: BoxFit.fill,
                                   image: state.categoriesModel
                                       .articles?[index].urlToImage ??
                                       'https://s.france24.com/media/display/d1676b6c-0770-11e9-8595-005056a964fe/w:1280/p:16x9/news_1920x1080.png',
                                 ),
                               ),
                             ),
                           ),
                         )),
                     Expanded(
                       flex: 5,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(vertical:8, ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               'USA',
                               style: buildTextStyle(
                                 color: AppColors.kGreyScale,
                                 fontSize: 13,
                                 fontWeight: FontWeight.w400,
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 4,),
                               child: Text(
                                 '${state.categoriesModel.articles![index].title}',
                                 maxLines:2,
                                 softWrap: false,
                                 overflow: TextOverflow.ellipsis,
                                 style: buildTextStyle(
                                   color: AppColors.kBlack,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                             ),
                             SizedBox(
                               height: 20,
                               child: Row(
                                 children: [
                                   Image.asset(
                                     AppPng.kBBC,
                                     height: 20,
                                     width: 20,
                                   ),
                                   const SizedBox(
                                     width: 4,
                                   ),
                                   Text(
                                     state.categoriesModel.articles?[index].source?.name?? 'Uch savdoyi',
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     style: buildTextStyle(
                                       color: AppColors.kGreyScale,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w600,
                                     ),),
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             );
           },
         ),
       );
     }

   }

}
