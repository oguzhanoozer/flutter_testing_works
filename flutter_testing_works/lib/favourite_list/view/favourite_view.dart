import 'package:flutter/material.dart';
import 'package:flutter_testing_works/favourite_list/provider/favourite_list_provider.dart';
import 'package:provider/provider.dart';

import '../../product/scaffold_snackbar_view.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Favourite>(
      builder: ((context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Favourite List")),
          body: ListView.builder(
            itemCount: value.favouriteItems.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Number ${value.favouriteItems[index]}"),
                trailing: IconButton(

                    ///key: Key("removeIcon${value.favouriteItems[index]}"),
                    key: Key('remove_icon_${value.favouriteItems[index]}'),
                    onPressed: () {
                      Provider.of<Favourite>(context, listen: false)
                          .remove(value.favouriteItems[index]);
                      SnackBarClass.contentSnackBar(
                          context, value.favouriteItems, index);
                    },
                    icon: Icon(Icons.close)),
              );
            }),
          ),
        );
      }),
    );
  }
}
