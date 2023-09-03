import 'package:enhanced_counter_app/counter_app/widgets/history_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_providers.dart';
import 'widgets/app_title.dart';

class RiverpodCounterAppBody extends ConsumerWidget {
  const RiverpodCounterAppBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using Riverpod Providers

    // .watch() is for watching a value for changes and update the UI
    // .read() is for a one time read, best for function/callbacks
    int counter = ref.watch(counterProvider);

    increment() {
      // Updating the counterProvider[contains the value] state
      ref.read(counterProvider.notifier).state++;
      ref
          .read(increaseHistoryProvider.notifier)
          .state
          .add(ref.read(counterProvider.notifier).state);
    }

    decrement() => ref.read(counterProvider.notifier).state--;

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
            HistoryRiverpod()
          ],
        ),
      ),
    );
  }
}
