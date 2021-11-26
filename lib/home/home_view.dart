import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/home/home_body_view.dart';
import 'package:translate/home/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ipAddress = "";
    final ipInputController = TextEditingController();
    final homeController = Get.find<HomeBodyController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text("Language Translator")),
      ),
      drawer: Drawer(
          backgroundColor: Colors.blueGrey,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white12,
              width: double.infinity,
              child: Column(
                children: [
                  // Container(height: MediaQuery.of(context).size.height()),
                  ListTile(
                    contentPadding: EdgeInsets.all(6),
                    hoverColor: Colors.white30,
                    leading: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Members",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed("/members");
                    },
                  ),
                  const SizedBox(height: 50),
                  ListTile(
                      leading: Icon(
                        Icons.computer,
                        color: Colors.white60,
                      ),
                      title: Text(
                        "SERVER IP ADDRESS",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      subtitle: Obx(
                        () => Text(
                          "   http://${homeController.ipAddress}/",
                          style: TextStyle(color: Colors.white38),
                        ),
                      )),
                  const SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: TextField(
                      controller: ipInputController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        label: Text(
                          "Change server Ip adress",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        if (GetUtils.isIPv4(
                            ipInputController.text.toString())) {
                          homeController.ipAddress.value =
                              ipInputController.text.toString();
                          print(homeController.ipAddress.value);
                        } else {
                          Get.snackbar(
                            "WARNING",
                            "ENSURE ITS A VALID IP Address",
                            icon: const Icon(Icons.dangerous,
                                color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.redAccent,
                          );
                        }
                        // print(homeController.ipAddress.toString());
                      },
                      child: Text("SAVE"),
                    ),
                  )
                ],
              ),
            ),
          )),
      body: Stack(
        children: [
          Container(
            color: Colors.black26,
            width: double.infinity,
            height: double.infinity,
            child: HomeBody(),
          )
        ],
      ),
    );
  }
}
// Colors.black26
// HomeBody()
