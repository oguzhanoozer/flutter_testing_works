import 'package:flutter/material.dart';
import 'package:flutter_testing_works/favourite_list/view/favourite_view.dart';
import 'package:flutter_testing_works/favourite_list/view/home_view.dart';
import 'package:provider/provider.dart';

import 'favourite_list/provider/favourite_list_provider.dart';

enum routes { HomeView, FavouriteView }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favourite>(
      create: (context) => Favourite(),
      child: MaterialApp(
        routes: {
          routes.HomeView.name: (context) => HomeView(),
          routes.FavouriteView.name: (context) => FavouriteView(),
        },
        initialRoute: routes.HomeView.name,
      ),
    );
  }
}
