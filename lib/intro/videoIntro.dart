import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:nostart/constant/enums.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/helpers/CheckpointHelper.dart';
import 'package:nostart/models/Checkpoints.dart';
import 'package:nostart/singleton/PlayerFlow.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/sideLogo.dart';
import 'package:universal_html/html.dart';
import 'dart:ui' as ui;

// ignore: camel_case_types
class VideoIntro extends StatefulWidget {
  @override
  _VideoIntroState createState() => _VideoIntroState();
}

// ignore: camel_case_types
class _VideoIntroState extends State<VideoIntro> {
  int _checkPoint = 1;
  String checkPointName = '';
  String subCheckPointName = '';
  String mainArahan = '';
  String subMainArahan = '';
  BuildContext _mainContext;
  double screenHeight;
  double screenWidth;
  double totalArahanWords;
  double containerHeight;
  Checkpoints checkpointData;

  IFrameElement _iframeElement;

  String videoPendahuluan = "https://www.youtube.com/embed/WZcE_lZurPI";
  Widget _iframeWidget;
  @override
  void initState() {
    // StartTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    screenHeight = (MediaQuery.of(_mainContext).size.height);
    screenWidth = (MediaQuery.of(_mainContext).size.width);
    // _checkPoint = ModalRoute.of(_mainContext).settings.arguments;
    InitializeView();
    return Scaffold(
      body: BuildBodyView(),
    );
  }

  // ignore: non_constant_identifier_names
  BuildBodyView() {
    return new Container(
        decoration: BoxDecoration(
          color: StyleConstant.backgroundColor,
        ),
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
            child: Stack(
              children: <Widget>[
                SideLogo(
                  isArahanDisplay: false,
                  screenWidth: screenWidth,
                ),
                Padding(
                    padding: EdgeInsets.only(top: screenHeight / 100),
                    child: BuildPartialView())
              ],
            ),
          ),
          // BuildButtonView(),
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  BuildPartialView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: screenHeight - (screenHeight / 33),
          width: screenWidth,
          margin: EdgeInsets.only(
              top: 20,
              right: screenWidth / 24,
              left: screenWidth / 24,
              bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: Center(
                  child: Text(
                    "VIDEO PENDAHULUAN ARAHAN PERMAINAN",
                    style: StyleConstant.h2TextStyle_BebasNueu_Black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 30),
              //   child: Center(
              //     child: Text(
              //       "Sila dengar dengan jelas dan teliti.",
              //       style: StyleConstant.h3TextStyle_Futura_White,
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              Container(
                height: screenHeight - (screenHeight / 3.5),
                width: screenWidth,
                margin: EdgeInsets.only(
                    right: screenWidth / 24, left: screenWidth / 24),
                child: _iframeWidget,
              ),
              BuildButtonView(),

              // Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: List.generate(
              //         checkpointData.listArahanString.length, (index) {
              //       return BuildContainerText(index);
              //     })),
            ],
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  BuildContainerText(int index) {
    // return Container(
    //   // margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
    //   child: Text(
    //     checkpointData.listArahanString[index],
    //     style: StyleConstant.h3TextStyle_Futura_Black,
    //     // textAlign: TextAlign.left,
    //   ),
    // );
    if ((_checkPoint == 2 || _checkPoint == 4 || _checkPoint == 5) &&
        index == checkpointData.listArahanString.length - 1) {
      return Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Text(
              checkpointData.listArahanString[index],
              style: StyleConstant.h3TextStyle_Futura_Black,
              textAlign: TextAlign.center,
            ),
          ));
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: Text(
          checkpointData.listArahanString[index],
          style: StyleConstant.h3TextStyle_Futura_Black,
          textAlign: TextAlign.left,
        ),
      );
    }
  }

  // ignore: non_constant_identifier_names
  BuildButtonView() {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => {NavigateStartCheckpoint()},
            child: Center(
                child: Container(
                    margin: EdgeInsets.only(top: screenWidth / 96),
                    decoration: BoxDecoration(
                        color: Constant.floatingButtonColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: screenHeight / 17,
                    width: screenWidth / 4.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('MULAKAN PERMAINAN',
                            style: StyleConstant.h4TextStyle_BestSchool_White)
                      ],
                    )))));
  }

  // ignore: non_constant_identifier_names
  InitializeView() {
    _iframeElement = IFrameElement();
    // _iframeElement.height = '1200'; //1200
    // _iframeElement.width = '1500'; //1500
    _iframeElement.style.border = 'none';

    ReinitializeVideo();
    int currentCheckpoint = 6;
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeCheckpoint$currentCheckpoint',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeCheckpoint$currentCheckpoint',
    );
  }

// ignore: non_constant_identifier_names
  ReinitializeVideo() {
    _iframeElement.src = videoPendahuluan;
  }

  // ignore: non_constant_identifier_names
  NavigateStartCheckpoint() {
    Navigator.pushNamed(_mainContext, '/daftar/nama');
  }
}
