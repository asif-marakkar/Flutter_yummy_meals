import 'package:flutter/material.dart';
import 'package:yummy_meals/models/meal.dart';
import 'package:yummy_meals/screens/meal_details.dart';
import 'package:yummy_meals/widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final List<Meal> meals;
  final String? title;

  void _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cxt) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    Widget content = meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (cxt, index) => MealListItem(
              meal: meals[index],
              onSelect: () => _onSelectMeal(context, meals[index]),
            ),
          )
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nothing here!',
                  style: textTheme.headlineLarge!.copyWith(
                    color: colorScheme.onBackground,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Try selecting a different category!',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onBackground,
                  ),
                )
              ],
            ),
          );
    return title == null
        ? content
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: content,
          );
  }
}
