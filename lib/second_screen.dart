import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/home_screen.dart';
import 'package:getx_state_management/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(const ThirdScreen());
                },
                child: const Text("Go to Third Screen")),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(const HomeScreen());
                },
                child: const Text("Go to Home")),
          ],
        ),
      ),
    );
  }
}
