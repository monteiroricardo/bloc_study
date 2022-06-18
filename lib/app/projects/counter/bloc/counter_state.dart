part of 'counter_bloc.dart';

abstract class CounterState {
  final int counter;
  CounterState(this.counter);
}

class CounterStateInitial extends CounterState {
  CounterStateInitial() : super(0);
}

class CounterStateChange extends CounterState {
  CounterStateChange(int counter) : super(counter);
}
