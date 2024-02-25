import 'package:blocpract/HomeView/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Counter Screen with BloC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(IncrementCounterEvent());
                  },
                  child: const Text('Increment')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(DecrementCounterEvent());
                  },
                  child: const Text('Decrement'))
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          child: const Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
