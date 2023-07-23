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
//var quote = 'พระเจ้าตาก เเล้วใครเก็บ'; //field, property
static List<String> quotelist = [
'พระเจ้าตาก เเล้วใครเก็บ',
'สั่งส้มตำทำไมได้มะละกอตำ',
'พระเจ้าตากกู้กรุงศรี เเล้วทำไมไม่กู้กสิกร',
'ทำไมไก่ย่างถึงถูกเผา ย่างมาเเล้วไม่ใช่เหรอ',
'เชฟกับพระใครพาหุงเก่งกว่ากัน',
];
var quote = quotelist[4]; //state varible

void handleClickSt() {
setState(() {
var rand = Random();
var randIn = rand.nextInt(quotelist.length);
quote = quotelist[randIn];
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Funny channal')),
floatingActionButton: FloatingActionButton(
onPressed: handleClickSt,
child: Text('START'),
),
body: Center(
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Text(
quote,
style: const TextStyle(
color: Colors.lightGreen,
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