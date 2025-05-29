// State
import 'package:flutter/material.dart';

class WorkAllocationState {
  final String selectedMode;
  final List<String> selectedTechnicians;
  final TimeOfDay selectedTime;
  final List<String> selectedBands;
  final List<String> selectedLevels;
  final String? selectedElevation;

  final String elevationSearch;
  final String bandSearch;
  final String levelSearch;
  final String techSearch;

  WorkAllocationState({
    this.selectedMode = 'Individual',
    this.selectedTechnicians = const [],
    TimeOfDay? selectedTime,
    this.selectedBands = const [],
    this.selectedLevels = const [],
    this.selectedElevation,
    this.elevationSearch = '',
    this.bandSearch = '',
    this.levelSearch = '',
    this.techSearch = '',
  }) : selectedTime = selectedTime ?? TimeOfDay.now();

  WorkAllocationState copyWith({
    String? selectedMode,
    List<String>? selectedTechnicians,
    TimeOfDay? selectedTime,
    List<String>? selectedBands,
    List<String>? selectedLevels,
    String? selectedElevation,
    String? elevationSearch,
    String? bandSearch,
    String? levelSearch,
    String? techSearch,
  }) {
    return WorkAllocationState(
      selectedMode: selectedMode ?? this.selectedMode,
      selectedTechnicians: selectedTechnicians ?? this.selectedTechnicians,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedBands: selectedBands ?? this.selectedBands,
      selectedLevels: selectedLevels ?? this.selectedLevels,
      selectedElevation: selectedElevation ?? this.selectedElevation,
      elevationSearch: elevationSearch ?? this.elevationSearch,
      bandSearch: bandSearch ?? this.bandSearch,
      levelSearch: levelSearch ?? this.levelSearch,
      techSearch: techSearch ?? this.techSearch,
    );
  }
}
