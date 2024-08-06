// lib/features/dog_breeds/presentation/widgets/grouped_list_view.dart
import 'package:flutter/material.dart';
import 'package:project_zinc/core/extentions/string_ext.dart';

class GroupedListView extends StatelessWidget {
  final Map<String, List<String>> groupedItems;
  final Function(String) onTap;

  const GroupedListView({
    super.key,
    required this.groupedItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sortedKeys = groupedItems.keys.toList()..sort();

    return ListView.builder(
      itemCount: sortedKeys.length,
      itemBuilder: (context, index) {
        final key = sortedKeys[index];
        final items = groupedItems[key]!;

        return ExpansionTile(
          title: Text(key.capitalizeFirstLetter()),
          children: items
              .map((item) => ListTile(
                    title: Text(item.capitalizeFirstLetter()),
                    leading: CircleAvatar(
                      child: Text(key.capitalizeFirstLetter()),
                    ),
                    onTap: () => onTap(item),
                  ))
              .toList(),
        );
      },
    );
  }
}
