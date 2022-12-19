import 'package:flutter/material.dart';

class SnackBarClass {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      contentSnackBar(BuildContext context, List<int> itemList, int index) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(itemList.contains(index)
            ? 'Index added to favourite list'
            : 'Index removed from favourite list'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
