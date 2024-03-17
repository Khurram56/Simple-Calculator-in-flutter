import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "⌫") {
      if (_output != "0" && _output.isNotEmpty) {
        _output = _output.substring(0, _output.length - 1);
        if (_output.isEmpty) {
          _output = "0";
        }
      }
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    Color buttonColor;

    if (buttonText == "=") {
      buttonColor = Colors.green;
    } else if (buttonText == "Clear") {
      buttonColor = Colors.red;
    } else if (buttonText == "⌫") {
      buttonColor = Colors.red;
    } else if (buttonText == "/") {
      buttonColor = Colors.blue;
    } else if (buttonText == "*") {
      buttonColor = Colors.blue;
    } else if (buttonText == "-") {
      buttonColor = Colors.blue;
    } else if (buttonText == "+") {
      buttonColor = Colors.blue;
    } else {
      buttonColor = Colors.yellow; // Default color for other buttons
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 14.0), // Add padding only at the bottom
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shadowColor: Colors.red,
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Calculator"),
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              padding: const EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 12.0),
              child: Text(
                _output,
                style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    const SizedBox(width: 10),
                    buildButton("8"),
                    const SizedBox(width: 10),
                    buildButton("9"),
                    const SizedBox(width: 10),
                    buildButton("/"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    const SizedBox(width: 10),
                    buildButton("5"),
                    const SizedBox(width: 10),
                    buildButton("6"),
                    const SizedBox(width: 10),
                    buildButton("*"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    const SizedBox(width: 10),
                    buildButton("2"),
                    const SizedBox(width: 10),
                    buildButton("3"),
                    const SizedBox(width: 10),
                    buildButton("-"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    const SizedBox(width: 10),
                    buildButton("0"),
                    const SizedBox(width: 10),
                    buildButton("00"),
                    const SizedBox(width: 10),
                    buildButton("+"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    buildButton("Clear"),
                    const SizedBox(width: 10),
                    buildButton("="),
                    const SizedBox(width: 10),
                    buildButton("⌫"),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            )
          ],
        ),
      ),
    );
  }
}
