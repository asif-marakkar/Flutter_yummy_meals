import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy_meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: ref.watch(filtersProvider),
            onChanged: (isOn) {
              ref.read(filtersProvider.notifier).setGlutenFree(isOn);
            },
            title: Text(
              'Gluten-free',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            activeColor: colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
