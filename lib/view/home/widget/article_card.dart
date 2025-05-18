import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskkk/controller/home_controller.dart';
import 'package:taskkk/view/article_details/article_details_screen.dart';
import 'package:basics/basics.dart';

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({
    super.key,
    required this.articles,
    this.index,
    required this.homeController,
  });

  final HomeController homeController;
  final List articles;

  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      /// Pull-to-refresh
      child: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () => homeController.fetchArticles(),

        /// List of Card
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 233, 230, 230),
              elevation: 3,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              child: Row(
                spacing: 2,
                children: [
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: const Color.fromARGB(255, 150, 146, 146),
                    child: Text(
                      '${articles[index].id}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                            icon: Icon(
                              articles[index].isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  articles[index].isFavorite.value
                                      ? Colors.red
                                      : Colors.grey,
                            ),
                            onPressed: () {
                              homeController.toggleFavorite(articles[index].id);

                              // homeController.toggleFavorite(index);
                            },
                          ),
                          onTap: () {
                            Get.to(
                              () => ArticleDetailsScreen(
                                article: articles[index],
                              ),
                            );
                          },

                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              style: GoogleFonts.podkova(
                                fontSize: 20,
                                height: 1,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              articles[index].title,
                            ),
                          ),

                          subtitle: Text(
                            textAlign: TextAlign.start,
                            style: GoogleFonts.podkova(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),

                            overflow: TextOverflow.ellipsis,
                            articles[index].body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
