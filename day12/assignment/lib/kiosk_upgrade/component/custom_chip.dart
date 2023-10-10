import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../view/kiosk_screen.dart';

class CustomChips extends StatelessWidget {
  final List<String> selectedFoodList;
  final VoidCallback onDeleted;

  const CustomChips({
    required this.selectedFoodList,
    required this.onDeleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: selectedFoodList
          .mapIndexed(
            (index, e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Chip(
                  label: Text(
                    e.toString(),
                  ),
                  deleteIcon: Icon(Icons.cancel),
                  onDeleted: () {
                    selectedFoodList.removeAt(index);
                    onDeleted();
                  }),
            ),
          )
          .toList(),
    );
  }
}
