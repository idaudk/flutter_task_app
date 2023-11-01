part of 'mood_reason_bloc.dart';

abstract class GridState extends Equatable {
  const GridState();

  @override
  List<Object> get props => [];
}

class GridInitial extends GridState {
  @override
  List<Object> get props => [];
}

class GridSelected extends GridState {
  final int selectedIndex;

  GridSelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
