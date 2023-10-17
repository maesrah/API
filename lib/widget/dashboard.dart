import 'package:apiproject/datahandler.dart';
import 'package:apiproject/widget/post_page.dart';
import 'package:apiproject/model/user.dart';
import 'package:apiproject/widget/user_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //DataHandler dataHandler = DataHandler();
  final Future<List<Users>> usersFuture = DataHandler.getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Users>>(
          future: usersFuture,
          builder: (context, snapshot) {
            // showing a loader while waiting for the data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              //we have the data, do stuff here
              final usersData = snapshot.data!;
              return ListView(
                children: [
                  for (final item in usersData)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserWidget(userData: item),
                    )
                ],
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PostPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
