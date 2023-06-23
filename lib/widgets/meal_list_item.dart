import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yummy_meals/models/meal.dart';
import 'package:yummy_meals/widgets/meal_item_trait.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.meal,
    required this.onSelect,
  });
  final Meal meal;
  final void Function() onSelect;

  @override
  Widget build(context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onSelect(),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.work,
                          label: meal.complexity.name.capitalize,
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: meal.affordability.name.capitalize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
