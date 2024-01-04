part of 'log_in_cubit.dart';

@immutable
class LogInState {
  final bool? isVisible;
  final bool? isSaved;

  const LogInState({this.isVisible, this.isSaved});

  LogInState copyWith({
    final bool? isVisible,
    final bool? isSaved,
  }) {
    return LogInState(
      isSaved: isSaved ?? this.isSaved,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
