import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy_meals/providers/favorites_provider.dart';
import 'package:yummy_meals/providers/filters_provider.dart';
import 'package:yummy_meals/screens/categories.dart';
import 'package:yummy_meals/screens/filters.dart';
import 'package:yummy_meals/screens/meals.dart';
import 'package:yummy_meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (cxt) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    Widget activeScreen = CategoriesScreen(
      availableMeals: ref.watch(filteredMealsProvider),
    );
    var activeScreenTitle = 'Categories';
    if (_selectedIndex == 1) {
      activeScreenTitle = 'Your Favorites';
      activeScreen = MealsScreen(
        meals: ref.watch(favoriteMealsProvider),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(
        onSelectItem: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
      body: activeScreen,
    );
  }
}
