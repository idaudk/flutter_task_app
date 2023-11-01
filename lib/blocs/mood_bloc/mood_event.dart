part of 'mood_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderValueChanged extends SliderEvent {
  final double value;

  SliderValueChanged(this.value);

  @override
  List<Object> get props => [value];
}