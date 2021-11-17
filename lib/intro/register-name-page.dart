import 'dart:async';

import 'package:button3d/button3d.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/KuizInitiator.dart';
import 'package:nostart/constant/enums.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/constant/variables.dart';
import 'package:nostart/helpers/CacheManager.dart';
import 'package:nostart/helpers/FirebaseHelper.dart';
import 'package:nostart/models/AlertData.dart';
import 'package:nostart/models/Registration.dart';
import 'package:nostart/singleton/LocalStorage.dart';
import 'package:nostart/singleton/PlayerFlow.dart';
import 'package:nostart/widgets/Containers/templatedSoalan.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/alertDialog.dart';
import 'package:nostart/widgets/checkpoint-arahanPage.dart';
import 'package:nostart/widgets/responsive.dart';
import 'package:nostart/widgets/sideLogo.dart';

// ignore: camel_case_types
class RegisterName_Page extends StatefulWidget {
  @override
  _RegisterName_PageState createState() => _RegisterName_PageState();
}

// ignore: camel_case_types
class _RegisterName_PageState extends State<RegisterName_Page> {
  int _checkPoint = 1;
  int _pos = 1;
  Timer _timer;
  String checkPointName = '';
  String subCheckPointName = '';
  BuildContext _mainContext;
  double fixBoardSize = 0;
  double screenHeight;
  double screenWidth;
  String playerName = '';
  bool isButtonPressed = false;
  bool isButtonPress = false;
  List<Registration> listRegistration = [];
  CarouselController buttonCarouselController = CarouselController();
  CollectionReference players =
      FirebaseFirestore.instance.collection('pelajar');
  @override
  void initState() {
    InitializeView();
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
    screenHeight = (MediaQuery.of(_mainContext).size.height);
    screenWidth = (MediaQuery.of(_mainContext).size.width);
    fixBoardSize = screenHeight * 0.75;
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
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SideLogo(screenWidth: screenWidth),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: screenHeight / 3),
              child: BuildPartialView(),
            ),
          )
          // Column(
          //   children: [BuildPartialView()],
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          // ),
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  BuildPartialView() {
    return BuildRegistrationFlow();
  }

  // ignore: non_constant_identifier_names
  BuildRegistrationFlow() {
    return Container(
        height: screenWidth / 3.2, //600
        width: screenWidth / 1.6, //1200
        child: BuildSectionView());
  }

  // ignore: non_constant_identifier_names
  BuildSectionView() {
    return Container(
        height: screenWidth / 3.2, //600
        width: screenWidth / 1.6, //1200
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //row 1
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Masukkan No Kad Pengenalan Adik-adik",
                      style: StyleConstant.h2TextStyle_Main_Blue),
                ],
              ),
            ),
            Center(
                child: Container(
              // height: 50,
              // width: 400,
              margin: EdgeInsets.only(top: screenWidth / 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    style: StyleConstant.h2TextStyle,
                    onChanged: (value) {
                      playerName = value;
                    },
                    decoration: InputDecoration(
                      labelText: "No Kad Pengenalan",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22, //
                          color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF25a09c), width: 4.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: screenWidth / 50),
                      child: Center(
                          child: Button3d(
                        width: fixBoardSize / 3,
                        height: fixBoardSize / 12,
                        style: Button3dStyle.BLUE,
                        onPressed: () async =>
                            await HandleRegistrationFlow(playerName),
                        child: Text('Daftar',
                            style: TextStyle(
                                fontSize: fixBoardSize / 38,
                                color: Colors.white)),
                      )))
                ],
              ),
            )),
          ],
        ));
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
  HandleRegistrationFlow(String data) async {
    if (!isButtonPress) {
      isButtonPress = true;
      var pelajarDetails = KuizInitiator.GetPelajarByIC(data.toString());
      if (pelajarDetails.length > 0) {
        PlayerFlow().pelajar = pelajarDetails.first;
        PlayerFlow().playerID = PlayerFlow().pelajar.pelajarID;

        await CacheManager.InitializeCache();
        PlayerFlow().currentCheckpoint =
            await FirebaseHelpers.GetCurrentCheckpoint(data);

        PlayerFlow().currentPoints = PlayerFlow().currentPoints =
            await FirebaseHelpers.GetCurrentPoint(data);

        Navigator.pushNamed(_mainContext, '/checkpoint/intro');
      } else {
        print('Students  not exist');
        var alertData = new AlertData();
        alertData.content =
            'Opps,Maaf! Nama Adik belum ada dalam rekod sebagai Pemain';

        alertData.assetFiles = 'lotties/notFound.json';
        alertData.actionText = 'Cuba Semula';
        await AppDialog.BuildDialog_Popout_Lottie_V3(_mainContext, alertData);
        print('Students  not exist');
      }
      isButtonPress = false;
    }
  }

  // ignore: non_constant_identifier_names
  AddPlayer(String playerName) {
    if (!isButtonPressed) {
      isButtonPressed = true;
      addUser(playerName);
      isButtonPressed = false;
    }
  }

  Future<void> addUser(String playerName) async {
    var dataToInsert = {
      'nama': playerName, // John Doe
      'sekolah': 'Sekolah Menengah Kebangsaan Gurun'
    };
    await FirebaseHelpers.AddData(dataToInsert, players);
  }

  // ignore: non_constant_identifier_names
  InitializeView() async {
    var section1 = new Registration();
    section1.arahanTitle = 'Masukkan No Kad Pengenalan Adik-adik';
    section1.sectionName = 'No Kad Pengenalan';
    section1.buttonText = 'Daftar';

    var section2 = new Registration();
    section2.arahanTitle = 'Masukkan Nama Panggilan Adik';
    section2.sectionName = 'Nama Adik';
    section2.buttonText = 'Mulakan Permainan!';

    listRegistration.add(section1);
    await LocalStorage.init();
    await KuizInitiator.IntiliazeSekolah();
    await KuizInitiator.IntiliazePelajar();

    // listRegistration.add(section2);
  }
}
