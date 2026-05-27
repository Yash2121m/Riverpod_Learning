import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item_provider.dart';

class HomeScreenToDo extends ConsumerWidget {
  const HomeScreenToDo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            ref.read(itemProvider.notifier).addItem("New Item");
          },
          child: const Icon(Icons.add),

      ),

      body: item.isEmpty ? Center(child: Text("No Data")) : ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            final itemDetail = item[index];
            return ListTile(
              title: Text(itemDetail.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){
                      print(itemDetail.id);
                      ref.read(itemProvider.notifier).updateItem(itemDetail.id, 'Updated Item');
                    },
                    icon: const Icon(Icons.edit),
                  ),

                  IconButton(
                      onPressed: (){
                        print(itemDetail.id);
                        ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
                      },
                      icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
