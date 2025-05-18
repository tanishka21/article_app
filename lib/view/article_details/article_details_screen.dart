import 'package:basics/basics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article Details',
          style: GoogleFonts.podkova(fontWeight: FontWeight.bold, fontSize: 34),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromARGB(255, 150, 146, 146),
                child: Text(
                  '${article.id}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Title
              Text(
                textAlign: TextAlign.center,
                article.title.capitalize(),
                style: GoogleFonts.podkova(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Divider(thickness: 2),
              SizedBox(height: 10),

              // Body
              Text(
                textAlign: TextAlign.center,
                article.body.capitalize(),
                style: GoogleFonts.podkova(
                  fontSize: 19,
                  height: 1.5,

                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
