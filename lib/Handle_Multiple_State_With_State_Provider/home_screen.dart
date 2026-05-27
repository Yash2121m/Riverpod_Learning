import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/Handle_Multiple_State_With_State_Provider/slider_provider.dart';

class HomeScreenSlider extends ConsumerWidget {
  const HomeScreenSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Whole Method Rebuild");
    // final slider = ref.watch(sliderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Handle Multiple State With State Provider'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider.select((state) => state.showPassword));
            print("Only Eye Rebuild");
            return InkWell(
              onTap: (){
                final stateProvider = ref.read(sliderProvider.notifier);
                stateProvider.state = stateProvider.state.copyWith(showPassword: !slider);
              },
              child: Container(
                height: 200,
                width: 200,
                child: slider ? Icon(Icons.remove_red_eye) : Icon(Icons.image),
              ),
            );
          }),

          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider.select((state) => state.slider));
            print("Only Box Rebuild");
            return Container(
              height: 200,
              width: 200,
              color: Colors.cyan.withOpacity(slider),
            );
          }),

          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider);
            return Slider(
                value: slider.slider,
                onChanged: (value){
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(slider: value);
                }
            );
          }),
        ],
      ),
    );
  }
}
