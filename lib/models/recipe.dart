class Recipe {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      readyInMinutes: json['readyInMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      sourceUrl: json['sourceUrl'] ?? '',
    );
  }
}

class RecipeDetail {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;
  final String summary;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeDetail({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.summary,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeDetail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    if (json['extendedIngredients'] != null) {
      for (var ingredient in json['extendedIngredients']) {
        ingredients.add(ingredient['original'] ?? '');
      }
    }

    List<String> instructions = [];
    if (json['analyzedInstructions'] != null && 
        json['analyzedInstructions'].isNotEmpty) {
      var steps = json['analyzedInstructions'][0]['steps'];
      for (var step in steps) {
        instructions.add(step['step'] ?? '');
      }
    }

    return RecipeDetail(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      readyInMinutes: json['readyInMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      sourceUrl: json['sourceUrl'] ?? '',
      summary: json['summary'] ?? '',
      ingredients: ingredients,
      instructions: instructions,
    );
  }
}