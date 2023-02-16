import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favorteMeals;

  FavoritesScreen(this.favorteMeals);

  @override
  Widget build(BuildContext context) {
    if (favorteMeals.isEmpty){
      return const Center(
        child: Text("You have no favorite yet - start adding some."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: favorteMeals[index].id,
            title: favorteMeals[index].title,
            imageUrl: favorteMeals[index].imageUrl,
            duration: favorteMeals[index].duration,
            complexity: favorteMeals[index].complexity,
            affordability: favorteMeals[index].affordability,
          );
        },
        itemCount: favorteMeals.length,
      );
    }
  }
}
