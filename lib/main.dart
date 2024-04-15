import 'package:flutter/material.dart';

import 'project.dart';
import 'team_folder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TeamFolder(foldername: '',),
      routes: {
        '/TeamFolder':(context) => const TeamFolder(foldername: ''),
        '/ProjectPage' :(context) => const ProjectPage(foldername: '',),
      },
    );
  }
}