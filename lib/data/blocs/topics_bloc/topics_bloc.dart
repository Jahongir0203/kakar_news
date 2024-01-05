import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'topics_event.dart';

part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc() : super(TopicsInitial()) {
    on<TopicsButtonLoadedEvent>((event, emit) {
      emit(TopicsButtonLoadSuccessState(event.index));
    });
  }
}
