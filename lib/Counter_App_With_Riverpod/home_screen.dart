import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider<int>((ref){
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = ref.watch(counter);
    print("Whole Page Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child){
            final count = ref.watch(counter);
            print('Only Text Widget Rebuild');
            return Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(fontSize: 40),
                )
            );
          }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Text("-"),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text("+"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreenStatefull extends ConsumerStatefulWidget {
  const HomeScreenStatefull({super.key});

  @override
  ConsumerState<HomeScreenStatefull> createState() => _HomeScreenStatefullState();
}

class _HomeScreenStatefullState extends ConsumerState<HomeScreenStatefull> {
  @override
  Widget build(BuildContext context) {
    print("Whole Page Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App Stateful"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child){
            final count = ref.watch(counter);
            print('Only Text Widget Rebuild');
            return Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(fontSize: 40),
                )
            );
          }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state--;
                },
                child: Text("-"),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text("+"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
