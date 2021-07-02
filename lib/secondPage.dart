import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/variables.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/sideLogo.dart';

import 'constant/enums.dart';
import 'widgets/checkpoint-introPage.dart';
import 'constant/styles.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _pos = 1;
  Timer _timer;
  String lottieFiles = "lotties/number-5.json";
  String countDownWord = "Kita akan mula dalam 5 saat";
  BuildContext _mainContext;
  @override
  void initState() {
    print("Init state for Second Page");
    StartTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    return WillPopScope(
        child: Scaffold(
          body: BuildPage(),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Adakah anda pasti'),
            content: new Text('Kembali semula ke halaman utama'),
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
      child: new FooterView(
          flex: 3,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.zero,
              child: BuildMainView(),
            )
          ],
          footer: new Footer(
            child: FooterTemplate(),
            backgroundColor: StyleConstant.footerColor,
          )),
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
              children: <Widget>[SideLogo()],
            ),
          ),
          BuildPartialView(),
          Padding(
              padding: EdgeInsets.only(top: 10), child: BuildCountDownView()),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Smoke-Free Malaysia', style: StyleConstant.h1TextStyle),
              ],
            ),
          ),
          //row 2
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('e-Explorace 2021', style: StyleConstant.h1TextStyle),
              ],
            ),
          )),
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(countDownWord, style: StyleConstant.h2TextStyle),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildCountDownView() {
    return Center(
      child: Container(
        height: 300,
        width: 250,
        child: Lottie.asset(lottieFiles),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  StartTimer() {
    const oneSec = const Duration(seconds: ProjectConstant.countdownTime);
    _timer = Timer.periodic(oneSec, (Timer t) {
      switch (_pos) {
        case (1):
          {
            setState(() {
              lottieFiles = "lotties/number-5.json";
              countDownWord = "Kita akan mula dalam 5 saat";
            });
            break;
          }
        case (2):
          {
            setState(() {
              lottieFiles = "lotties/number-4.json";
              countDownWord = "Kita akan mula dalam 4 saat";
            });
            break;
          }
        case (3):
          {
            setState(() {
              lottieFiles = "lotties/number-3.json";
              countDownWord = "Kita akan mula dalam 3 saat";
            });
            break;
          }
        case (4):
          {
            setState(() {
              lottieFiles = "lotties/number-2.json";
              countDownWord = "Kita akan mula dalam 2 saat";
            });
            break;
          }
        case (5):
          {
            setState(() {
              lottieFiles = "lotties/number-1.json";
              countDownWord = "Kita akan mula dalam 1 saat";
            });
            break;
          }
        case (6):
          {
            _timer.cancel();
            Navigator.pushNamed(_mainContext, '/checkpoint/intro',
                arguments: Enums.CheckPoint1);
            // Navigator.push(
            //     _mainContext,
            //     MaterialPageRoute(
            //       builder: (context) => CheckPoint_Intro(
            //         checkPoint: Enums.CheckPoint1,
            //       ),
            //     ));
            break;
          }
        default:
          break;
      }
      print(_pos);
      _pos = _pos + 1;
    });
  }
}
