import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title: const Center(child: Text("Group Members")),
      ),
      body: MembersBody(),
    );
  }
}

class MembersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
