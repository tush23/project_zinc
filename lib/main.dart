import 'package:flutter/material.dart';

import 'features/dog_breeds/presentation/pages/dog_breed_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breeds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DogBreedPage(),
    );
  }
}
