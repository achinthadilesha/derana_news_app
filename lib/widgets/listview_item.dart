// flutter package imports here
import 'package:flutter/material.dart';

// local imports here
import '/models/news.dart';
import '/screens/screens.dart';
import '/widgets/widgets.dart';

/// this custom widget is responisble for returning
/// listview Card widget wrapped with gesture detector
/// for navigating to the news description screen
class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            // navigate to news descrition screen on the fly
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDecsriptionScreen(article: article),
              ),
            );
          },
          child: ListViewCard(text: article.title ?? '')),
    );
  }
}
