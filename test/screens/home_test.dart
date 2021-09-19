import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/models/favorites.dart';
import 'package:startup_namer/screens/favorites.dart';
import 'package:startup_namer/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group("Home Page Widget Tests", () {
    testWidgets('Testing if ListView shows up', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Scrolling', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await widgetTester.fling(
          find.byType(ListView), const Offset(0, -200), 3000);
      await widgetTester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testing IconButtons', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await widgetTester.tap(find.byType(ItemTile).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await widgetTester.tap(find.byIcon(Icons.favorite).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
