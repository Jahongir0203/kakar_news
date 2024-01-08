import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../data/blocs/all_bloc/all_bloc.dart';

import '../../../data/services/network_service.dart';

class AllPage extends StatelessWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllBloc allBloc = AllBloc(NetworkService(Dio()));
    return BlocProvider(
      create: (context) => allBloc..add(AllLoadedEvent()),
      child: BlocBuilder<AllBloc, AllState>(
        builder: (context, state) {
          if (state is AllLoading) {
            return CircularProgressIndicator();
          } else if (state is AllSucsess) {
            return Scaffold(
              body: Container(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 170,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage("${state.trendingNewsModel.articles?.last.urlToImage ?? ""}"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("${state.trendingNewsModel.articles?.first.title ?? ""}"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is AllFailur) {
            return Text('Failed to load data');
          }
          return Container();
        },
      ),
    );
  }
}
