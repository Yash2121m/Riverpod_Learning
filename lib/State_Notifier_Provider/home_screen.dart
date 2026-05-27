import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_provider.dart';

class HomeScreenStateNotifierProvider extends ConsumerWidget {
  const HomeScreenStateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final search = ref.watch(searchProvider);
    print("Whole Page Reload");
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Notifier Provider"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(builder: (context, ref, child){
            print("Only Text Rebuild");
            final search = ref.watch((searchProvider).select((state) => state.search));
            return Text(search);
          }
          ),
          Consumer(builder: (context, ref, child){
            print("Only Switch Rebuild");
            final isChange = ref.watch((searchProvider).select((state) => state.isChanged));
            return Switch(
                value: isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChanged(value);
                }
            );
          }),
        ],
      ),
    );
  }
}
