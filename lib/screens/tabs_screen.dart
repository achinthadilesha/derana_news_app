// flutter package imports here
import 'package:flutter/material.dart';

// local imports here
import 'screens.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // define the number of tab items in tab controller
      length: 5,
      child: Scaffold(
        // change the background color for this scaffold area
        backgroundColor: Colors.white,

        /// this widget describe about the configuration of
        /// app bar (color, elevation, title, leading buttons and actions ... )
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'News',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // app bar action buttons
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                // navigates to the search delegate screen
                onPressed: () {
                  showSearch(context: context, delegate: SearchScreen());
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.redAccent[400],
                ),
              ),
            ),
          ],

          /// TabBar widget describe about the tab items
          /// and other tab bar configurations
          bottom: TabBar(
            // enable or disable tabbar horizontal scrolling (true/ false)
            isScrollable: true,
            // tab bar bottom indicator color
            indicatorColor: Colors.redAccent[400],
            // tab bar text lable color
            labelColor: Colors.redAccent[400],
            // tab bar text style configurations
            labelStyle: const TextStyle(fontSize: 16),
            // tab bar unselected tab text lable color
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),

            /// tab bar items list (takes text params and widget like icon or any)
            /// add more Tab widgets to the list if needed more
            tabs: const [
              Tab(
                text: 'General',
              ),
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Entertainment',
              ),
              Tab(
                text: 'Health',
              ),
              Tab(
                text: 'Sports',
              ),
            ],
          ),
        ),

        /// tabbarview widget displays corresponding screen based on tab bar item
        /// add more screens to widget list if needed in the app
        /// NewsScreen is custom widget that takes news category as a *!required param!* need later for api call
        body: const TabBarView(
          children: [
            NewsScreen(
              newsCategory: 'general',
            ),
            NewsScreen(
              newsCategory: 'business',
            ),
            NewsScreen(
              newsCategory: 'entertainment',
            ),
            NewsScreen(
              newsCategory: 'health',
            ),
            NewsScreen(
              newsCategory: 'sports',
            ),
          ],
        ),
      ),
    );
  }
}
