import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy_meals/providers/meals_provider.dart';

class FiltersNotifier extends StateNotifier<bool> {
  FiltersNotifier() : super(false);

  void setGlutenFree(bool value) {
    state = value;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, bool>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider(
  (ref) => ref
      .watch(mealsProvider)
      .where(
        (meal) => meal.isGlutenFree == ref.watch(filtersProvider),
      )
      .toList(),
);
