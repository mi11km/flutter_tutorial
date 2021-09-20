import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/models/favorites.dart';
import 'package:startup_namer/screens/favorites.dart';

Widget createFavoritesScreen() {
  var favoritesList = Favorites();
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
  return ChangeNotifierProvider<Favorites>(
    create: (context) => favoritesList,
    child: const MaterialApp(
      home: FavoritesPage(),
    ),
  );
}

void main() {
  group('Favorites Page Widget Tests', () {
    testWidgets('Test if ListView shows up', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Remove Button', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      await tester.pumpAndSettle();
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byIcon(Icons.close)).length,
          lessThan(totalItems));
      expect(find.text('Removed from favorites'), findsOneWidget);
    });
  });
}
