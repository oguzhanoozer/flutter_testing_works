import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_works/favourite_list/provider/favourite_list_provider.dart';
import 'package:flutter_testing_works/favourite_list/view/home_view.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favourite>(
      create: (context) => Favourite(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
void main() {
  group("Home View Test", () {
    testWidgets("Testing the scrolling", ((tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text("Number 0"), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text("Number 0"), findsNothing);
    }));

    testWidgets("Testing to add and remove item from list", ((tester) async {
      await tester.pumpWidget(createHomeScreen());

      ///expect(find.byIcon(Icons.favorite), findsNothing);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Icon && widget == Icons.favorite),
          findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Index added to favourite list'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Index removed from favourite list'), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Icon && widget == Icons.favorite),
          findsNothing);
    }));
  });
}
