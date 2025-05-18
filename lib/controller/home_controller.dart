// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskkk/model/article_model.dart';
import 'package:taskkk/repository/api_repo.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  /// original full list
  RxList<ArticleModel> articlesList = <ArticleModel>[].obs;

  /// filtered list for search
  RxList<ArticleModel> searchArticles = <ArticleModel>[].obs;

  ///Favurite articles list
  RxSet<int> favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  /// Fetch articles from API
  fetchArticles() async {
    try {
      isLoading(true);
      var articlesData = await ApiRepo().fetchData();

      articlesList.assignAll(articlesData);
      searchArticles.assignAll(articlesData);
    } catch (e) {
      print('Error fetching user data $e');
    } finally {
      isLoading(false);
    }
  }

  /// Search articles by title or body
  void search(String query) {
    if (query.isEmpty) {
      searchArticles.assignAll(articlesList);
    } else {
      searchArticles.assignAll(
        articlesList.where((article) {
          final title = article.title.toLowerCase();
          final body = article.body.toLowerCase();
          final input = query.toLowerCase();

          return title.contains(input) || body.contains(input);
        }),
      );
    }
  }

  /// Toggle favorite status and persist
  void toggleFavorite(int id) async {
    int index = articlesList.indexWhere((article) => article.id == id);
    if (index != -1) {
      final article = articlesList[index];
      article.isFavorite.value = !article.isFavorite.value;

      // Update favoriteIds set
      if (article.isFavorite.value) {
        favoriteIds.add(article.id);
      } else {
        favoriteIds.remove(article.id);
      }

      articlesList[index] = article; // update list
      articlesList.refresh();
      await saveFavorites();
    }
  }

  /// Save favorite IDs in SharedPreferences
  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorite_ids',
      favoriteIds.map((id) => id.toString()).toList(),
    );
  }

  /// Load favorite IDs from SharedPreferences
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedIds = prefs.getStringList('favorite_ids');
    if (storedIds != null) {
      favoriteIds.addAll(storedIds.map(int.parse));
    }
  }

  /// Get favorite articles
  List<ArticleModel> get favorites =>
      articlesList.where((a) => a.isFavorite.value).toList();
}
