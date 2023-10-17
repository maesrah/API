import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  // final meow="https://jsonplaceholder.typicode.com/posts";
  var apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/users");

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> sendPostRequest() async {
    var response = await http.post(
      apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "name": nameController.text,
          "username": userNameController.text,
          "userId": 1,
        },
      ),
    );

    //When a BuildContext is used, its mounted
    //property must be checked after an asynchronous gap.
    if (!context.mounted) return;
    //201 indicate a succesful creation
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Post created successfully!"),
      ));
      Navigator.of(context).pop();
      print(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to create post!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Post Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(hintText: "Username"),
            ),
            ElevatedButton(
              onPressed: sendPostRequest,
              child: const Text("Create Post"),
            ),
          ],
        ),
      ),
    );
  }
}
