import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeService {
  // Replace with your actual Spoonacular API key
  static const String _apiKey = '4c11480ab36f47a081cb061da9bb65e8';
  static const String _baseUrl = 'https://api.spoonacular.com/recipes';

  static Future<List<Recipe>> searchRecipes(String ingredient) async {
    if (_apiKey == 'YOUR_SPOONACULAR_API_KEY') {
      // Return mock data for demo purposes
      return _getMockRecipes();
    }

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/complexSearch?apiKey=$_apiKey&query=$ingredient&number=20'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Recipe> recipes = [];
        
        for (var recipeJson in data['results']) {
          recipes.add(Recipe.fromJson(recipeJson));
        }
        
        return recipes;
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error searching recipes: $e');
    }
  }

  static Future<RecipeDetail> getRecipeDetails(int recipeId) async {
    if (_apiKey == ' 4c11480ab36f47a081cb061da9bb65e8') {
      // Return mock data for demo purposes
      return _getMockRecipeDetail(recipeId);
    }

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$recipeId/information?apiKey=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return RecipeDetail.fromJson(data);
      } else {
        throw Exception('Failed to load recipe details');
      }
    } catch (e) {
      throw Exception('Error loading recipe details: $e');
    }
  }

  // Mock data for demo purposes
  static List<Recipe> _getMockRecipes() {
    return [
      Recipe(
        id: 1,
        title: 'Chicken Stir Fry',
        image: 'https://images.pexels.com/photos/1410235/pexels-photo-1410235.jpeg?auto=compress&cs=tinysrgb&w=400',
        readyInMinutes: 25,
        servings: 4,
        sourceUrl: 'https://example.com/recipe/1',
      ),
      Recipe(
        id: 2,
        title: 'Vegetable Pasta',
        image: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=400',
        readyInMinutes: 30,
        servings: 2,
        sourceUrl: 'https://example.com/recipe/2',
      ),
      Recipe(
        id: 3,
        title: 'Grilled Salmon',
        image: 'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=400',
        readyInMinutes: 20,
        servings: 2,
        sourceUrl: 'https://example.com/recipe/3',
      ),
      Recipe(
        id: 4,
        title: 'Caesar Salad',
        image: 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400',
        readyInMinutes: 15,
        servings: 4,
        sourceUrl: 'https://example.com/recipe/4',
      ),
    ];
  }

  static RecipeDetail _getMockRecipeDetail(int recipeId) {
    final recipes = {
      1: RecipeDetail(
        id: 1,
        title: 'Chicken Stir Fry',
        image: 'https://images.pexels.com/photos/1410235/pexels-photo-1410235.jpeg?auto=compress&cs=tinysrgb&w=800',
        readyInMinutes: 25,
        servings: 4,
        sourceUrl: 'https://example.com/recipe/1',
        summary: 'A delicious and quick chicken stir fry with fresh vegetables and a savory sauce.',
        ingredients: [
          '2 chicken breasts, sliced thin',
          '2 cups mixed vegetables (bell peppers, broccoli, carrots)',
          '2 tablespoons vegetable oil',
          '3 cloves garlic, minced',
          '2 tablespoons soy sauce',
          '1 tablespoon oyster sauce',
          '1 teaspoon sesame oil',
          '2 green onions, chopped',
        ],
        instructions: [
          'Heat vegetable oil in a large wok or skillet over high heat.',
          'Add chicken and stir-fry until cooked through, about 5-6 minutes.',
          'Add garlic and mixed vegetables, stir-fry for 3-4 minutes.',
          'Mix soy sauce, oyster sauce, and sesame oil in a small bowl.',
          'Pour sauce over chicken and vegetables, stir to combine.',
          'Garnish with green onions and serve immediately over rice.',
        ],
      ),
      2: RecipeDetail(
        id: 2,
        title: 'Vegetable Pasta',
        image: 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=800',
        readyInMinutes: 30,
        servings: 2,
        sourceUrl: 'https://example.com/recipe/2',
        summary: 'A colorful pasta dish loaded with fresh vegetables and herbs.',
        ingredients: [
          '8 oz pasta (penne or fusilli)',
          '1 zucchini, diced',
          '1 bell pepper, chopped',
          '1 cup cherry tomatoes, halved',
          '3 cloves garlic, minced',
          '1/4 cup olive oil',
          'Fresh basil leaves',
          'Salt and pepper to taste',
          'Parmesan cheese for serving',
        ],
        instructions: [
          'Cook pasta according to package directions until al dente.',
          'Heat olive oil in a large pan over medium heat.',
          'Add garlic and sauté for 1 minute until fragrant.',
          'Add zucchini and bell pepper, cook for 5 minutes.',
          'Add cherry tomatoes and cook for 3 more minutes.',
          'Drain pasta and add to the vegetable mixture.',
          'Toss with fresh basil, salt, and pepper.',
          'Serve with grated Parmesan cheese.',
        ],
      ),
    };

    return recipes[recipeId] ?? recipes[1]!;
  }
}