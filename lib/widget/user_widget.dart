import 'package:apiproject/datahandler.dart';
import 'package:apiproject/model/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  final Users userData;
  const UserWidget({super.key, required this.userData});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  DataHandler dataHandler = DataHandler();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.indigo),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.userData.name),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.userData.username),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.userData.email),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.userData.phone),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.userData.website),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              dataHandler.deleteData(context, widget.userData.id);
            });
          },
          child: const Text('Delete Data'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              dataHandler.updateData(context, widget.userData.id);
            });
          },
          child: const Text('Update Data'),
        ),
      ]),
    );
  }
}
