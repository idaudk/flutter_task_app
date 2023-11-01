part of 'mood_bloc.dart';

abstract class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {}

class SliderValueChangedState extends SliderState {
  final double value;

  SliderValueChangedState(this.value);

  @override
  List<Object> get props => [value];
}
