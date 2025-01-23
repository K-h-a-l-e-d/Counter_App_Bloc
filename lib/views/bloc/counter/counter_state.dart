part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int count;

  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.count);
}

class CounterValueUpdate extends CounterState {
  const CounterValueUpdate(super.count);
}

class CounterValueIsMultipleOf5 extends CounterState {
  const CounterValueIsMultipleOf5(super.count);
}
