// technician_list.dart
import 'package:flutter/material.dart';

class TechnicianList extends StatelessWidget {
  final List<String> technicianItems;
  final List<String> selectedTechnicians;
  final ValueChanged<String> onTechnicianToggled;

  const TechnicianList({
    required this.technicianItems,
    required this.selectedTechnicians,
    required this.onTechnicianToggled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: technicianItems.map((tech) {
        final selected = selectedTechnicians.contains(tech);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: selected ? Colors.amber.shade300 : Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                tech,
                style: TextStyle(color: selected ? Colors.white : Colors.black),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onTap: () => onTechnicianToggled(tech),
            ),
          ),
        );
      }).toList(),
    );
  }
}
