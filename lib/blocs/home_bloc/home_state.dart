part of 'home_bloc.dart';

abstract class CalendarState extends Equatable {
  @override
  List<Object> get props => [];
}

class CalendarInitialState extends CalendarState {}
class CalendarUpdatedState extends CalendarState {}