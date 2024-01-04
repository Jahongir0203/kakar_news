import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit()
      : super(
          const LogInState(
            isVisible: false,
            isSaved: false,
          ),
        );

  isPasswordShown(bool isShown) {
    emit(
      state.copyWith(isVisible: !isShown),
    );
  }

  isPasswordSaved(bool isRemembered) {
    emit(
      state.copyWith(isSaved:isRemembered),
    );
  }
}
