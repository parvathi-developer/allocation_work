import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_event.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkAllocationBloc
    extends Bloc<WorkAllocationEvent, WorkAllocationState> {
  WorkAllocationBloc() : super(WorkAllocationState()) {
    on<ElevationSearchUpdated>((event, emit) {
      emit(state.copyWith(elevationSearch: event.search));
    });

    on<BandSearchUpdated>((event, emit) {
      emit(state.copyWith(bandSearch: event.search));
    });

    on<LevelSearchUpdated>((event, emit) {
      emit(state.copyWith(levelSearch: event.search));
    });

    on<TechSearchUpdated>((event, emit) {
      emit(state.copyWith(techSearch: event.search));
    });

    on<ElevationSelected>((event, emit) {
      emit(state.copyWith(selectedElevation: event.elevation));
    });

    on<BandToggled>((event, emit) {
      final newBands = List<String>.from(state.selectedBands);
      if (newBands.contains(event.band)) {
        newBands.remove(event.band);
      } else {
        newBands.add(event.band);
      }
      emit(state.copyWith(selectedBands: newBands));
    });

    on<LevelToggled>((event, emit) {
      final newLevels = List<String>.from(state.selectedLevels);
      if (newLevels.contains(event.level)) {
        newLevels.remove(event.level);
      } else {
        newLevels.add(event.level);
      }
      emit(state.copyWith(selectedLevels: newLevels));
    });

    on<TechnicianToggled>((event, emit) {
      final newTechs = List<String>.from(state.selectedTechnicians);
      if (newTechs.contains(event.technician)) {
        newTechs.remove(event.technician);
      } else {
        newTechs.add(event.technician);
      }
      emit(state.copyWith(selectedTechnicians: newTechs));
    });

    on<ModeChanged>((event, emit) {
      emit(state.copyWith(selectedMode: event.mode));
    });

    on<TimeSelected>((event, emit) {
      emit(state.copyWith(selectedTime: event.time));
    });
  }
}
