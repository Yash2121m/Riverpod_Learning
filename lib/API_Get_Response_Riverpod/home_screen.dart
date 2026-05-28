import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/API_Get_Response_Riverpod/Model/post_model.dart';
import 'package:riverpod_learning/API_Get_Response_Riverpod/post_provider.dart';

class HomeScreenAPI extends ConsumerWidget {
  const HomeScreenAPI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final postsList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("API Get Riverpod"),
      ),

      body: Consumer(
          builder: (context, ref, child){
            final postsList = ref.watch(postProvider);
            return Center(
              child: postsList.when(
                data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.body),
                        ),
                      );
                    }
                ),
                error: (error, stack) => Text("Error: $error"),
                loading: () => const CircularProgressIndicator(),
              ),
            );
          }
      )
    );
  }
}
