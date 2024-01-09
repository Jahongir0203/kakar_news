part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class NotificationLoadInProgressState extends NotificationState{}
class NotificationLoadSuccessState extends NotificationState{
  final NotificationModel notificationModel;

  NotificationLoadSuccessState(this.notificationModel);
}
class NotificationFailureState extends NotificationState{}
