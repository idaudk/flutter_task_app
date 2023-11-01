part of 'mood_reason_bloc.dart';

abstract class GridEvent extends Equatable {
  const GridEvent();

  @override
  List<Object> get props => [];
}

class SelectGridEvent extends GridEvent {
  final int selectedIndex;

  SelectGridEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
