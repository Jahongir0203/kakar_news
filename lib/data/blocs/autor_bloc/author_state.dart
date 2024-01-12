part of 'author_bloc.dart';

@immutable
abstract class AuthorState {}

class AuthorInitial extends AuthorState {}
class AuthorLoading extends AuthorState {}
class AuthorSucsess extends AuthorState {
  final CategoriesModel categoriesModel;

  AuthorSucsess(this.categoriesModel);
}
class AuthorFalur extends AuthorState {}
