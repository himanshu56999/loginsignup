import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality
              Navigator.restorablePushNamedAndRemoveUntil(context, "/login", (route) => false);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to the Home Page!",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
