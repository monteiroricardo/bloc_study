import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterBloc _counterBloc;

  @override
  void initState() {
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              bloc: _counterBloc,
              builder: (context, state) {
                return Text(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  state.counter.toString(),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _counterBloc.add(CounterIncrement());
                  },
                  child: const Text(
                    'ADICIONAR',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _counterBloc.add(CounterDecrement());
                  },
                  child: const Text(
                    'REMOVER',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
