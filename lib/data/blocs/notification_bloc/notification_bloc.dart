import 'package:bloc/bloc.dart';
import 'package:kakar_news/data/models/notification_model.dart';
import 'package:meta/meta.dart';

import '../../services/network_service.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NetworkService networkService;

  NotificationBloc(this.networkService) : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      emit(NotificationInitial());
      try {
        var response = await networkService
            .getNotifications('29397755bab44c4a861e2f85acd9d755');
        emit(NotificationLoadSuccessState(response));
      } catch (e) {
        print(e);
        emit(NotificationFailureState());
      }
    });
  }
}
