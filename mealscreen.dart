import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meals_models.dart';
import '../providers/favourite_provider.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite =
    Provider.of<FavoriteProvider>(context).isFavorite(meal.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 5),
              child: Row(
                children: [
                  Text(
                    meal.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, _) {
                      final isFav = favoriteProvider.isFavorite(meal.id);
                      return IconButton(
                        onPressed: () {
                          favoriteProvider.toggleFavorite(meal.id);
                        },
                        icon: Icon(
                          isFav
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    meal.id,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              title: Text(meal.affordability),
              subtitle: Text(
                "Duration ${meal.duration} Minutes",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                meal.complexity,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: meal.ingredients
                    .map((ingredient) => Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    ingredient,
                    style: TextStyle(fontSize: 16),
                  ),
                ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Steps to Prepare',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            ...meal.steps.map((step) => ListTile(title: Text(step))).toList(),
          ],
        ),
      ),
    );
  }
}