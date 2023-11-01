part of 'home_bloc.dart';

abstract class CalendarEvent {}

class CalendarForwardEvent extends CalendarEvent {}
class CalendarBackwardEvent extends CalendarEvent {}