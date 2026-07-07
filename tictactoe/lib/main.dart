import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Column get boardTitle {
    return Column(
      children: [
        Text(
          "Match Arena",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(AppColor.primaryPink),
          ),
        ),
        Text(
          "QUICK MATCH [3x3]",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Color(AppColor.appBlack),
          ),
        ),
      ],
    );
  }

  ButtonStyle get buttonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(100, 100),
      textStyle: TextStyle(fontSize: 20),
      foregroundColor: Color(AppColor.cardWhite),
      backgroundColor: Color(AppColor.primaryPink),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );
  }

  Container getTopText(
    String labelText, [
    Color backgroundColor = const Color(AppColor.appBlack),
    Color textColor = const Color(AppColor.backgroundWhite),
  ]) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, //Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsetsGeometry.directional(
        top: 5,
        bottom: 5,
        start: 8,
        end: 8,
      ),

      //color: backgroundColor,
      child: Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }

  //Back button

  IconButton get backIcon {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  // X boxes

  List<Widget> get boardBox {
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
      columns.add(Row(children: rows, spacing: 5));
    }
    return columns;
  }

  Row get scoreBlock {
    return Row(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(AppColor.cardWhite),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 50,

            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getTopText(
                    "YOU : 14",
                    Color(AppColor.primaryPink),
                    Color(AppColor.appBlack),
                  ),
                  SizedBox(width: 20),
                  Text(" vs "),
                  SizedBox(width: 20),
                  getTopText(
                    "BOT : 02",
                    Color(AppColor.appBlack),
                    Color(AppColor.primaryPink),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get gameScreen {
    return Column(
      children: [
        SizedBox(height: 20),
        scoreBlock,
        SizedBox(height: 60),
        Center(
          child: Column(
            children: boardBox,
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ],
    );
  }

  final int boardSize = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(leading: backIcon, title: boardTitle),
        body: gameScreen,
        backgroundColor: Color(AppColor.backgroundWhite),
      ),
    );
  }
}
