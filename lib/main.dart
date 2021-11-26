import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/home/home_binding.dart';
import 'package:translate/home/home_view.dart';
import 'package:translate/members/members_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Language Translator",
      getPages: [
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding()),
        GetPage(
            name: "/members",
            page: () => MembersPage(),
            binding: HomeBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
