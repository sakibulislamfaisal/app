import 'package:app/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => CounterCubit())],
        child: MaterialApp(
          title: 'My Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txtStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, state) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated)
                    ? Text(
                        state.counter.toString(),
                        style: txtStyle,
                      )
                    : Text("0", style: txtStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterIncrease();
                      },
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterDecrease();
                      },
                      child: const Icon(Icons.remove),
                    )
                  ],
                ),
              ],
            ));
          },
        ));
  }
}
