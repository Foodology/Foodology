class Recipe {
  final String id;
  final RecipeData data;

  Recipe({this.id,
    this.data});
}

class RecipeData {
  final String author;
  final String title;
  final double authorRating;
  final String detailedSummary;
  final double recipeRating;
  final String summary;

  RecipeData({
    this.author,
    this.title,
    this.authorRating,
    this.detailedSummary,
    this.recipeRating,
    this.summary});
}