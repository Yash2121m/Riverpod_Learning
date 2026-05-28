import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'API_Get_Response_Riverpod/home_screen.dart';
import 'Counter_App_With_Riverpod/home_screen.dart';
import 'Favourite_App_Riverpod/home_screen.dart';
import 'Handle_Multiple_State_With_State_Provider/home_screen.dart';
import 'Simple_Provider/simple_provider.dart';
import 'State_Notifier_Provider/home_screen.dart';
import 'To_Do_App_Riverpod/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreenAPI(),
      ),
    );
  }
}

