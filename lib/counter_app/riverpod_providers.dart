import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers are just like a const variable holding a value, but it can be updated, stream, and change the UI
// StateProvider is best for simple states
final StateProvider<int> counterProvider = StateProvider((ref) => 0);
final StateProvider<List<int>> increaseHistoryProvider =
    StateProvider((ref) => []);
