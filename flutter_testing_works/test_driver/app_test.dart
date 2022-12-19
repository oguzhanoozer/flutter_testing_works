import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("App Integration Test", () {
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test("Scrolling Test", () async {
      final listFinder = find.byType('ListView');
      final scrollingTimeLine = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -7000, const Duration(seconds: 1));
        await driver.scroll(listFinder, 0, 7000, const Duration(seconds: 1));
      });
      final scrollingSummary = TimelineSummary.summarize(scrollingTimeLine);
      await scrollingSummary.writeTimelineToFile('scrolling', pretty: true);
    });

    test("Add and remove item from list", () async {
      final listProcessTimeLine = await driver.traceAction(() async {
        final _iconKeyList = ["icon_0", "icon_2", "icon_4"];
        for (final icon in _iconKeyList) {
          await driver.tap(find.byValueKey(icon));

          await driver.waitFor(find.text('Index added to favourite list'));
        }

        await driver.tap(find.byValueKey("go_favourite_page"));

        final _removeIconKeyList = [
          'remove_icon_0',
          'remove_icon_2',
          'remove_icon_4',
        ];
        for (final removeIcon in _removeIconKeyList) {
          await driver.tap(find.byValueKey(removeIcon));
          await driver.waitFor(find.text('Index removed from favourite list'));
        }
      });
      final listProcessingSummary =
          TimelineSummary.summarize(listProcessTimeLine);
      await listProcessingSummary.writeTimelineToFile("listProcessing",
          pretty: true);
    });
  });
}
