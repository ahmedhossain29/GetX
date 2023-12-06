import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_state_controller.dart';
import 'home_screen.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: GetxDependencyBinder(),
    );
  }
}

class GetxDependencyBinder extends Bindings {
  ///Get dependency manager
  /// Code against abstraction -- dependency injection -- Dependency inversion
  @override
  void dependencies() {
    Get.put(CounterStateController());
  }
}
