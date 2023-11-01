import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'home_event.dart';
part 'home_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarController calendarController;

  CalendarBloc()
      : calendarController = CalendarController(),
        super(CalendarUpdatedState()) {
    on<CalendarForwardEvent>(calendarSlide);
    on<CalendarBackwardEvent>(calendarSlide);
  }

  void calendarSlide(CalendarEvent event, Emitter<CalendarState> emit) {
    emit(CalendarInitialState());
    if (event is CalendarForwardEvent) {
      final currentDisplayDate = calendarController.displayDate;
      final nextMonth =
          DateTime(currentDisplayDate!.year, currentDisplayDate.month + 1);
      calendarController.displayDate = nextMonth;
      calendarController.forward;
      print('------------> forward');
      // print('forward ---------->  ' + nextMonth.toString());
      emit(CalendarUpdatedState());
    } else if (event is CalendarBackwardEvent) {
      final currentDate = calendarController.displayDate;
      final previousMonth =
          DateTime(currentDate!.year, currentDate.month - 1, currentDate.day);
      calendarController.displayDate = previousMonth;
      emit(CalendarUpdatedState());
    }
  }

  @override
  Future<void> close() {
    calendarController.dispose();
    return super.close();
  }
}



// class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
//   final CalendarController _calendarController = CalendarController();

//   CalendarBloc() : super(CalendarInitialState()) {
//     on<LoadCalendar>(mapEventToState);
//     on<SlideCalendarForward>(mapEventToState);
//   }

//   mapEventToState(CalendarEvent event, Emitter<CalendarState> emit) async* {
//     if (event is LoadCalendar) {
//       emit(CalendarLoadedState(_calendarController));
//     } else if (event is SlideCalendarForward) {
//       // Programmatically slide the calendar forward
//       _calendarController.forward;
//       emit(CalendarLoadedState(_calendarController));
//     }
//   }
// }


//  mapEventToState(CalendarEvent event, Emitter<CalendarState> emit) async* {
//     if (event is LoadCalendar) {
//       yield CalendarLoadedState(_calendarController);
//     } else if (event is SlideCalendarForward) {
//       // Programmatically slide the calendar forward
//       _calendarController.forward;
//       yield CalendarLoadedState(_calendarController);
//     }
//   }