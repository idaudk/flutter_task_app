import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mood_event.dart';
part 'mood_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderValueChanged>(onValueChange);
  }

  void onValueChange(SliderEvent event, Emitter<SliderState> emit) {
    if (event is SliderValueChanged) {
      emit(SliderValueChangedState(event.value));
    }
  }
}
