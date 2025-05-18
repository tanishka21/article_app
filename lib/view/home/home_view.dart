import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskkk/controller/home_controller.dart';
import 'package:taskkk/view/favorites/favorites_view.dart';
import 'package:taskkk/view/home/widget/article_card.dart';
import 'package:taskkk/view/home/widget/search_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    final List<String> menu = ["Home", "Favorites"];
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Text(
                'Menu',
                style: GoogleFonts.podkova(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 2.3, endIndent: 12, indent: 12),

            ...menu.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: ListTile(
                  title: Text(
                    item,
                    style: GoogleFonts.podkova(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Get.back(); // close the drawer
                    // Optional: Navigation logic
                    if (item == "Home") {
                      Get.to(() => HomeView());
                    } else if (item == "Favorites") {
                      Get.to(() => FavoritesView());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Articles',
          style: GoogleFonts.podkova(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        child: Obx(
          () =>
              homeController.isLoading.value == true
                  ? Center(child: CircularProgressIndicator(color: Colors.blue))
                  : Column(
                    children: [
                      SearchInput(),
                      SizedBox(height: 30),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        width: double.infinity,
                        child: ArticlesCard(
                          articles: homeController.searchArticles.toList(),
                          homeController: homeController,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
