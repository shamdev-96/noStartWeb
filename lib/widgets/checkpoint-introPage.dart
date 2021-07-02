import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/enums.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/constant/variables.dart';
import 'package:nostart/widgets/checkpoint-arahanPage.dart';
import 'package:nostart/widgets/sideLogo.dart';

import 'FooterTemplate.dart';

// ignore: camel_case_types
class CheckPoint_Intro extends StatefulWidget {
  @override
  _CheckPoint_IntroState createState() => _CheckPoint_IntroState();
}

// ignore: camel_case_types
class _CheckPoint_IntroState extends State<CheckPoint_Intro> {
  int _checkPoint = 1;
  int _pos = 1;
  Timer _timer;
  String checkPointName = '';
  String subCheckPointName = '';
  BuildContext _mainContext;
  @override
  void initState() {
    // StartTimer();
    // InitializeView();
    StartTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _checkPoint = 0;
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    _checkPoint = ModalRoute.of(_mainContext).settings.arguments;
    print('Arguements:');
    print(_checkPoint);
    print(this._checkPoint);
    return Scaffold(
      body: BuildBodyView(),
    );
  }

  // ignore: non_constant_identifier_names
  BuildBodyView() {
    InitializeView();
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
          Padding(
              padding: EdgeInsets.only(top: 100), child: BuildPartialView()),
          Padding(padding: EdgeInsets.only(top: 50), child: BuildLoadingView()),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(checkPointName, style: StyleConstant.h1TextStyle),
              ],
            ),
          ),
          //row 2
          // Center(
          //     child: Container(
          //   margin: EdgeInsets.only(top: 20),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('e-Explorace 2021', style: StyleConstant.h1TextStyle),
          //     ],
          //   ),
          // )),
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(subCheckPointName, style: StyleConstant.mediumFontStyle),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildLoadingView() {
    return Center(
      child: Container(
        height: 100,
        width: 150,
        child: Lottie.asset("lotties/loading-checkpoint.json"),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InitializeView() {
    switch (_checkPoint) {
      case (1):
        {
          setState(() {
            checkPointName = "CHECKPOINT 1";
            subCheckPointName = "Mindcraft-Ceritera Tentang Rokok";
          });
          break;
        }
      case (2):
        {
          setState(() {
            checkPointName = "CHECKPOINT 2";
            subCheckPointName = "Smoke & Ladder";
          });
          break;
        }
      default:
        break;
    }
  }

  // ignore: non_constant_identifier_names
  StartTimer() {
    const oneSec = const Duration(seconds: ProjectConstant.loadingTime);
    _timer = Timer.periodic(oneSec, (Timer t) {
      if (_pos == ProjectConstant.loadingCounter) {
        Navigator.push(
            _mainContext,
            MaterialPageRoute(
              builder: (context) => CheckPoint_Arahan(
                checkPoint: _checkPoint,
              ),
            ));
      }
      _pos++;
    });
  }
}
