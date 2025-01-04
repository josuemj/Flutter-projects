import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.meal,
    required this.categoryColor,
    required this.onSelectedMeal,
  });

  final Meal meal;
  final Color categoryColor;
  final void Function(Meal meal, BuildContext context) onSelectedMeal;

  String get complexityText {
    return meal.complexity.name[0].toLowerCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toLowerCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        //Stack ignores shape
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge, // allows edge radius
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectedMeal(meal, context);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id, // unique id for widget
              child: FadeInImage(
                height: 200,
                width: double.infinity,
                // first widget on stack
                fit: BoxFit.cover, // adapts image size
                placeholder:
                    MemoryImage(kTransparentImage), // image while loading
                image: NetworkImage(
                    meal.imageUrl), // target image fetch from internet (url)
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true, //wrap text
                      overflow: TextOverflow
                          .ellipsis, //how text will be cutt off if too long
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        )
                      ],
                    )
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
