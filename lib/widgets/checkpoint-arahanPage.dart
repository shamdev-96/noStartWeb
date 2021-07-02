import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:nostart/checkpoint-1/check1-first.dart';

import 'package:nostart/constant/styles.dart';
import 'package:nostart/widgets/SnakeBoard.dart';
import 'package:nostart/widgets/sideLogo.dart';

import 'FooterTemplate.dart';

// ignore: camel_case_types
class CheckPoint_Arahan extends StatefulWidget {
  final int checkPoint;
  CheckPoint_Arahan({Key key, @required this.checkPoint}) : super(key: key);
  @override
  _CheckPoint_ArahanState createState() => _CheckPoint_ArahanState(checkPoint);
}

// ignore: camel_case_types
class _CheckPoint_ArahanState extends State<CheckPoint_Arahan> {
  int _checkPoint = 1;
  String checkPointName = '';
  String subCheckPointName = '';
  String mainArahan = '';
  String subMainArahan = '';
  BuildContext _mainContext;
  double screenHeight;
  double screenWidth;
  _CheckPoint_ArahanState(this._checkPoint);
  @override
  void initState() {
    // StartTimer();
    InitializeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    screenHeight = (MediaQuery.of(_mainContext).size.height);
    screenWidth = (MediaQuery.of(_mainContext).size.width);
    return Scaffold(
      body: BuildBodyView(),
    );
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
                SideLogo()
                // Padding(
                //     padding: EdgeInsets.only(top: 40),
                //     child: BuildPartialView()),
              ],
            ),
          ),
          BuildPartialView(),
          BuildButtonView(),
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
                Text(checkPointName, style: StyleConstant.h1TextStyle),
              ],
            ),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(subCheckPointName, style: StyleConstant.h2TextStyle),
              ],
            ),
          )),
          Center(
              child: Container(
            height: 300,
            width: 800,
            decoration: BoxDecoration(
                color: StyleConstant.footerColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text("Arahan Checkpoint",
                        style: StyleConstant.mediumFontStyle_ColorTheme),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _checkPoint == 2
                          ? Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Center(
                                  child: Text(
                                mainArahan,
                                style: StyleConstant.h3TextStyle,
                                textAlign: TextAlign.justify,
                              )),
                            )
                          : Center(
                              child: Text(
                              mainArahan,
                              style: StyleConstant.h3TextStyle,
                              textAlign: TextAlign.center,
                            )),
                      _checkPoint == 2
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 20, right: 20, left: 20),
                              child: Center(
                                  child: Text(
                                subMainArahan,
                                style: StyleConstant.h3TextStyle,
                                textAlign: TextAlign.justify,
                              )),
                            )
                          : Center(
                              child: Text(
                              subMainArahan,
                              style: StyleConstant.h3TextStyle,
                              textAlign: TextAlign.center,
                            )),
                    ],
                  )),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildButtonView() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 30),
          height: 70,
          width: 300,
          child: ElevatedButton(
            autofocus: true,
            onPressed: () {
              _checkPoint == 1
                  ? Navigator.pushNamed(_mainContext, '/checkpoint/1/video')
                  // Navigator.push(
                  //     _mainContext,
                  //     MaterialPageRoute(
                  //       builder: (context) => Check1_FirstPage(),
                  //     ))
                  : Navigator.pushNamed(
                      _mainContext, '/checkpoint/2/smoke&ladder');
            },
            style: StyleConstant.globalButtonStyle,
            child: Text('TERUSKAN', style: StyleConstant.buttonTextStyle),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  InitializeView() {
    print(this._checkPoint);
    switch (_checkPoint) {
      case (1):
        {
          setState(() {
            checkPointName = "Mindcraft";
            subCheckPointName = "Ceritera Tentang Rokok";
            mainArahan =
                "Adik-adik perlu menonton rakaman video yang akan dimainkan";
            subMainArahan = "dan menjawab soalan yang berikut";
          });
          break;
        }
      case (2):
        {
          setState(() {
            checkPointName = "Smoke & Ladder";
            subCheckPointName = "Road to Not Smooking";
            mainArahan =
                "Pada petak SMOKE, anda dikehendaki menjawab solan yang diberikan dengan betul. Sekiranya jawapan anda betul, anda terselamat. Sekiranya salah, anda akan turun ke petak yang lebih rendah";
            subMainArahan =
                "Pada petak LADDER, anda perlu memahami kenyataan yang dibacakan untuk naik ke petak seterusnya. Peserta yang berjaya tiba ke kotak penamat memenangi cabaran ini";
          });
          break;
        }
      default:
        break;
    }
  }
}
