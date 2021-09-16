import 'package:test/test.dart';
import 'package:startup_namer/models/favorites.dart';

void main() {
  group('App Provider Tests', () {
    var favorites = Favorites();
    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
