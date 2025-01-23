import 'package:counter_app/views/bloc/themes/theme_bloc.dart';
import 'package:counter_app/views/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/counter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //providing a theme bloc to obtain theme state here in the main
    //and to trigger dark Mode Event in the counter page Switch widget which toggles the state between light & dark theme
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) {
          return MaterialApp(
            title: 'Counter App',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: BlocProvider(
              //providing a counter bloc of to obtain the counter value from state in counter page
              //and to trigger increment & decrement Events in the counter page's floating action button
              //widgets increments and decrements the state value
              create: (context) => CounterBloc(),
              child: const CounterAppPage(title: 'Counter App'),
            ),
          );
        },
      ),
    );
  }
}
