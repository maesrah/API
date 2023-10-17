import 'package:apiproject/model/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final Users userData;
  const UserWidget({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.indigo),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userData.name),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userData.username),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userData.email),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userData.phone),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(userData.website),
        ),
      ]),
    );
  }
}
