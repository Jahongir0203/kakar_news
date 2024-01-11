part of 'authot_bloc.dart';

@immutable
abstract class AuthotState {}

class AuthotInitial extends AuthotState {}
class AuthotLoading extends AuthotState {}
class AuthotSucsess extends AuthotState {
  final AllCategoriesModel allCategoriesModel;

  AuthotSucsess(this.allCategoriesModel);
}
class AuthotFailur extends AuthotState {}
