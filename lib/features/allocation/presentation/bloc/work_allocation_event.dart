// Events
import 'package:flutter/material.dart';

abstract class WorkAllocationEvent {}

class ElevationSearchUpdated extends WorkAllocationEvent {
  final String search;
  ElevationSearchUpdated(this.search);
}

class BandSearchUpdated extends WorkAllocationEvent {
  final String search;
  BandSearchUpdated(this.search);
}

class LevelSearchUpdated extends WorkAllocationEvent {
  final String search;
  LevelSearchUpdated(this.search);
}

class TechSearchUpdated extends WorkAllocationEvent {
  final String search;
  TechSearchUpdated(this.search);
}

class ElevationSelected extends WorkAllocationEvent {
  final String? elevation;
  ElevationSelected(this.elevation);
}

class BandToggled extends WorkAllocationEvent {
  final String band;
  BandToggled(this.band);
}

class LevelToggled extends WorkAllocationEvent {
  final String level;
  LevelToggled(this.level);
}

class TechnicianToggled extends WorkAllocationEvent {
  final String technician;
  TechnicianToggled(this.technician);
}

class ModeChanged extends WorkAllocationEvent {
  final String mode;
  ModeChanged(this.mode);
}

class TimeSelected extends WorkAllocationEvent {
  final TimeOfDay time;
  TimeSelected(this.time);
}
