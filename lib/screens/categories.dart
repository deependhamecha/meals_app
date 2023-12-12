import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {

    final filteredMeals = dummyMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));

    // Same as
    // Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        // This is a complex way of saying number of columns(grid)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20, // Vertical Gutter
          mainAxisSpacing: 20 // Horizontal Gutter
        ),
        children: [
          // Alternative: availableCategories.map((category) => CategoryGridItem(category: category).toList())
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: () {
              _selectCategory(context, category);
            },)
        ],
        )
    );
  }


}