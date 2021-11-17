import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import 'package:audioplayers/audioplayers.dart';
import 'package:button3d/button3d.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/enums.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/constant/variables.dart';
import 'package:nostart/helpers/CacheManager.dart';
import 'package:nostart/helpers/CheckpointHelper.dart';
import 'package:nostart/helpers/kuizHelper.dart';
import 'package:nostart/models/AlertData.dart';
import 'package:nostart/models/KuizData.dart';
import 'package:nostart/singleton/PlayerFlow.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/alertDialog.dart';
import 'package:nostart/widgets/sideLogo.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Check1_FirstPage extends StatefulWidget {
  // final int checkPoint;
  // Check1_FirstPage({Key key, @required this.checkPoint}) : super(key: key);
  @override
  _Check1_FirstPageState createState() => _Check1_FirstPageState();
}

// ignore: camel_case_types
class _Check1_FirstPageState extends State<Check1_FirstPage> {
  ScrollController _scrollController;
  SharedPreferences _prefs;
  double deviceAspectRatio;
  BuildContext _mainContext;
  String checkPointName = '';
  String subCheckPointName = '';
  String currentVideoSource = '';
  String currentTitleVideo = 'VIDEO 1 :ROKOK & ALAM SEKITAR';
  int currentVideo = 1;
  int indexVideo = 0;
  bool firstLoad = true;
  bool isTimerVisible = false;
  double screenHeight;
  double screenWidth;
  bool isVideoWatch = false;
  ValueNotifier pointNotifier = new ValueNotifier(PlayerFlow().currentPoints);
  ValueNotifier timerNotifier = new ValueNotifier(Constant.TimerCheckpoint1);
  // ValueNotifier timerNotifier = new ValueNotifier(1);

  int totalVideos = 3;
  double _progress = 1;
  LottieBuilder alertLottie;
  LottieBuilder happyLottie;
  LottieBuilder sadLottie;
  LottieBuilder completedLottie;

  int refreshCounter = 1;
  Timer timer;
  List<KuizData> senaraiKuiz = [];

  List<String> listVideoContent = [];
  bool isTapped = false;

  List<String> listVideoTitle = [
    'VIDEO 1 : MEROKOK & ALAM SEKITAR',
    'VIDEO 2 : MEROKOK & PENAMPILAN',
    'VIDEO 3: MEROKOK & PEMBAZIRAN',
    'VIDEO 4: MEROKOK & PENGARUH RAKAN SEBAYA'
  ];
  int currentQuestionIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  List<String> listVideoSource = [
    "https://www.youtube.com/embed/66uWaTgfRII",
    "https://www.youtube.com/embed/MGVD6q8nOpM",
    "https://www.youtube.com/embed/Hm-eQl4PHTM",
    "https://www.youtube.com/embed/1EarMQ6vywQ"
  ];

  AudioCache backgroundPlayer = AudioCache();
  AudioPlayer soundInstance;
  IFrameElement _iframeElement;
  Widget _iframeWidget;
  // _Check1_FirstPageState();

  @override
  void initState() {
    // backgroundPlayer.load('backgroundMusic1.mp3');
    // PlayBackgroundSound();
    StartCheckpointTimer();
    InitializeView();
    currentTitleVideo = listVideoTitle[indexVideo];
    _scrollController = ScrollController();
    currentVideoSource = listVideoSource[indexVideo];

    super.initState();
  }

  @override
  void dispose() {
    soundInstance.stop();
    super.dispose();
  }

  void didChangeDependencies() {
    alertLottie = Lottie.asset('lotties/alert.json');
    happyLottie = Lottie.asset('lotties/happy.json');
    sadLottie = Lottie.asset('lotties/sad.json');
    completedLottie = Lottie.asset('lotties/completePuzzle.json');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    screenHeight = (MediaQuery.of(_mainContext).size.height);
    screenWidth = (MediaQuery.of(_mainContext).size.width);
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
                child: SingleChildScrollView(
                    controller: _scrollController, child: BuildMainView()),
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
            content: new Text('Kembali semula ke halaman Arahan Checkpoint'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: screenWidth / 120), //16
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
        child: SingleChildScrollView(
            controller: _scrollController, child: BuildMainView()));
  }

  // ignore: non_constant_identifier_names
  BuildMainView() {
    return Stack(
      children: [
        SideLogo(
          isArahanDisplay: true,
          checkpoint: 1,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          pointNotifier: pointNotifier,
          timerNotifier: timerNotifier,
        ),
        Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: screenWidth / 12.8), //150
            child: Column(children: [
              BuildPartialView(),
              Padding(
                  padding: EdgeInsets.only(top: screenWidth / 250),
                  child: BuildKuizView()) //20
            ])),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  BuildPartialView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: screenWidth / 28, //50
                width: screenWidth / 2.2, //700
                // margin: EdgeInsets.only(left: marginLeft, top: 20, bottom: 20),
                child: Center(
                  child: Text(
                    listVideoTitle[currentVideo - 1],
                    style: StyleConstant.h2TextStyle_BebasNueu_Black,
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [BuildPlayerView()],
        ),
      ],
    );
  }

// ignore: non_constant_identifier_names
  BuildKuizView() {
    return Container(
        height: screenWidth / 3, //620
        width: screenWidth / 1.28, // 1500
        child: CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              pageSnapping: false,
              pauseAutoPlayInFiniteScroll: false,
              pauseAutoPlayOnManualNavigate: false,
              pauseAutoPlayOnTouch: false,
              onScrolled: (index) {
                buttonCarouselController.animateToPage(currentQuestionIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              }),
          items: senaraiKuiz.map((data) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    height: screenWidth / 3, //620
                    width: screenWidth / 1.28, // 1500
                    margin: EdgeInsets.only(top: screenWidth / 38.4), //50
                    child: BuildTemplateKuiz(data, senaraiKuiz.indexOf(data)));
              },
            );
          }).toList(),
        ));
  }

  // ignore: non_constant_identifier_names
  void StayInPosition(double test) {}
  // ignore: non_constant_identifier_names
  BuildPlayerView() {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => {DisplayVideoPopup()},
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff0f8271),
                  borderRadius: BorderRadius.circular(30)),
              height: screenWidth / 20, //80
              width: screenWidth / 2.5, //400
              margin: EdgeInsets.only(top: screenWidth / 64), //30
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenWidth / 24, //80
                    width: screenWidth / 24, //80
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/play-icon.png'),
                            fit: BoxFit.fill)),
                    margin: EdgeInsets.only(
                        left: screenWidth / 192, right: screenWidth / 192), //10
                  ),
                  Text('TONTON VIDEO',
                      style: StyleConstant.h4TextStyle_BestSchool_White)
                ],
              ),
            )
            // ]
            ));
  }

  // ignore: non_constant_identifier_names
  BuildTemplateKuiz(KuizData dataKuiz, int indexSoalan) {
    double fixMarginTop = 0;
    if (dataKuiz.listJawapan.length == 4) {
      fixMarginTop = screenWidth / 64; //30
    } else {
      fixMarginTop = screenWidth / 96; //20
    }
    int currentSoalan = indexSoalan + 1;
    int totalSoalan = senaraiKuiz.length;
    return Container(
      height: screenWidth / 3.09677419, //620
      width: screenWidth / 1.28, // 1500
      // margin: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
          color: Color(0xffa48156), borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          children: [
            Container(
              height: screenWidth / 64, //30
              width: screenWidth / 6.4, //300
              margin: EdgeInsets.only(top: screenWidth / 96), //20
              child: Text(
                'Soalan $currentSoalan/$totalSoalan',
                style: StyleConstant.h5TextStyle_Futura_Black,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: screenWidth / 23.5, //60
              width: screenWidth / 1.92, //1000
              margin: EdgeInsets.only(top: screenWidth / 96), //20 | 10
              child: Text(
                dataKuiz.soalan,
                style: StyleConstant.h4TextStyle_White,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
                children: List.generate(dataKuiz.listJawapan.length, (index) {
              return GenerateJawapan(index, dataKuiz);
            }))
          ],
        ),
        Visibility(
            visible: isTimerVisible,
            child: Column(
              children: [
                Container(
                    height: screenWidth / 50, //60
                    width: screenWidth / 50, //60
                    margin: EdgeInsets.only(top: screenWidth / 192), //10
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          _progress.toString(),
                          style: StyleConstant.h5TextStyle_White,
                        ),
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                        value: _progress / 5,
                      ))
                    ])),
              ],
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
                visible: dataKuiz.isAnswered,
                child: dataKuiz.isCorrectAnswer
                    ? Container(
                        margin: EdgeInsets.only(top: fixMarginTop),
                        height: screenWidth / 20, //60,
                        width: screenWidth / 1.28, //1500
                        decoration: BoxDecoration(color: Colors.green),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Bagus! Jawapan adik betul!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth / 80), //24
                            ),
                            Container(
                              height: screenWidth / 34.9090909, //55
                              width: screenWidth / 34.9090909, //55
                              // margin: EdgeInsets.only(left: 0),
                              child: happyLottie,
                            )
                          ],
                        ))
                    : Container(
                        margin: EdgeInsets.only(top: fixMarginTop),
                        height: screenWidth / 20, //60,
                        width: screenWidth / 1.28, //1500
                        decoration: BoxDecoration(color: Colors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Ooops! Jawapan adik salah! ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth / 80), //24
                            ),
                            Container(
                              height: screenWidth / 38.4, //50
                              width: screenWidth / 38.4,
                              margin:
                                  EdgeInsets.only(left: screenWidth / 192), //10
                              child: sadLottie,
                            )
                          ],
                        )))
          ],
        ),
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  GenerateJawapan(int index, KuizData kuizData) {
    String jawapan = kuizData.listJawapan[index];
    Color backgroundColor;
    Color roundColor;
    double addSize = 0;
    String pilihanJawapan;
    bool isShowTick = false;
    IconData iconAnswer;
    switch (index) {
      case 0:
        pilihanJawapan = 'A';
        break;
      case 1:
        pilihanJawapan = 'B';
        break;
      case 2:
        pilihanJawapan = 'C';
        break;
      case 3:
        pilihanJawapan = 'D';
        break;
    }
    if (kuizData.isAnswered) {
      if (index == kuizData.indexJawapanBetul) {
        backgroundColor = Colors.green;
        iconAnswer = Icons.done_all_outlined;
        isShowTick = true;
        roundColor = Color(0xff337063);
        addSize = screenWidth / 192; //10
      } else if (index == kuizData.indexAnswer) {
        backgroundColor = Colors.red;
        isShowTick = true;
        roundColor = Color(0xffe12121);
        iconAnswer = Icons.cancel;
      } else {
        backgroundColor = Color(0xff724314);
        roundColor = Color(0xffa48156);
      }
    } else {
      backgroundColor = Color(0xffc4772a);
      roundColor = Color(0xff724314);
    }
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => {CheckJawapan(index, pilihanJawapan, kuizData)},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: screenWidth / 250),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: screenWidth / 1.6 + addSize, //1200
                    height: screenWidth / 24 + addSize, //80
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth / 96), //20
                      child: Row(
                        children: [
                          Container(
                            height: screenWidth / 38.4, //50
                            width: screenWidth / 38.4, //50
                            margin:
                                EdgeInsets.only(right: screenWidth / 96), //20
                            decoration: BoxDecoration(
                                color: roundColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                pilihanJawapan,
                                style: StyleConstant.h5TextStyle_White,
                              ),
                            ),
                          ),
                          Container(
                            height: screenWidth / 38.4, //50
                            width: screenWidth / 1.92, //1000
                            child: Center(
                              child: Text(jawapan,
                                  textAlign: TextAlign.left,
                                  style: StyleConstant.h5TextStyle_White),
                            ),
                          ),
                          // Text(jawapan, style: StyleConstant.h5TextStyle_White),
                          Visibility(
                              visible: isShowTick,
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: screenWidth / 100),
                                height: screenWidth / 27.4285714, //70
                                width: screenWidth / 27.4285714, //70
                                child: Center(
                                  child: iconAnswer == null
                                      ? SizedBox()
                                      : Icon(
                                          iconAnswer,
                                          color: Colors.white,
                                          size: screenWidth / 38.4, //50
                                        ),
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            )));
  }

  // ignore: non_constant_identifier_names
  CheckJawapan(
      int indexJawapan, String pilihanJawapan, KuizData kuizData) async {
    if (!isVideoWatch) {
      var alertData = new AlertData();

      alertData.content =
          'Sabar.. Adik-adik perlu menonton video dahulu sebelum menjawab soalan';

      alertData.assetFiles = 'lotties/alert.json';
      alertData.actionText = 'Kembali menonton video';

      return AppDialog.BuildDialog_Popout_Lottie_V2(context, alertData);
    }

    if (!kuizData.isAnswered) {
      setState(() {
        kuizData.isAnswered = true;
        kuizData.indexAnswer = indexJawapan;
      });
      setState(() {
        isTimerVisible = true;
      });
      if (indexJawapan == kuizData.indexJawapanBetul) {
        setState(() {
          kuizData.isCorrectAnswer = true;
        });
        pointNotifier.value += Constant.Checkpoint1_PointerCount;
      } else {
        setState(() {
          kuizData.isCorrectAnswer = false;
        });
      }
      startTimer();
      await Future.delayed(Duration(seconds: 5));
      if (senaraiKuiz.indexOf(kuizData) < (senaraiKuiz.length - 1)) {
        buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear);

        setState(() {
          // isTapped = false;
          isTimerVisible = false;
          currentQuestionIndex = senaraiKuiz.indexOf(kuizData) + 1;
        });
      } else {
        if (currentVideo < 4) {
          setState(() {
            isTimerVisible = false;
          });
          OnCompleteKuiz();
        } else {
          await OnCompleteCheckpoint(false);
        }
      }
    }
  }

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_progress == 5) {
            timer.cancel();
            setState(() {
              _progress = 1;
            });
          } else {
            setState(() {
              _progress += 1;
            });
          }
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  NavigateQuestion(int index) {
    buttonCarouselController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {
      currentQuestionIndex = index;
    });
  }

  // ignore: non_constant_identifier_names
  InitializeView() {
    // await CacheManager.GetDataFromCache();
    senaraiKuiz = KuizHelper.GenerateSenaraiKuiz(1);
    ReinitializeVideo();
    PlayBackgroundSound();
  }

  // ignore: non_constant_identifier_names
  ReinitializeVideo() {
    _iframeElement = IFrameElement();
    _iframeElement.height = '1200'; //1200
    _iframeElement.width = '1500'; //1500

    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement$currentVideo',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement$currentVideo',
    );
    _iframeElement.src = listVideoSource[currentVideo - 1];

    setState(() {
      _iframeWidget = _iframeWidget;
    });
  }

  // ignore: non_constant_identifier_names
  DisplayVideoPopup() {
    soundInstance.pause();
    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
                height: screenWidth / 1.6,
                width: screenWidth / 1.28,
                decoration: BoxDecoration(color: Colors.black),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth / 64), //30
                      child: _iframeWidget,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => {HandleVideoClosePopup()},
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.cancel,
                            color: Colors.red,
                            size: screenWidth / 32, //60
                          ),
                        ),
                      ),
                    )
                  ],
                )

                // Html(data: listVideoContent[0])
                ));
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
    );
  }

  // ignore: non_constant_identifier_names
  HandleVideoClosePopup() {
    ResumeSound();
    isVideoWatch = true;
    Navigator.of(context).pop(true);
  }

  // ignore: non_constant_identifier_names
  BuildDialog_Popout_Text(BuildContext context, AlertData alertData) {
    // double screenHeight = (MediaQuery.of(context).size.height);
    double screenWidth = (MediaQuery.of(context).size.width);
    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            alertData.title,
            style: StyleConstant.h2TextStyle,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: screenWidth / 6.4, //300
            width: screenWidth / 3.84, //500
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: screenWidth / 6.4, //300
                      width: screenWidth / 3.84, //500
                      child: Center(
                          child: Text(
                        alertData.content,
                        style: StyleConstant.h3TextStyle_Black,
                        textAlign: TextAlign.justify,
                      ))),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                // style: ButtonStyle(backgroundColor: Enums.floatingButtonColor),
                child: Text(
                  alertData.actionText,
                  style: StyleConstant.h5TextStyle,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  DisplayVideoPopup();
                },
              ),
            )
          ],
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  // ignore: non_constant_identifier_names
  BuildDialog_Popout_Lottie_V2(BuildContext context, AlertData alertData) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: screenWidth / 4.8, //400
            width: screenWidth / 3.2, //600
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                      height: screenWidth / 19.2, //100
                      width: screenWidth / 19.2, //100
                      child: Lottie.asset(alertData.assetFiles)),
                  Container(
                    width: screenWidth / 9.6, //200
                    height: screenWidth / 16, //120
                    margin: EdgeInsets.only(
                        top: screenWidth / 64,
                        bottom: screenWidth / 96), //30 | 20
                    child: Text(
                      alertData.content,
                      textAlign: TextAlign.center,
                      style: StyleConstant.h4TextStyle,
                    ),
                  ),
                  Container(
                      width: screenWidth / 4.2666666667, //450
                      height: screenWidth / 24, //80
                      child: Button3d(
                          width: screenWidth / 4.8, //400
                          height: screenWidth / 24, //80
                          style: Button3dStyle.BLUE,
                          onPressed: () => {CloseAndRefresh(context)},
                          child: Center(
                              child: Text(alertData.actionText,
                                  style: StyleConstant.h5TextStyle_White))))
                ],
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  // ignore: non_constant_identifier_names
  CloseAndRefresh(BuildContext context) {
    Navigator.of(context).pop(true);
    ReinitializeVideoAndSoalan();
  }

  // ignore: non_constant_identifier_names
  OnCompleteKuiz() {
    DisplayCompletePopup_Video();
  }

  // ignore: non_constant_identifier_names
  DisplayCompletePopup_Video() {
    var alertData = new AlertData();
    if (currentVideo == 1) {
      alertData.content =
          'Tahniah! Anda telah menjawab semua soalan untuk VIDEO 1 : MEROKOK & ALAM SEKITAR ';
    } else if (currentVideo == 2) {
      alertData.content =
          'Tahniah! Anda telah menjawab semua soalan untuk VIDEO 2 : MEROKOK & PENAMPILAN';
    } else if (currentVideo == 3) {
      alertData.content =
          'Tahniah! Anda telah menjawab semua soalan untuk VIDEO 3: MEROKOK & PEMBAZIRAN';
    } else {
      alertData.content =
          'Tahniah! Anda telah menjawab semua soalan untuk VIDEO 4: MEROKOK & PENGARUH RAKAN SEBAYA';
    }
    alertData.assetFiles = 'lotties/completePuzzle.json';
    alertData.actionText = 'Terus ke video seterusnya';
    // var alertData =
    //     new AlertData(title: title, assetFiles: 'lotties/completePuzzle.json');
    BuildDialog_Popout_Lottie_V2(context, alertData);
  }

  // ignore: non_constant_identifier_names
  ReinitializeVideoAndSoalan() {
    currentQuestionIndex = 0;
    currentVideo++;
    var nextSenaraiKuiz = KuizHelper.GenerateSenaraiKuiz(currentVideo);
    setState(() {
      senaraiKuiz = nextSenaraiKuiz;
      currentVideo = currentVideo;
      isVideoWatch = false;
    });
    ReinitializeVideo();
    buttonCarouselController.jumpToPage(0);
  }

  // ignore: non_constant_identifier_names
  OnCompleteCheckpoint(bool isTimeOver) async {
    soundInstance.stop();
    await CheckpointHelper.OnCompleteCheckPoint(1, pointNotifier.value,
        Constant.TimerCheckpoint1 - timerNotifier.value);
    bool isFinish = await DisplayCompletePopup(isTimeOver);
    PlayerFlow().currentCheckpoint = 2;
    if (isFinish) {
      timer.cancel();
      Navigator.pushNamed(_mainContext, '/checkpoint/intro', arguments: 2);
    }
  }

  // ignore: non_constant_identifier_names
  StartCheckpointTimer() {
    // ignore: non_constant_identifier_names

    timer = Timer.periodic(
      Duration(minutes: 1),
      (Timer timer) async {
        if (timerNotifier.value == 0) {
          timer.cancel();
          await DisplayTimeOutDialog();
        } else {
          setState(() {
            timerNotifier.value--;
          });
        }
      },

      // setState(
      //   () {
      //     if (timerNotifier.value == 0) {
      //       timer.cancel();
      //       // DisplayTimeOutDialog();
      //     } else {
      //       timerNotifier.value--;
      //     }
      //   },
      // ),
    );
  }

  // ignore: non_constant_identifier_names
  DisplayTimeOutDialog() async {
    soundInstance.stop();
    var alertData = new AlertData();
    alertData.content = 'Masa Sudah Tamat';
    alertData.assetFiles = ProjectConstant.timeOverLottie;
    alertData.actionText = 'Checkpoint Seterusnya';
    // var isFinish = await BuildDialog_TimeOut(_mainContext, alertData);
    var isFinish =
        await AppDialog.BuildDialog_Popout_Lottie_V3(context, alertData);
    if (isFinish) {
      await OnCheckpointTimeout();
    }
  }

  // ignore: non_constant_identifier_names
  BuildDialog_TimeOut(BuildContext context, AlertData alertData) async {
    double screenWidth = MediaQuery.of(context).size.width;
    return await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: screenWidth / 3.84, //500
            width: screenWidth / 2.74285714, //700
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                      height: screenWidth / 12.8, //150
                      width: screenWidth / 12.8, //150
                      child: Lottie.asset(alertData.assetFiles)),
                  Container(
                    width: screenWidth / 6.4, //300
                    height: screenWidth / 19.2, //100
                    margin: EdgeInsets.only(
                        top: screenWidth / 192, bottom: screenWidth / 192), //10
                    child: Text(
                      alertData.content,
                      textAlign: TextAlign.center,
                      style: StyleConstant.h4TextStyle,
                    ),
                  ),
                  Container(
                      child: Button3d(
                          width: screenWidth / 4.8, //400
                          height: screenWidth / 19.2, //100
                          style: Button3dStyle.BLUE,
                          onPressed: () => {},
                          child: Center(
                              child: Text(alertData.actionText,
                                  style: StyleConstant.h5TextStyle_White))))
                ],
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  // ignore: non_constant_identifier_names
  OnCheckpointTimeout() async {
    Navigator.of(context).pop(true);
    await CheckpointHelper.OnCompleteCheckPoint(1, pointNotifier.value,
        Constant.TimerCheckpoint1 - timerNotifier.value);
    PlayerFlow().currentCheckpoint = 2;
    Navigator.pushNamed(_mainContext, '/checkpoint/intro');
  }

  // ignore: non_constant_identifier_names
  PlayBackgroundSound() async {
    soundInstance =
        await backgroundPlayer.loop('backgroundMusic1.mp3', volume: 0.2);
  }

  // ignore: non_constant_identifier_names
  StopBackgroundSound() {
    soundInstance.stop();
  }

  // ignore: non_constant_identifier_names
  ResumeSound() {
    soundInstance.resume();
  }

  // ignore: non_constant_identifier_names
  DisplayCompletePopup(bool isTimeOver) async {
    var alertData = new AlertData();
    alertData.content = ' Checkpoint 1 Sudah Tamat!';
    alertData.assetFiles = ProjectConstant.completeLottie;
    alertData.actionText = 'Checkpoint Seterusnya';
    return await AppDialog.BuildDialog_Popout_Lottie_V3(context, alertData);
  }
}
