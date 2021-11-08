// flutter package imports here
import 'package:flutter/material.dart';

/// this custom widget is responisible for returning
/// ListTile wrapped in a card widget
/// implemented in listviews for both news screen and news search results screen
/// takes text as an arg
class ListViewCard extends StatelessWidget {
  const ListViewCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(text),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
