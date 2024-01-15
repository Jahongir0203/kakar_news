import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:kakar_news/data/blocs/avthor_bloc/authot_bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/services/network_service.dart';


class Resent extends StatelessWidget {
  const Resent({super.key});

  @override
  Widget build(BuildContext context) {
    AuthotBloc authotBloc = AuthotBloc(NetworkService(Dio()));
    return BlocProvider(
      create: (context) => authotBloc..add(AuthorLoadedEvent()),
      child: BlocBuilder<AuthotBloc, AuthotState>(
        builder: (context, state) {
          return Scaffold(
            body: getBody(state),
          );
        },
      ),
    );
  }

  getBody( state) {
    if (state is AuthotLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (state is AuthotSucsess) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.allCategoriesModel.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return Text("${state.allCategoriesModel.articles?[index].title}");
              },
            ),
          ],
        ),
      );
    }
    if (state is AuthotFailur) {
      return Text("Error");
    }
  }
}
