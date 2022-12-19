import 'package:flutter/material.dart';
import 'package:flutter_testing_works/favourite_list/provider/favourite_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:kartal/kartal.dart';

import '../../product/scaffold_snackbar_view.dart';
import 'favourite_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final _listLength = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Favourite List"),
        actions: [
          IconButton(
              key: Key("go_favourite_page"),
              onPressed: () {
                context.navigateToPage(FavouriteView());
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
          itemCount: _listLength,
          itemBuilder: ((context, index) => _buildListTile(index, context))),
    );
  }

  ListTile _buildListTile(int index, BuildContext context) {
    var _favourite = Provider.of<Favourite>(context);
    return ListTile(
      title: Text(
        "Number $index",
        key: Key("text_$index"),
      ),
      trailing: IconButton(
          key: Key("icon_$index"),
          onPressed: () {
            if (_favourite.favouriteItems.contains(index)) {
              _favourite.remove(index);
            } else {
              _favourite.add(index);
            }

            SnackBarClass.contentSnackBar(
                context, _favourite.favouriteItems, index);
          },
          icon: _favourite.favouriteItems.contains(index)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
    );
  }
}
