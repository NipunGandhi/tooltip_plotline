import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Top-Left'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Top-Right'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Center'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Bottom-Left'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Bottom-Right'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}