import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_works/favourite_list/provider/favourite_list_provider.dart';

void main() {
  group("Favourite List", () {
    final favoruite = Favourite();

    test("Add to List", () {
      int number = 10;
      favoruite.add(number);
      expect(favoruite.favouriteItems.contains(number), true);
    });

    test("Remove to List", () {
      int number = 7;
      favoruite.add(number);
      expect(favoruite.favouriteItems.contains(number), true);
      favoruite.remove(number);
      expect(favoruite.favouriteItems.contains(number), false);
    });
  });
}
