import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectItem});

  final void Function(String identifier) onSelectItem;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: colorScheme.primary,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onBackground,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectItem('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onBackground,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectItem('filters');
            },
          ),
        ],
      ),
    );
  }
}
