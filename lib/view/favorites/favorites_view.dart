import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskkk/controller/home_controller.dart';
import 'package:taskkk/view/home/widget/article_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Favorite Articles',
          style: GoogleFonts.podkova(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      body: Obx(() {
        final favorites =
            controller.articlesList
                .where((article) => article.isFavorite.value)
                .toList();

        if (favorites.isEmpty) {
          return Center(
            child: Text(
              "No favorites found",
              style: GoogleFonts.podkova(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return ArticlesCard(
              homeController: controller,
              articles: favorites,
            );
          },
        );
      }),
    );
  }
}
