import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  String get boardTitle {
    return 'Tic Tac Toe [${boardSize}x${boardSize}]';
  }

  List<Widget> get board {
    List<Widget> columns = [];
    for (int j = 0; j < boardSize; j++) {
      List<Widget> rows = [];
      for (int i = 0; i < boardSize; i++) {
        rows.add(
          ElevatedButton(
            onPressed: () {
              print("$j$i");
            },
            style: buttonStyle,
            child: Text("X"),
          ),
        );
      }
      columns.add(Row(children: rows));
    }
    return columns;
  }

  ButtonStyle get buttonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(100, 100),
      textStyle: TextStyle(fontSize: 20),
      foregroundColor: Colors.orange,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );
  }

  final int boardSize = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text(boardTitle))),
        body: Container(
          color: Colors.amberAccent,
          alignment: Alignment.center,
          padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 50),
          child: Center(child: Column(children: board)),
        ),
      ),
    );
  }
}
