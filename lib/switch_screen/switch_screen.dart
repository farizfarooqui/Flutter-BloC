import 'package:blocpract/switch_screen/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch button with BloC'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notificaton'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print('Notificaton');
                    return Switch(
                        activeColor: Colors.amber,
                        value: state.isSwitch,
                        onChanged: (newvalue) {
                          context.read<SwitchBloc>.call()
                              .add(EnableOrDisableSwitchEvent());
                        });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  color: Colors.amber.withOpacity(state.slider),
                  width: double.maxFinite,
                  height: 300,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print('slider');
                return Slider(
                    activeColor: Colors.amber,
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: value));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
