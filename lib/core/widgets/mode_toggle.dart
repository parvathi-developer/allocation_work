// mode_toggle.dart
import 'package:flutter/material.dart';

class ModeToggle extends StatelessWidget {
  final String selectedMode;
  final ValueChanged<String> onModeChanged;

  const ModeToggle({
    required this.selectedMode,
    required this.onModeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onModeChanged('Team'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: selectedMode == 'Team'
                    ? Colors.black
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    'Team',
                    style: TextStyle(
                      color: selectedMode == 'Team'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(width: 1, height: 40, color: Colors.black),
          Expanded(
            child: GestureDetector(
              onTap: () => onModeChanged('Individual'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: selectedMode == 'Individual'
                    ? Colors.black
                    : Colors.transparent,
                child: Center(
                  child: Text(
                    'Individual',
                    style: TextStyle(
                      color: selectedMode == 'Individual'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
