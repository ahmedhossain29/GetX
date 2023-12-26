import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: NoteApp(),
    );
  }
}

class NoteController extends GetxController {
  final notes = <String>[].obs;

  void addNotes(String note) {
    notes.add(note);
    update();
  }
}

class NoteApp extends StatelessWidget {
  NoteApp({super.key});

  final NoteController noteController = Get.put(NoteController());

  TextEditingController noteTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: noteTEController,
                      decoration: InputDecoration(
                        label: const Text('Write Note'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          noteController.addNotes(noteTEController.text);
                          Get.back();
                          noteTEController.clear();
                        },
                        child: const Text('Done')),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
            );
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Data Read Write'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(noteController.notes[index]),
              );
            }),
      ),
    );
  }
}
