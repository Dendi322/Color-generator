import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  Color backgroundColor = generateRandomColor();

  void setRandomBackgroundColor() {
    setState(() {
      backgroundColor = generateRandomColor();
    });
  }

  static Color generateRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: setRandomBackgroundColor,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hey there',
                  style:
                      TextStyle(color: backgroundColor.getContrastColor(), fontSize: 30),
                ),
              ],
            ),
          ),
        ));
  }
}

extension ColorContast on Color {
  Color getContrastColor() {
    const maxValue = 255;
    const medianValue = maxValue/2;
    return Color.fromARGB(
        this.alpha,
        this.red > medianValue ? 0 : maxValue,
        this.green > medianValue ? 0 : maxValue,
        this.blue > medianValue ? 0 : maxValue);
  }
}
