import 'package:blocpract/My%20Counter/bloc/my_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyCounterScreen extends StatefulWidget {
  const MyCounterScreen({super.key});
  @override
  State<MyCounterScreen> createState() => _MyCounterScreenState();
}
class _MyCounterScreenState extends State<MyCounterScreen> {
  @override
  void initState() {
    myCounterBloc.add(MyCounterIncrementEvent());
    super.initState();
  }
  MyCounterBloc myCounterBloc = MyCounterBloc();
  @override
  Widget build(BuildContext context) {
    print('Main screen rebuiling');
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('Rebuilding name');
              },
              child: const Text(
                'Hello From Fariz !',
                style: TextStyle(fontSize: 30),
              ),
            ),
            BlocBuilder<MyCounterBloc, MyCounterState>(
              bloc: myCounterBloc,
              builder: (context, state) {
                if (state is MyCounterIncrementState) {
                  print('Main text rebuiling');
                  return TextButton(
                    onPressed: () {
                      print('Rebuilding counter');
                    },
                    child: Text(
                      myCounterBloc.val.toString(),
                      style: const TextStyle(fontSize: 40),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.amber,
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myCounterBloc.add(MyCounterIncrementEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
