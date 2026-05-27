import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return 'Yash Patil';
});

final age = Provider<int>((ref) {
  return 21;
});

class SimpleProvider extends ConsumerWidget {
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final byee = ref.watch(hello);
    final ages = ref.watch(age);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Provider'),
      ),
      body: Center(
        child: Text(byee +" "+ ages.toString(), style: TextStyle(fontSize: 40),),
      ),
    );
  }
}

class SimpleProviderStatefull extends ConsumerStatefulWidget {
  const SimpleProviderStatefull({super.key});

  @override
  ConsumerState<SimpleProviderStatefull> createState() => _SimpleProviderStatefullState();
}

class _SimpleProviderStatefullState extends ConsumerState<SimpleProviderStatefull> {
  @override
  Widget build(BuildContext context) {
    final byee = ref.watch(hello);
    final ages = ref.watch(age);
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Provider Stateful'),
      ),
      body: Center(
        child: Text(byee +" "+ ages.toString(), style: TextStyle(fontSize: 40),),
      ),
    );
  }
}

