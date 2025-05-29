// choice_chips_selector.dart
import 'package:flutter/material.dart';

class ChoiceChipsSelector extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<String> onSelected;

  const ChoiceChipsSelector({
    required this.items,
    required this.selectedItems,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: items.map((item) {
        final selected = selectedItems.contains(item);
        return ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
          selected: selected,
          showCheckmark: false,
          onSelected: (_) => onSelected(item),
          selectedColor: Colors.amber,
        );
      }).toList(),
    );
  }
}
