// right_panel.dart
import 'package:allocation_work/core/widgets/title_text_widget.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_event.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_field.dart';
import 'technician_list.dart';
import 'mode_toggle.dart';

class RightPanel extends StatelessWidget {
  final List<String> technicianItems;

  const RightPanel({required this.technicianItems, super.key});

  Future<void> _selectTime(
    BuildContext context,
    WorkAllocationBloc bloc,
    TimeOfDay initialTime,
  ) async {
    final time = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (time != null) {
      bloc.add(TimeSelected(time));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
      builder: (context, state) {
        final bloc = context.read<WorkAllocationBloc>();
        final filteredTechs = technicianItems
            .where(
              (item) =>
                  item.toLowerCase().contains(state.techSearch.toLowerCase()),
            )
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Technician', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            ModeToggle(
              selectedMode: state.selectedMode,
              onModeChanged: (mode) => bloc.add(ModeChanged(mode)),
            ),
            const SizedBox(height: 10),

            SearchField(
              hint: 'Search Technician',
              onChanged: (val) => bloc.add(TechSearchUpdated(val)),
            ),
            const SizedBox(height: 10),
            TechnicianList(
              technicianItems: filteredTechs,
              selectedTechnicians: state.selectedTechnicians,
              onTechnicianToggled: (tech) => bloc.add(TechnicianToggled(tech)),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Start Time: ", style: TextStyle(fontSize: 16)),
                    Text(
                      state.selectedTime.format(context),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),

                    SizedBox(
                      width: double.infinity, // Full-width button
                      child: ElevatedButton(
                        onPressed: () =>
                            _selectTime(context, bloc, state.selectedTime),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Rounded corners
                          ),
                        ),
                        child: const TitleText(
                          text: 'Add',
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
