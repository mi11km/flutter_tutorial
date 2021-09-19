import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/models/favorites.dart';
import 'package:startup_namer/screens/favorites.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_sharp),
            onPressed: () {
              Navigator.pushNamed(context, FavoritesPage.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(itemNo: index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile({Key? key, required this.itemNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: Icon(
          favoritesList.items.contains(itemNo)
              ? Icons.favorite
              : Icons.favorite_border,
          key: Key('icon_$itemNo'),
          color: favoritesList.items.contains(itemNo) ? Colors.orange : null,
        ),
        onTap: () {
          !favoritesList.items.contains(itemNo)
              ? favoritesList.add(itemNo)
              : favoritesList.remove(itemNo);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(favoritesList.items.contains(itemNo)
                  ? 'Added to favorites.'
                  : 'Removed from favorites.'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
