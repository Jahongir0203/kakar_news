import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakar_news/data/blocs/autor_bloc/author_bloc.dart';

import '../../../data/services/network_service.dart';


class Resent extends StatelessWidget {
  const Resent({super.key});

  @override
  Widget build(BuildContext context) {
    AuthorBloc authorBloc = AuthorBloc(NetworkService(Dio()));
    return BlocProvider(
      create: (context) => authorBloc..add(AuthorLoadedEvent()),
      child: BlocBuilder<AuthorBloc, AuthorState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                getBody(state),
              ],
            ),
          );
        },
      ),
    );
  }

  getBody(state) {
    if (state is AuthorLoading) {
      return CircularProgressIndicator();
    }
    if (state is AuthorSucsess) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.categoriesModel.articles?.length ?? 0,
        itemBuilder: (context, index) {
          return Text("${state.categoriesModel.articles?[index].title}");
        },
      );
    }
    if (state is AuthorFalur) {
      return Text("Error");
    }
  }
}
