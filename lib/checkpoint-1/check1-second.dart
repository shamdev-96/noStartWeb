import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/enums.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/checkpoint-introPage.dart';

import 'package:nostart/widgets/sideLogo.dart';
import 'package:quiz_view/quiz_view.dart';

// ignore: camel_case_types
class Check1_SecondPage extends StatefulWidget {
  @override
  _Check1_SecondPageState createState() => _Check1_SecondPageState();
}

// ignore: camel_case_types
class _Check1_SecondPageState extends State<Check1_SecondPage> {
  int _pos = 1;
  Timer _timer;
  String lottieFiles = "lotties/number-5.json";
  String countDownWord = "Kita akan mula dalam 5 minit";
  BuildContext _mainContext;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    return WillPopScope(
        child: Scaffold(
          body: BuildBodyView(),
        ),
        onWillPop: _onBackPressed);
  }

  // ignore: non_constant_identifier_names
  BuildBodyView() {
    return new Container(
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: new FooterView(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.zero,
                child: BuildMainView(),
              )
            ],
            footer: new Footer(
              child: FooterTemplate(),
              backgroundColor: StyleConstant.footerColor,
            )));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Adakah anda pasti'),
            content: new Text('Kembali semula ke halaman video?'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  // ignore: non_constant_identifier_names
  BuildPage() {
    return Container(
      decoration: BoxDecoration(color: StyleConstant.backgroundColor),
      child: BuildMainView(),
    );
  }

  // ignore: non_constant_identifier_names
  BuildMainView() {
    return new Container(
        child: Padding(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SideLogo(),
              ],
            ),
          ),
          BuildPartialView(),
          BuildButtonView(),
          // BuildKuizView()
          // Padding(
          //     padding: EdgeInsets.only(top: 10, bottom: 40),
          //     child: BuildCountDownView()),
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  BuildPartialView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //row 1
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Soalan Kuiz?', style: StyleConstant.h1TextStyle),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30), child: BuildKuizView())
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildKuizView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QuizView(
            showCorrect: true,
            tagBackgroundColor: Colors.white,
            tagColor: Colors.black,
            questionTag: "Soalan 1",
            answerColor: Colors.white,
            answerBackgroundColor: StyleConstant.wrongColorCode,
            questionColor: Colors.white,
            backgroundColor: StyleConstant.kuizBackgroundColor,
            width: 700,
            height: 400,
            question: "Adakah puntung rokok boleh membakar hutan?",
            rightAnswer: "Ya",
            wrongAnswers: ["Tidak", "Tidak Pasti"],
            onRightAnswer: () => _showMyDialog(true),
            onWrongAnswer: () => _showMyDialog(false),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog(bool isCorrecAnswer) async {
    String titleDialog = "";
    String lottieFiles = "";
    if (isCorrecAnswer) {
      titleDialog = "BETUL!";
      lottieFiles = "lotties/betul.json";
    } else {
      titleDialog = "SALAH!";
      lottieFiles = "lotties/wrong.json";
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleDialog),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  child: Lottie.asset(lottieFiles),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kembali ke soalan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  BuildButtonView() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 30),
          height: 70,
          width: 400,
          child: ElevatedButton(
            autofocus: true,
            onPressed: () {
              Navigator.pushNamed(_mainContext, '/checkpoint/intro',
                  arguments: Enums.CheckPoint2);
              // Navigator.push(
              //     _mainContext,
              //     MaterialPageRoute(
              //       builder: (context) =>
              //           CheckPoint_Intro(checkPoint: Enums.CheckPoint2),
              //     ));
            },
            style: StyleConstant.globalButtonStyle,
            child: Text('CHECKPOINT SETERUSNYA',
                style: StyleConstant.buttonTextStyle),
          )),
    );
  }
}
