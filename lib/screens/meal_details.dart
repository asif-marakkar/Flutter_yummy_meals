import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy_meals/models/meal.dart';
import 'package:yummy_meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavorite(meal);
              _showInfoMessage(
                  context,
                  isAdded
                      ? 'Meal added as a favorite.'
                      : 'Meal removed from favorites.');
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onBackground,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
