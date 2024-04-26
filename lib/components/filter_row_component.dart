import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  final List<String> filterOptions;
  final String selectedFilter;
  final String selectedViewMode;
  final Function(String) onFilterSelected;
  final Function(String) onViewModeSelected;

  FilterRow({
    required this.filterOptions,
    required this.selectedFilter,
    required this.selectedViewMode,
    required this.onFilterSelected,
    required this.onViewModeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final filter in filterOptions)
                  selectionFilterTab(
                      filter,
                      isSelected: filter == selectedFilter,
                      onTap: () => onFilterSelected(filter),
                    ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Row(
          children: [
            viewModeIcon(
              Icons.grid_view_rounded,
              'GridView',
              selectedViewMode == 'GridView',
                  () => onViewModeSelected('GridView'),
            ),
            viewModeIcon(
              Icons.list,
              'ListView',
              selectedViewMode == 'ListView',
                  () => onViewModeSelected('ListView'),
            ),
          ],
        ),
      ],
    );
  }

  Widget selectionFilterTab(String text, {bool isSelected = false, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.grey, // Border color
              width: 2.0, // Border width
            ),
            borderRadius:
            BorderRadius.circular(50), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.orange : Colors.grey,
                fontFamily: 'LatoBold',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget viewModeIcon(IconData icon, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: label == 'ListView' ? 36 : 30,
              color: isSelected ? Colors.orange : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}