import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/Favourite_App_Riverpod/Provider/favourite_provider.dart';

class HomeScreenFavouriteApp extends ConsumerWidget {
  const HomeScreenFavouriteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef  ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value){
              ref.read(favouriteProvider.notifier).favouriteList(value);
            },
              itemBuilder: (BuildContext context){
                return const [
                  PopupMenuItem(
                      value: 'All',
                      child: Text("ALL"),
                  ),
                  PopupMenuItem(
                      value: 'Favourite',
                      child: Text("Favourite"),
                  ),
                ];
              }
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(),
            ),
            onChanged: (value){
              ref.read(favouriteProvider.notifier).filteredList(value);
            },
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: favouriteList.filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = favouriteList.filteredItems[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_border),
                    );
                  }
              ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
              ref.read(favouriteProvider.notifier).addItem();
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
