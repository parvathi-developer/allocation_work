import 'package:allocation_work/core/widgets/left_panel.dart';
import 'package:allocation_work/core/widgets/right_panel.dart';
import 'package:allocation_work/core/widgets/title_text_widget.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkAllocationPage extends StatelessWidget {
  const WorkAllocationPage({super.key});

  static const List<String> elevationItems = [
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
    "4th Floor",
    "5th Floor",
  ];
  static const List<String> bandItems = [
    "E01 BH1",
    "E01 BH2",
    "E01 BV1",
    "E01 BV2",
  ];
  static const List<String> levelItems = [
    "Level 1",
    "Level 2",
    "Level 3",
    "Level 4",
  ];
  static const List<String> technicianItems = [
    "Naveen - C22061",
    "Raman - C22560",
    "Afzal - C22513",
    "Hosni - C14862",
    "Kumar - C22637",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkAllocationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const TitleText(
            text: 'Enter Work Allocation',
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: LeftPanel(
                            elevationItems: elevationItems,
                            bandItems: bandItems,
                            levelItems: levelItems,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  VerticalDivider(width: 1),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: RightPanel(technicianItems: technicianItems),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    final state = context.read<WorkAllocationBloc>().state;

                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Submitted Data"),
                        content: Text(
                          'Elevation: ${state.selectedElevation ?? 'None'}\n'
                          'Band: ${state.selectedBands.isEmpty ? 'None' : state.selectedBands.join(', ')}\n'
                          'Level: ${state.selectedLevels.isEmpty ? 'None' : state.selectedLevels.join(', ')}\n'
                          'Technician: ${state.selectedTechnicians.isEmpty ? 'None' : state.selectedTechnicians.join(', ')}\n'
                          'Type: ${state.selectedMode ?? 'None'}\n'
                          'Time: ${state.selectedTime?.format(context) ?? 'Not Selected'}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Submit All",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
