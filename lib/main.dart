import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:nostart/checkpoint-1/check1-first.dart';
import 'package:nostart/checkpoint-1/check1-second.dart';
import 'package:nostart/secondPage.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/SnakeBoard.dart';
import 'package:nostart/widgets/checkpoint-introPage.dart';
import 'package:nostart/widgets/responsive.dart';
import 'package:nostart/widgets/side-rocket.dart';
import 'package:nostart/widgets/sideLogo.dart';
import 'constant/styles.dart';

void main() {
  runApp(MainMenu());
}

BuildContext _mainContext;
double screenHeight;
double screenWidth;

// ignore: must_be_immutable
class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NO-Start Web Application',
      initialRoute: '/',
      routes: {
        '/countdown': (context) => SecondPage(),
        '/checkpoint/intro': (context) => CheckPoint_Intro(),
        // '/checkpoint/arahan': (context) => CheckPoint_Arahan(),
        '/checkpoint/1/video': (context) => Check1_FirstPage(),
        '/checkpoint/1/kuiz': (context) => Check1_SecondPage(),
        '/checkpoint/2/smoke&ladder': (context) => SnakeBoard(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebHomePage(),
    );
  }
}

// ignore: must_be_immutable
class WebHomePage extends StatelessWidget {
  int start = 1;
  bool startFirstPage = true;
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    StyleConstant.registerContext(context);
    StyleConstant.initializeFontSize(context);
    _mainContext = context;
    return Scaffold(
        body: Responsive(
            desktop: BuildBodyView_Desktop(),
            mobile: BuildBodyView_Mobile(),
            tablet: BuildBodyView_Tablet()));
  }

  // ignore: non_constant_identifier_names
  BuildBodyView_Desktop() {
    print("Desktop View");
    screenHeight = (MediaQuery.of(_mainContext).size.height);
    screenWidth = (MediaQuery.of(_mainContext).size.width);
    return new Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: new FooterView(
            flex: 7,
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
  BuildBodyView_Mobile() {
    print("Mobile View");
    return new Container(
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: new FooterView(
            flex: 9,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.zero,
                child: BuildMainView_Mobile(),
              )
            ],
            footer: new Footer(
              child: FooterTemplate(),
              backgroundColor: StyleConstant.footerColor,
            )));
  }

  // ignore: non_constant_identifier_names
  BuildBodyView_Tablet() {
    print("Tablet View");
    return new Container(
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: new FooterView(
            flex: 8,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.zero,
                child: BuildMainView_Tablet(),
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
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SideRocketLogo(),
                    screenWidth > 1700
                        ? Padding(
                            padding:
                                EdgeInsets.only(left: screenWidth / 8 + 100))
                        : Padding(
                            padding: EdgeInsets.only(left: screenWidth / 100)),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: BuildPartialView(),
                    )
                    // BuildPartialView()
                  ],
                ),
              ),
              BuildBottomView()
              // Padding(
              //     padding: EdgeInsets.only(top: 0.001, bottom: 60),
              //     child: BuildButtonView()),
            ],
          ),
        ));
  }

// ignore: non_constant_identifier_names
  BuildMainView_Mobile() {
    return new Container(
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: Column(
          children: [
            SideRocketLogo(),
            Center(child: BuildPartialView()),
            BuildBottomView()
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  BuildMainView_Tablet() {
    return new Container(
        decoration: BoxDecoration(color: StyleConstant.backgroundColor),
        child: Column(
          children: [
            SideRocketLogo(),
            Center(child: BuildPartialView()),
            // BuildBottomView()
          ],
        ));
    //  Row(
    //   children: [
    //     Expanded(
    //       flex: 8,
    //       child: SideRocketLogo(),
    //     ),
    //     Expanded(
    //       flex: 5,
    //       child: Text("This test tablet view"),
    //     )
    //   ],
    // ));
  }

// // ignore: non_constant_identifier_names
// BuildRocketView() {
//   return new Container(
//     margin: EdgeInsets.only(top: 50),
//     height: 420,
//     width: 400,
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('images/rocket.png'),
//         fit: BoxFit.fill,
//       ),
//       // shape: BoxShape.rectangle,
//     ),
//   );
// }

// ignore: non_constant_identifier_names
  BuildPartialView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Responsive.isMobile(_mainContext) == true
              ? Padding(padding: EdgeInsets.only(top: 30))
              : Padding(padding: EdgeInsets.zero),
          //row 1x
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Smoke-Free Malaysia',
                  style: StyleConstant.h1TextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          //row 2
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('e-Explorace 2021', style: StyleConstant.h1TextStyle),
              ],
            ),
          )),
          BuildButtonView()
          // Center(
          //     child: Container(
          //   margin: EdgeInsets.only(top: 30),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('e-Explorace 2021', style: StyleConstant.h1TextStyle),
          //     ],
          //   ),
          // )),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  BuildButtonView() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Adakah anda teruja untuk sesi',
                      style: StyleConstant.h2TextStyle),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(' pembelajaran yang menyeronokkan?',
                      style: StyleConstant.h2TextStyle),
                ],
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 70,
                  width: 300,
                  child: ElevatedButton(
                    autofocus: true,
                    onPressed: () {
                      Navigator.pushNamed(_mainContext, '/countdown');
                      // Navigator.push(
                      //     _mainContext,
                      //     MaterialPageRoute(
                      //       builder: (context) => SecondPage(),
                      //     ));
                    },
                    style: StyleConstant.globalButtonStyle,
                    child: Text('MARI MULAKAN',
                        style: StyleConstant.buttonTextStyle),
                  )),
            )
          ],
        ));
  }

// ignore: non_constant_identifier_names
  BuildBottomView() {
    return Container(
        margin: EdgeInsets.only(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          // margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text('KERJASAMA : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: StyleConstant.h3FontSize,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Responsive(
                      mobile: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 7, left: 10),
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/um_logo.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 7),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/um_logo_dentist.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 7),
                            height: 60,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/peneraju_logo.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/nanomite_logo.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                        ],
                      ),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.only(top: 10),
                      //       height: 110,
                      //       width: 130,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('images/um_logo.png'),
                      //           fit: BoxFit.fill,
                      //         ),
                      //         // shape: BoxShape.rectangle,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(top: 10),
                      //       height: 50,
                      //       width: 130,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('images/um_logo_dentist.png'),
                      //           fit: BoxFit.fill,
                      //         ),
                      //         // shape: BoxShape.rectangle,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(top: 10),
                      //       height: 80,
                      //       width: 100,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('images/peneraju_logo.png'),
                      //           fit: BoxFit.fill,
                      //         ),
                      //         // shaper: BoxShape.rectangle,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(top: 10),
                      //       height: 40,
                      //       width: 130,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('images/nanomite_logo.png'),
                      //           fit: BoxFit.fill,
                      //         ),
                      //         // shape: BoxShape.rectangle,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      tablet: null,
                      desktop: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 20),
                            height: 120,
                            width: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/um_logo.png'),
                                fit: BoxFit.contain,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 20),
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/um_logo_dentist.png'),
                                fit: BoxFit.contain,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 20),
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/peneraju_logo.png'),
                                fit: BoxFit.contain,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/nanomite_logo.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.rectangle,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
