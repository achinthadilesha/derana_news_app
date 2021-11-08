// flutter package imports here
import 'package:flutter/material.dart';

// local imports here
import '/models/news.dart';
import '/services/services.dart';
import '/widgets/widgets.dart';
import '/config/config.dart';

/// implements custom searchdelegate from extending serchdelegate class
class SearchScreen extends SearchDelegate {
  /// this is built in function from search delegate
  /// to define a widget for search textfield action
  /// here its act as a clear button
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  /// this is built in function from search delegate
  /// to define a leading action to go back to
  /// home screen or parent screen of the navigation
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.redAccent[400],
      ),
    );
  }

  /// this is built in function from search delegate
  /// to define the logic and widget for search results
  @override
  Widget buildResults(BuildContext context) {
    /// future builder is used to trigger the search news future and
    /// rebuild the widget based on search result response
    return FutureBuilder(
      // async future to searchnews by title
      future: NewsService.fetchNewsBySearch(query),
      builder: (context, snapshot) {
        // instantiate a list of articles from future response data
        List<Article>? articles = snapshot.data as List<Article>?;

        /// here return the widget base on future
        /// check whether response has an error or waiting or result is avalible to show
        return (snapshot.hasError)
            ? const CustomPlaceholderImage(
                imageName: ImageNames.error_placeholder,
              )
            : (snapshot.connectionState == ConnectionState.waiting)
                ? const CustomCircularProgressIndicator()
                : ListView.builder(
                    // list length based on future result (might return null)
                    itemCount: articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      // widget to show in list view
                      return ListViewItem(article: articles![index]);
                    });
      },
    );
  }

  /// this is built in function from search delegate
  /// to show a placeholder widget while user search for resutls
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      // custom placeholder is a custom helper widget that takes image path as a param
      child: const CustomPlaceholderImage(
          imageName: ImageNames.search_placeholder),
    );
  }
}
