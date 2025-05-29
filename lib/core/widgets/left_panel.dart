// left_panel.dart
import 'package:allocation_work/core/widgets/chip_selector.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_event.dart';
import 'package:allocation_work/features/allocation/presentation/bloc/work_allocation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_field.dart';
import 'package:allocation_work/core/widgets/title_text_widget.dart';

class LeftPanel extends StatelessWidget {
  final List<String> elevationItems;
  final List<String> bandItems;
  final List<String> levelItems;

  const LeftPanel({
    required this.elevationItems,
    required this.bandItems,
    required this.levelItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
      builder: (context, state) {
        final bloc = context.read<WorkAllocationBloc>();

        final filteredElevation = elevationItems
            .where(
              (item) => item.toLowerCase().contains(
                state.elevationSearch.toLowerCase(),
              ),
            )
            .toList();

        final filteredBands = bandItems
            .where(
              (item) =>
                  item.toLowerCase().contains(state.bandSearch.toLowerCase()),
            )
            .toList();

        final filteredLevels = levelItems
            .where(
              (item) =>
                  item.toLowerCase().contains(state.levelSearch.toLowerCase()),
            )
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: "Elevation", fontSize: 22.0),
            const SizedBox(height: 10),
            // Search Field
            SearchField(
              hint: 'Search Elevation',
              onChanged: (val) => bloc.add(ElevationSearchUpdated(val)),
            ),
            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              hint: const Text("Select Elevation"),
              value: state.selectedElevation,
              items: elevationItems
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  bloc.add(ElevationSelected(value));
                }
              },
            ),

            const SizedBox(height: 20),
            TitleText(text: "Band", fontSize: 22.0),
            const SizedBox(height: 10),
            SearchField(
              hint: 'Search Band',
              onChanged: (val) => bloc.add(BandSearchUpdated(val)),
            ),
            const SizedBox(height: 10),
            ChoiceChipsSelector(
              items: filteredBands,
              selectedItems: state.selectedBands,
              onSelected: (band) => bloc.add(BandToggled(band)),
            ),
            const SizedBox(height: 20),
            TitleText(text: "Level", fontSize: 22.0),
            const SizedBox(height: 10),
            SearchField(
              hint: 'Search Level',
              onChanged: (val) => bloc.add(LevelSearchUpdated(val)),
            ),
            const SizedBox(height: 10),
            ChoiceChipsSelector(
              items: filteredLevels,
              selectedItems: state.selectedLevels,
              onSelected: (level) => bloc.add(LevelToggled(level)),
            ),
          ],
        );
      },
    );
  }
}
