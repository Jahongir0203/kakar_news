import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/notification_bloc/notification_bloc.dart';
import 'package:kakar_news/data/services/network_service.dart';
import 'package:kakar_news/data/utils/app_colors.dart';
import 'package:kakar_news/ui/widgets/app_textStyle.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);
  static const routeName = '/notificationPage';
  NotificationBloc notificationBloc = NotificationBloc(
    NetworkService(
      Dio(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => notificationBloc,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: notificationBloc
          ..add(
            NotificationLoadedEvent(),
          ),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Notification',
                style: buildTextStyle(
                  color: AppColors.kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            body: buildNotificationBody(context,state),
          );
        },
      ),
    );
  }

   buildNotificationBody(BuildContext context,NotificationState state) {
    if(state is NotificationInitial){
      return const Center(child: CircularProgressIndicator(),);
    }

    if(state is NotificationFailureState){
      return const Center(child: Text('Error'),);
    }

    if(state is NotificationLoadSuccessState){
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  faker.date.time(),
                  style: buildTextStyle(
                    color: AppColors.kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.kSourcesBG,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 14,
                            ),
                            child: Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.network(
                                  faker.image.image(
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.notificationModel.sources![index].description?? 'We will win',
                                  style: buildTextStyle(
                                    color: AppColors.kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      state.notificationModel.sources![index].name?? 'Uch Savdoyi',
                                      style: buildTextStyle(
                                        color: AppColors.kBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                   const Padding(
                                      padding:  EdgeInsets.only(left: 10,right: 6),
                                      child:  Icon(Icons.watch_later_outlined),
                                    ),
                                    Text(
                                      '1 h ago',
                                      style: buildTextStyle(
                                        color: AppColors.kGreyScale,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      );

    }
  }
}
