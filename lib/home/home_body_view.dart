import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/home/home_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statementInputController = TextEditingController();
    final homeBodyController = Get.find<HomeBodyController>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: statementInputController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Enter Statement to translate",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 45,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    child: Container(
                      height: double.infinity,
                      color: Colors.greenAccent,
                      child: const Center(
                        child: Text(
                          "TO SWAHILI",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () async {
                      String statement =
                          statementInputController.text.toString();
                      if (statement == "") {
                        Get.defaultDialog(
                            title: "WARNING",
                            content: Center(
                              child: Text("Enter Text to Translate"),
                            ));
                      } else {
                        Get.snackbar(
                          "INFORMATION", "Translating ...",
                          icon: const Icon(Icons.edit, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.greenAccent,
                          // duration: const Duration(seconds: 4)
                        );
                        homeBodyController.translatedText.value =
                            await homeBodyController.translate(
                                statement, "en", "sw");
                        print(homeBodyController.translatedText.value);
                      }
                    },
                  )),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: double.infinity,
                        color: Colors.lightGreen,
                        child: const Center(
                          child: Text(
                            "TO ENGLISH",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      onTap: () async {
                        String statement =
                            statementInputController.text.toString();
                        if (statement == "") {
                          Get.defaultDialog(
                              title: "ONYO",
                              content: Center(
                                child: Text("Weka Maandishi Kutafsiri Kwanza"),
                              ));
                        } else {
                          Get.snackbar(
                            "UJUMBE",
                            "Inatafsiri ...",
                            icon: const Icon(Icons.edit, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.lightGreen,
                          );
                          homeBodyController.translatedText.value =
                              await homeBodyController.translate(
                                  statement, "sw", "en");
                          print(homeBodyController.translatedText.value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              // color: Colors.white24,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Obx(
                  () => Text(
                    homeBodyController.translatedText.value
                        .replaceAll('"', "")
                        .trim(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
