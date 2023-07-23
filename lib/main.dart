import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: false,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> quotelist = [
    'พระเจ้าตาก เเล้วใครเก็บ',
    'สั่งส้มตำทำไมได้มะละกอตำ',
    'พระเจ้าตากกู้กรุงศรี เเล้วทำไมไม่กู้กสิกร',
    'ทำไมไก่ย่างถึงถูกเผา ย่างมาเเล้วไม่ใช่เหรอ',
    'เชฟกับพระใครพาหุงเก่งกว่ากัน',
  ];
  var quote = ''; //state variable
  var lastIndex = -1;

  static List<Color> textColors = [
    Colors.lightGreen,
    Colors.deepOrangeAccent,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.lightBlueAccent,
    Colors.purple,
  ];

  var lastColor = -1;

  @override
  void initState() {
    super.initState();
    generateRandomQAndC();
  }

  void generateRandomQAndC() {
    var rand = Random();
    var randQuoteIndex;
    do {
      randQuoteIndex = rand.nextInt(quotelist.length);
    } while (randQuoteIndex == lastIndex); // Ensure it's not the same as the last index
    lastIndex = randQuoteIndex;
    setState(() {
      quote = quotelist[randQuoteIndex];
      lastColor = (lastColor + 1) % textColors.length;
    });
  }

  void handleClickSt() {
    generateRandomQAndC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funny channel')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickSt,
        child: Text('START'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote,
            style: TextStyle(
              color: textColors[lastColor],
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}