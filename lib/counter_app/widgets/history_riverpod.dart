import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod_providers.dart';

// ConsumerWidget is StatelessWidget for Riverpod
class HistoryRiverpod extends ConsumerWidget {
  HistoryRiverpod({super.key});
  final ScrollController _controller = ScrollController();

  // ref contains the Riverpod providers
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watching the ** increaseHistoryProvider ** from the * '../riverpod_providers.dart' *. Any change will automatically update the UI
    final List<int> increaseHistory = ref.watch(increaseHistoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        children: [
          const Text(
            'Increases counter',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
            // See How Scrollbar is done. controller in Scrollbar and ListViewBuilder must be the same
            child: Scrollbar(
              thickness: 10,
              thumbVisibility: true,
              controller: _controller,
              radius: const Radius.circular(10),
              child: ListView.separated(
                addAutomaticKeepAlives: false,
                controller: _controller,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: increaseHistory.length,
                itemBuilder: (_, index) => Text('${increaseHistory[index]}'),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
