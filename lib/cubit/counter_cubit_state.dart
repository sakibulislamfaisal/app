import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable {
  const CounterCubitState();
}

class CounterInitiate extends CounterCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class CounterValueUpdated extends CounterInitiate {
  int counter;
  CounterValueUpdated({required this.counter});
  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
