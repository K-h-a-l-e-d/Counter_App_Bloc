import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(CounterInitial(0)) //setting the initial counter value as 0
  {
    on<CounterIncrement>(
      (event, emit) {
        //incrementing current state value then emitting the updated value to the state
        emit(CounterValueUpdate(state.count + 1));
        //checking if the current state value is a multiple of 5 if true the state  CounterValueIsMultipleOf5 is called
        //which will be used in a listener in counter app page to display a snackBar
        if (state.count % 5 == 0) {
          emit(CounterValueIsMultipleOf5(state.count));
        }
      },
    );
    on<CounterDecrement>(
      (event, emit) {
        //same scenario as mentioned above but instead it decrements the counter state value
        emit(CounterValueUpdate(state.count - 1));
        if (state.count % 5 == 0) {
          emit(CounterValueIsMultipleOf5(state.count));
        }
      },
    );
  }
}
