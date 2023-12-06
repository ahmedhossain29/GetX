import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/home_screen.dart';
import 'package:getx_state_management/second_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondScreen());
                },
                child: const Text("Go to Second Screen")),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(const HomeScreen());
                },
                child: const Text("Go to Home")),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('Hi', 'I am Snack bar');
                },
                child: const Text('Snack bar')),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(title: 'Dialog');
                },
                child: const Text('Dialog')),
          ],
        ),
      ),
    );
  }
}
