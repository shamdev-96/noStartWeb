import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:lottie/lottie.dart';
import 'package:nostart/constant/styles.dart';

import 'FooterTemplate.dart';

// ignore: camel_case_types
class SnakeBoard extends StatefulWidget {
  SnakeBoard({Key key}) : super(key: key);
  @override
  SnakeBoard_IntroState createState() => SnakeBoard_IntroState();
}

// ignore: camel_case_types
class SnakeBoard_IntroState extends State<SnakeBoard> {
  double screenHeight;
  double screenWidth;
  int start = 1;
  int indicatorNo = 0;
  int actualNo = 0;
  int firstSubtract = 19;
  int secondSubtract = 39;
  int thirdSubtract = 59;
  int forthSubtract = 79;
  int fifthSubtract = 99;
  int stepCount = 0;
  int currentPosition = 1;
  bool isPlayerMove = false;
  bool isDiceRotate = false;
  bool isFirstLoad = false;
  int diceStatus = 0;
  BuildContext _mainContext;
  SnakeBoard_IntroState();
  @override
  void initState() {
    // StartTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool changeColor = false;
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
      child: BuildBoard(),
    );
  }

  // ignore: non_constant_identifier_names
  BuildBoard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('images/board_snake.png'), fit: BoxFit.fill)),
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: GridView.builder(
              itemCount: 100,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: screenHeight > 720 ? 2.3 : 2.5),
              itemBuilder: (BuildContext context, int index) {
                if (isPlayerMove)
                  return GetContainerBox(index, currentPosition);
                else
                  return GetContainerBox(index, 1);
              }),
        )),
        isDiceRotate ? BuildDiceView(true) : BuildDiceView(false),
        BuildButtonView()
      ],
    );
  }

  // ignore: non_constant_identifier_names
  BuildButtonView() {
    return Container(
      width: 150,
      height: 50,
      margin: EdgeInsets.only(top: 5, bottom: 20),
      child: ElevatedButton(
        autofocus: true,
        onPressed: () => MovePosition(),
        style: StyleConstant.seconddaryButtonStyle,
        child: Text('MAIN', style: StyleConstant.button_2_TextStyle),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildDiceView(bool isRotate) {
    // bool isLottie = false;
    String path = 'images/dice/Dice';
    String currentDice = stepCount.toString();
    String fileFormat = '.png';
    print('review dice isRotate = false');
    if (currentPosition == 1) currentDice = '1';
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      child: Center(
          child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('$path $currentDice$fileFormat'))),
      )),
    );

    // if (isRotate) {
    //   print('review dice isRotate = true');
    //   return Container(
    //     margin: EdgeInsets.only(top: 5, bottom: 10),
    //     child: Center(
    //         child: Container(
    //       height: 80,
    //       width: 80,
    //       child: Lottie.asset('lotties/dice.json'),
    //     )),
    //   );
    // } else {
    //   print('review dice isRotate = false');
    //   if (currentPosition == 1) currentDice = '1';
    //   return Container(
    //     margin: EdgeInsets.only(top: 5, bottom: 10),
    //     child: Center(
    //         child: Container(
    //       height: 80,
    //       width: 80,
    //       decoration: BoxDecoration(
    //           image: DecorationImage(
    //               image: AssetImage('$path $currentDice$fileFormat'))),
    //     )),
    //   );
  }

  // ignore: non_constant_identifier_names
  MovePosition() async {
    Random random = new Random();
    setState(() {
      stepCount = random.nextInt(6);
      if (stepCount == 0) stepCount = 1;
      isDiceRotate = false;
    });
    print("Move postion:");
    // await Future.delayed(Duration(milliseconds: 50), () {
    //   print('wait player to move');
    // });
    print(stepCount);
    StopDice();
    print("Next box move:");
    print(currentPosition);
  }

  // ignore: non_constant_identifier_names
  StopDice() {
    int tempCurrentPosition = currentPosition + stepCount;
    if (tempCurrentPosition > 100) {
      tempCurrentPosition = 100;
    }
    setState(() {
      if (currentPosition <= 100) {
        isPlayerMove = true;
        currentPosition = tempCurrentPosition;
        firstSubtract = 19;
        secondSubtract = 39;
        thirdSubtract = 59;
        forthSubtract = 79;
        fifthSubtract = 99;
        indicatorNo = 0;
        diceStatus = 1;
      }
    });
  }

  // ignore: non_constant_identifier_names
  GetContainerBox(int index, int currentPosition) {
    if (index > 9 && index < 20) {
      indicatorNo = 100 - firstSubtract;
      firstSubtract = firstSubtract - 1;
    } else if (index > 29 && index < 40) {
      indicatorNo = 100 - secondSubtract;
      secondSubtract = secondSubtract - 1;
    } else if (index > 49 && index < 60) {
      indicatorNo = 100 - thirdSubtract;
      thirdSubtract = thirdSubtract - 1;
    } else if (index > 69 && index < 80) {
      indicatorNo = 100 - forthSubtract;
      forthSubtract = forthSubtract - 1;
    } else if (index > 89 && index < 100) {
      indicatorNo = 100 - fifthSubtract;
      fifthSubtract = fifthSubtract - 1;
    } else {
      indicatorNo = 100 - index;
      // actualNo = indicatorNo;
    }

    bool isCurrentBox = false;
    if (indicatorNo == currentPosition) {
      isCurrentBox = true;
    }

    String lottieFiles = "lotties/emoji_1.json";

    return Container(
        decoration: GetContainerDeco(indicatorNo),
        child: isCurrentBox
            ? Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Lottie.asset(lottieFiles),
                ),
              )
            : Center(
                child: Text(indicatorNo.toString(),
                    style: TextStyle(fontSize: 1, color: Colors.black)),
              ));
  }

  // ignore: non_constant_identifier_names
  GetContainerDeco(int indicatorNo) {
    String path = 'images//kotak/kotak_';
    String currentKotak = indicatorNo.toString();
    String fileFormat = '.png';
    return BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        image: DecorationImage(
            image: AssetImage('$path$currentKotak$fileFormat'),
            fit: BoxFit.fill));
  }
}
