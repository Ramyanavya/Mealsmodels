import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mealmodels/providers/category_provider.dart';
import 'package:mealmodels/providers/favourite_provider.dart';
import 'package:mealmodels/providers/meal_provider.dart';
import 'package:mealmodels/screens/categoriesscreen.dart';
import 'package:mealmodels/screens/favourite_screen.dart';
import 'package:provider/provider.dart';




void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      DevicePreview(
          builder: (context)=>MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_)=> CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_)=> MealProvider(),
        ),
            ChangeNotifierProvider(
              create: (_)=> FavoriteProvider(),
            ),

      ],
          child: MyApp()
      )
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final allMealsList =
          Provider.of<MealProvider>(context, listen: false).meals;
      Provider.of<FavoriteProvider>(context, listen: false).allMeals =
          allMealsList;
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_outline_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(
                    categoryId: categories[index].id,
                    categoryName: categories[index].name,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(categories[index].color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  categories[index].name,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class ItemCategories {
  final String id;
  final String name;
  final int color;
  ItemCategories(this.id, this.name, this.color);
}
