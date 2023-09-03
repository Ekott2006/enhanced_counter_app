import 'package:enhanced_counter_app/counter_app/counter_app_body.dart';
import 'package:enhanced_counter_app/counter_app/riverpod_counter_app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() => runApp(const ProviderScope(child: MyEnhancedCounterApp()));

class MyEnhancedCounterApp extends StatelessWidget {
  const MyEnhancedCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiverpodCounterAppBody(),
      // home: CounterAppBody(),
    );
  }
}
