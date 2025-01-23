import 'package:counter_app/views/bloc/counter/counter_bloc.dart';
import 'package:counter_app/views/bloc/themes/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAppPage extends StatefulWidget {
  const CounterAppPage({super.key, required this.title});

  final String title;

  @override
  State<CounterAppPage> createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //listening for a multiple of 5 event which is triggered after the state in the counter bloc
            //has checked for each count if its a multiple of 5
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterValueIsMultipleOf5) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('${state.count} is a a multiple of 5')));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        spacing: 10,
        children: [
          Expanded(
            child: SwitchListTile(
              value: context
                  .read<ThemeBloc>()
                  .darkModeFlag, //getter bool value obtained based on themeData
              title: Text('Dark Mode'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              //calling toggle dark theme event when switch is pressed
              onChanged: (value) =>
                  context.read<ThemeBloc>().add(ThemeToggle()),
            ),
          ),
          FloatingActionButton(
            //calling increment state event when button is pressed
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrement()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
