import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mood_reason_event.dart';
part 'mood_reason_state.dart';

class GridBloc extends Bloc<GridEvent, GridState> {
  GridBloc() : super(GridInitial()) {
    on<SelectGridEvent>(onTap);
  }

  void onTap(SelectGridEvent event, Emitter<GridState> emit) {
    print('onTap called');
    if (state is GridSelected) {
      if ((state as GridSelected).selectedIndex == event.selectedIndex) {
        // Deselect the item if it's already selected
        emit(GridInitial());
      } else {
        // Select a new item and deselect the previous one
        emit(GridSelected(event.selectedIndex));
      }
    } else {
      // Select the item when none are selected
      emit(GridSelected(event.selectedIndex));
    }
  }
}
