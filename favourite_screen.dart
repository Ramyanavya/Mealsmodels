import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/favourite_provider.dart';
import 'mealscreen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Provider.of<FavoriteProvider>(context).favoriteMeals;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        color: const Color.fromARGB(255, 150, 193, 214),
        child: favoriteMeals.isEmpty
            ? Center(
          child: Text(
            "No favorites yet!",
            style: TextStyle(fontSize: 24),
          ),
        )
            : ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            final meal = favoriteMeals[index];
            final isFavorite = Provider.of<FavoriteProvider>(context)
                .isFavorite(meal.id);

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
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            meal.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<FavoriteProvider>(context,
                                listen: false)
                                .toggleFavorite(meal.id);
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      width: double.infinity,
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
      ),
    );
  }
}