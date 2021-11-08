// flutter package imports here
import 'package:flutter/material.dart';

// local imports here
import '/models/news.dart';
import '/widgets/widgets.dart';

/// this custom screen responisble for displaying
/// news article description title and image (news detail description) based on categories
class NewsDecsriptionScreen extends StatelessWidget {
  // takes Article param
  final Article article;

  const NewsDecsriptionScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        /// define a leading action to go back to home screen or parent screen of the navigation
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.redAccent[400],
          ),
        ),
        // this widget shows article source name as the app bar title
        title: Text(
          article.source?.name ?? '',
          style: const TextStyle(color: Colors.black),
        ),
      ),

      /// wrap the body in a single child scroll view to be safe
      /// if description goes beyond screen boundaries to scroll down
      body: SingleChildScrollView(
        child: Column(
          children: [
            // this widget shows article image (might be null based on response)
            if (article.urlToImage!.isNotEmpty)
              Image.network(article.urlToImage!),
            // this widget shows article title (might be null based on response)
            NewsDescriptionText(
              articleText: article.title ?? '',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              paddingValue: 8.0,
              textAlign: TextAlign.center,
            ),
            // this widget shows article description (might be null based on response)
            NewsDescriptionText(
              articleText: article.description ?? '',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              paddingValue: 8.0,
              textAlign: TextAlign.justify,
              textOverflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
