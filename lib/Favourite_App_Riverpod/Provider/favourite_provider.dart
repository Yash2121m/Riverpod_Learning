import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_learning/Favourite_App_Riverpod/Model/item.dart';

import 'favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteState>{
  FavouriteNotifier() : super(FavouriteState(allItems: [], filteredItems: [], search: " "));

  void addItem() {
    List<Item> item = [
      Item(name: "MacBook", favourite: true, id: 1),
      Item(name: "iPhone", favourite: false, id: 2),
      Item(name: "G-Force 3060", favourite: true, id: 3),
      Item(name: "Lenovo LOQ", favourite: false, id: 4),
      Item(name: "IQOO Neo 10R", favourite: true, id: 5),
      Item(name: "Infinix Note 30", favourite: true, id: 6),
      Item(name: "Oppo 19", favourite: false, id: 7)
    ];

    state = state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }

  void filteredList(String search){
    state = state.copyWith(filteredItems: _filteredItems(state.allItems, search));
  }

  List<Item> _filteredItems(List<Item> items, String query){
    if(query.isEmpty){
      return items;
    }

    return items.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void favouriteList(String option){
    state = state.copyWith(filteredItems: _favouriteItems(state.allItems, option));
  }

  List<Item> _favouriteItems(List<Item> items, String option){
    if(option == 'All'){
      return items;
    }

    return items.where((item) => item.favourite == true).toList();
  }
}