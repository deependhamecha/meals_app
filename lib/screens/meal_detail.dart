import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {

  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
            onToggleFavorite(meal);
          }, icon: const Icon(Icons.star)),
        ],
      ),
      // body: Image(image: NetworkImage(meal.imageUrl)),
      // Alternative way
      body: SingleChildScrollView(
        child: Column(
            children: [
              Image.network(
              meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 14,),
            for(final ing in meal.ingredients)
              Text(
                ing, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,)
              ),
              const SizedBox(height: 24,),
              Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 14,),
              for(final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,)
                  ),
                ),
          ],
        ),
      )
    );
  }

}