import 'package:blocpract/person.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Equatable package'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text('Print'),
          onPressed: () {
            Person person1 = Person(name: 'Fariz', age: 21);
            Person person2 = Person(name: 'Fariz', age: 21);
            print(person1.hashCode);
            print(person2.hashCode);
            print(person1 == person2);
          }),
    );
  }
}
