import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc()
      : super(ThemeData.dark()) //setting the initial value as dark theme
  {
    //toggling the current state and emitting the toggled value to be the new state
    on<ThemeToggle>((event, emit) =>
        emit(state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark()));
  }

  //making a getter boolean value to be assigned to the value property in the Switch widget in counter app page
  bool get darkModeFlag => state == ThemeData.dark();
}
