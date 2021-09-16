import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/models/favorites.dart';
import 'package:startup_namer/screens/favorites.dart';
import 'package:startup_namer/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Startup Name Generator',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const RandomWords(),
//     );
//   }
// }
//
// class RandomWords extends StatefulWidget {
//   const RandomWords({Key? key}) : super(key: key);
//
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _liked = <WordPair>{};
//   final _biggerFont = const TextStyle(fontSize: 18);
//
//   void _pushLiked() {
//     Navigator.of(context)
//         .push(MaterialPageRoute<void>(builder: (BuildContext context) {
//       final tiles = _liked.map((WordPair pair) => ListTile(
//             title: Text(
//               pair.asPascalCase,
//               style: _biggerFont,
//             ),
//           ));
//       final divided =
//           ListTile.divideTiles(context: context, tiles: tiles).toList();
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Liked Suggestions'),
//         ),
//         body: ListView(children: divided),
//       );
//     }));
//   }
//
//   Widget _buildRow(WordPair pair) {
//     final alreadyLiked = _liked.contains(pair);
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadyLiked ? Icons.favorite : Icons.favorite_border,
//         color: alreadyLiked ? Colors.orange : null,
//       ),
//       onTap: () {
//         /*
//           setState() を呼び出すと State オブジェクトの
//           build() メソッドが呼び出され、UI が更新される。
//         */
//         setState(() {
//           if (alreadyLiked) {
//             _liked.remove(pair);
//           } else {
//             _liked.add(pair);
//           }
//         });
//       },
//     );
//   }
//
//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemBuilder: (BuildContext _context, int i) {
//           if (i.isOdd) {
//             return const Divider();
//           }
//           final int index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Startup Name Generator'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.list),
//             onPressed: _pushLiked,
//           )
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }
// }
