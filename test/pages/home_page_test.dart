import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_your_price/pages/home_page.dart';

void main() {
  group('Home page test', () {
    Finder checkBtn() => find.text('Check');
    Finder nextBtn() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));
    testWidgets('Click Next to iterate over the product list',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < 5; i++) {
        await tester.tap(checkBtn());
        await tester.enterText(priceInput(), '0');
        await tester.pump();
        await tester.tap(nextBtn());
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }
    });

    testWidgets("Check result & show next product",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '0.3');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('Pass'), findsOneWidget);

      await tester.tap(nextBtn());
      await tester.pump();

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '5.5');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('Fail'), findsOneWidget);

      // await tester.enterText(priceInput(), '5.8');
      // await tester.tap(checkBtn());
      // await tester.pump();
      // expect(find.text('Pass'), findsOneWidget);
    });
  });
}
