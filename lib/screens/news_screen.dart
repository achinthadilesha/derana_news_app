// flutter package imports here
import 'package:flutter/material.dart';

// local imports here
import '/models/news.dart';
import '/services/news_services.dart';
import '/widgets/widgets.dart';
import '/config/config.dart';

/// this custom screen responisble for displaying
/// news articles based on categories
class NewsScreen extends StatefulWidget {
  // takes string param
  final String newsCategory;

  const NewsScreen({
    Key? key,
    required this.newsCategory,
  }) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future _articles;

  Future _getArticles() {
    return NewsService.fetchGeneralNews(category: widget.newsCategory);
  }

  @override
  void initState() {
    super.initState();
    _articles = _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    /// future builder is used to trigger getnews future and
    /// rebuild the widget based on the response
    return FutureBuilder(
      // get news async future referance
      future: _articles,
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
}
