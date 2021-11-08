// flutter package imports here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// local imports here
import 'screens/screens.dart';

void main() {
  /// screen is lock on potrait mode.
  /// if needed add device oreintation mode to the list
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /// pass the bool to hide the demo banner
      /// from simulator while running the app
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
