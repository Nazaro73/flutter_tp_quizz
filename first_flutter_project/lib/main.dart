import 'package:first_flutter_project/quizPage.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class Question {
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question({
    required this.question,
    required this.response,
    required this.explanation,
    required this.imagePath
  });

  String getImage() => 'img/$imagePath';
}

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz Accueil',
          textAlign: TextAlign.center),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quizz',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),

            ),
            Image.asset("img/home.png"),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizzPage()),
            );
          },
          child: const Text('Jouer'),
        ),
    ],
      ),
    );
  }
}




