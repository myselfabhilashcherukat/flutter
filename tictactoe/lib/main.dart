import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget get appBarTitle {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Match Arena", style: AppThemes.styleAppbarTitle),
          Text("QUICK MATCH [3x3]", style: AppThemes.styleAppbarSubTitle),
        ],
      ),
    );
  }

  ButtonStyle get buttonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(100, 100),
      textStyle: TextStyle(fontSize: AppThemes.textLabelLarge),
      foregroundColor: AppThemes.cardWhite,
      backgroundColor: AppThemes.primaryPink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

  // Function to get a buttonLabel
  Container scoreLabel(
    String labelText, [
    Color backgroundColor = AppThemes.appBlack,
    Color textColor = AppThemes.backgroundWhite,
  ]) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, //Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsetsDirectional.only(top: 5, bottom: 5, start: 8, end: 8),

      //color: backgroundColor,
      child: Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }

  //Back button

  IconButton get backIcon {
    return IconButton(
      color: AppThemes.primaryPink,
      onPressed: () {},
      icon: Icon(Icons.arrow_back),
    );
  }

  // X boxes

  List<Widget> get playCells {
    List<Widget> rows = [];
    for (int j = 0; j < boardSize; j++) {
      List<Widget> row = [];
      for (int i = 0; i < boardSize; i++) {
        row.add(
          ElevatedButton(
            key: super.key,
            onPressed: () {},
            style: buttonStyle,
            child: Text("X"),
          ),
        );
      }
      rows.add(Row(mainAxisSize: MainAxisSize.min, spacing: 5, children: row));
    }
    return rows;
  }

  Widget get scoreBlock {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppThemes.cardWhite,
          borderRadius: BorderRadius.circular(30),
        ),

        padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            scoreLabel("YOU : 14", AppThemes.primaryPink, AppThemes.appBlack),
            SizedBox(width: 20),
            Text(" vs "),
            SizedBox(width: 20),
            scoreLabel("BOT : 02", AppThemes.appBlack, AppThemes.primaryPink),
          ],
        ),
      ),
    );
  }

  Widget get gameScreen {
    return Column(
      children: [
        SizedBox(height: 20),
        scoreBlock,
        SizedBox(height: 60),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppThemes.cardWhite,
          ),
          padding: EdgeInsets.all(10),

          child: Column(spacing: 5, children: playCells),
        ),
      ],
    );
  }

  final int boardSize = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: backIcon,
          title: appBarTitle,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.help))],
        ),
        body: gameScreen,
        backgroundColor: AppThemes.backgroundWhite,
      ),
    );
  }
}
