import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favourite_provider.dart';
import '../providers/meal_provider.dart';
import 'mealscreen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const CategoryDetailScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealProvider>(context)
        .meals
        .where((meal) => meal.categoryIds.contains(categoryId))
        .toList();

    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 224, 224, 1),
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          final isFavorite =
          Provider.of<FavoriteProvider>(context).isFavorite(meal.id);

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealDetailScreen(meal: meal),
                ),
              );
            },
            child: Container(
              height: 250,
              width: 400,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 3),
                      Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Provider.of<FavoriteProvider>(context, listen: false)
                              .toggleFavorite(meal.id);
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 210,
                    width: 400,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}