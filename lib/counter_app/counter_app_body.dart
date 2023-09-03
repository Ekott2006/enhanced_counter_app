import 'package:enhanced_counter_app/counter_app/widgets/app_title.dart';
import 'package:enhanced_counter_app/counter_app/widgets/history.dart';
import 'package:flutter/material.dart';

class CounterAppBody extends StatefulWidget {
  const CounterAppBody({super.key});

  @override
  State<CounterAppBody> createState() => _CounterAppBodyState();
}

class _CounterAppBodyState extends State<CounterAppBody> {
  // Creating two variables
  int counter = 0;
  List<int> increaseHistory = [];

  increment() => setState(() {
        counter++;
        // Creating a new instance of List instead of editing it
        increaseHistory = List.from(increaseHistory)..add(counter);
      });
  decrement() => setState(() => counter--);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title Widget
            const AppTitle(),

            //  Counter Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  child: const Text('-'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text('$counter'),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: increment,
                  child: const Text('+'),
                ),
              ],
            ),

            // History Widget
            HistoryWidget(increaseHistory: increaseHistory),
          ],
        ),
      ),
    );
  }
}
