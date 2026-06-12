import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";

  String output = "0";

  Widget button(String text) {
    return Expanded(
      child: SizedBox(
        width: 75,
        height: 75,
        child: ElevatedButton(
          onPressed: () => buttonpressed(text),
          child: Text(text,style: TextStyle(fontSize: text == "AC"? 18:30),),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                text == "/" || text == "X" || text == "-" || text == "+"
                ? const Color.fromARGB(255, 230, 123, 22)
                : (text == "=")
                ? const Color.fromARGB(255, 56, 251, 63)
                : Colors.grey,foregroundColor: Colors.white,textStyle: TextStyle(fontSize: 30),shape: const CircleBorder(),
          ),
        ),
      ),
    );
  }

  String evaluateexpression(String expression) {
    try {
      expression = expression.replaceAll("X", "*").replaceAll("÷", "/");
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  void buttonpressed(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "0";
      } else if (value == "⌫") {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : "";
      } else if (value == "=") {
        try {
          output = evaluateexpression(input);
        } catch (e) {
          output = "error";
        }
      } else {
        input = input + value;
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: .end,
                mainAxisAlignment: .end,
                children: [Text(input, style: TextStyle(color: Colors.white, fontSize: 30)), Text(output, style: TextStyle(fontSize: 40, color: Colors.white))],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [button("⌫"),SizedBox(width: 10), button("AC"), SizedBox(width: 10),button("%"), SizedBox(width: 10),button("÷")],
              ),SizedBox(height: 10),
              Row(
                children: [button("7"),SizedBox(width: 10), button("8"),SizedBox(width: 10), button("9"),SizedBox(width: 10), button("X")],
              ),SizedBox(height: 10),
              Row(
                children: [button("4"),SizedBox(width: 10), button("5"),SizedBox(width: 10), button("6"),SizedBox(width: 10), button("-")],
              ),SizedBox(height: 10),
              Row(
                children: [button("1"),SizedBox(width: 10), button("2"),SizedBox(width: 10), button("3"),SizedBox(width: 10), button("+")],
              ),SizedBox(height:10),
              Row(
                children: [
                  button("+/-"),
                  SizedBox(width: 10),
                  button("0"),
                  SizedBox(width: 10),
                  button("."),
                  SizedBox(width: 10),
                  button("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
