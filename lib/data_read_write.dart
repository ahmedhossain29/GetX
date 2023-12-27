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

class Notes {
  final String title;
  final String details;

  Notes({required this.title, required this.details});
}

class NoteController extends GetxController {
  final noteList = <Notes>[].obs;

  void addNotes(String title, String details) {
    noteList.add(Notes(title: title, details: details));
    update();
  }
}

class NoteApp extends StatelessWidget {
  NoteApp({super.key});

  final NoteController noteController = Get.put(NoteController());

  TextEditingController noteTEController = TextEditingController();
  TextEditingController detailsTEController = TextEditingController();

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
                    const SizedBox(
                      height: 15,
                    ),
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
                    TextFormField(
                      controller: detailsTEController,
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
                          noteController.addNotes(
                              noteTEController.text, detailsTEController.text);
                          Get.back();
                          noteTEController.clear();
                          detailsTEController.clear();
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
            itemCount: noteController.noteList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(noteController.noteList[index].title),
                subtitle: Text(noteController.noteList[index].details),
              );
            }),
      ),
    );
  }
}
