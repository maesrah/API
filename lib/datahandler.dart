import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataHandler {
  Future<void> deleteData(BuildContext context, int id) async {
    try {
      final response = await http
          .delete(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

      if (!context.mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Succesfully')));
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateData(BuildContext context, int id) async {
    try {
      final response = await http.put(
          Uri.parse('https://jsonplaceholder.typicode.com/users/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(<String, dynamic>{
            'name': 'hi',
            'username': 'Cuba',
            'userId': 1,
          }));

      if (!context.mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Succesfully')));
        print(response.body);
      } else {
        throw Exception('Failed to update data');
      }
    } catch (error) {
      print(error);
    }
  }
}
