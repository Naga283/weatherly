import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSearchFieldDisplayStateProvider =
    StateProvider.autoDispose<bool>((ref) {
  return false;
});
