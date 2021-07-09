import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:nostart/constant/styles.dart';
import 'package:nostart/widgets/FooterTemplate.dart';
import 'package:nostart/widgets/sideLogo.dart';
import 'package:nostart/widgets/video-items.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: camel_case_types
class Check1_FirstPage extends StatefulWidget {
  // final int checkPoint;
  // Check1_FirstPage({Key key, @required this.checkPoint}) : super(key: key);
  @override
  _Check1_FirstPageState createState() => _Check1_FirstPageState();
}

// ignore: camel_case_types
class _Check1_FirstPageState extends State<Check1_FirstPage> {
  double deviceAspectRatio;
  BuildContext _mainContext;
  String checkPointName = '';
  String subCheckPointName = '';
  bool videoPlayerIsReady = false;
  String currentVideoSource = '';
  String currentTitleVideo;
  VideoItems currentVideo;
  int indexVideo = 0;
  bool firstLoad = true;
  YoutubePlayerController _controller;
  List<VideoItems> listVideos = [];
  List<String> listVideoSource = [
    "videos/kuiz_video_1.mp4",
    "videos/kuiz_video_2.mp4",
    "videos/kuiz_video_3.mp4",
    "videos/kuiz_video_4.mov"
  ];

  List<String> listVideoTitle = [
    "VIDEO 1",
    "VIDEO 2",
    "VIDEO 3",
    "VIDEO 4",
  ];

  // _Check1_FirstPageState();

  @override
  void initState() {
    currentTitleVideo = listVideoTitle[indexVideo];
    currentVideoSource = listVideoSource[indexVideo];

    // listVideos = [
    //   new VideoItems(
    //     videoPlayerController: VideoPlayerController.asset(
    //       "videos/kuiz_video_1.mp4",
    //     ),
    //     looping: true,
    //     autoplay: false,
    //   ),
    //   new VideoItems(
    //     videoPlayerController: VideoPlayerController.asset(
    //       "videos/kuiz_video_2.mp4",
    //     ),
    //     looping: true,
    //     autoplay: false,
    //   ),
    //   new VideoItems(
    //     videoPlayerController: VideoPlayerController.asset(
    //       "videos/kuiz_video_3.mp4",
    //     ),
    //     looping: true,
    //     autoplay: false,
    //   ),
    //   new VideoItems(
    //     videoPlayerController: VideoPlayerController.asset(
    //       "videos/kuiz_video_4.mp4",
    //     ),
    //     looping: true,
    //     autoplay: false,
    //   ),
    // ];

    // ReinitializeVideoPlayer();
    // _controller = VideoPlayerController.asset(currentVideoSource);
    // _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
    super.initState();
    // InitializeView();
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
            content: new Text('Kembali semula ke halaman Arahan Checkpoint'),
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
        child: BuildMainView());
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
          Padding(padding: EdgeInsets.zero, child: BuildPartialView()),
          Padding(padding: EdgeInsets.zero, child: BuildButtonView()),
          // Padding(padding: EdgeInsets.only(top: 50), child: BuildLoadingView()),
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  BuildPartialView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(currentTitleVideo, style: StyleConstant.h1TextStyle),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: BuildPlayerView(),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildPlayerView() {
    return Center(
        child: Container(
      height: 400,
      width: 1500,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // if (indexVideo != 0) BuildPreviousButton() else new Container(),
        BuildVideo(),
        // if (indexVideo != 4) BuildNextButton() else new Container(),
      ]),
    ));
  }

  // ignore: non_constant_identifier_names
  BuildVideo() {
    if (indexVideo != 0) {
      print('dispose video');
      currentVideo = null;
    }
    print('initialize video');
    // currentVideo = new VideoItems(
    //     videoPlayerController: VideoPlayerController.asset(
    //       listVideoSource[indexVideo],
    //     ),
    //     looping: true,
    //     autoplay: false);

    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=BBAyRBTfsOU");
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return new Container(
        margin: EdgeInsets.zero,
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                onReady: () {
                  _controller.play();
                },
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    // some widgets
                    player,
                    //some other widgets
                  ],
                );
              },
            )));
  }

  // ignore: non_constant_identifier_names
  BuildButtonView() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              width: 300,
              child: ElevatedButton(
                autofocus: true,
                onPressed: () {
                  Navigator.pushNamed(_mainContext, '/checkpoint/1/kuiz');
                  // Navigator.push(

                  //     _mainContext,
                  //     MaterialPageRoute(
                  //       builder: (context) => Check1_SecondPage(),
                  //     ));
                },
                style: StyleConstant.globalButtonStyle,
                child:
                    Text('MULAKAN KUIZ', style: StyleConstant.buttonTextStyle),
              )),
        )
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  BuildPreviousButton() {
    return Container(
        margin: EdgeInsets.only(right: 30),
        child: Center(
          child: Tooltip(
              message: 'Video sebelum',
              showDuration: Duration(seconds: 3),
              textStyle: TextStyle(fontSize: 15, color: Colors.white),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, color: Colors.blue, size: 100))),
        ));
  }

  // ignore: non_constant_identifier_names
  HandlePreviousButton() {
    print("tap previous button");
    setState(() {
      indexVideo = indexVideo - 1;
    });
    // ReinitializeVideoPlayer();
  }

  // ignore: non_constant_identifier_names
  BuildNextButton() {
    return Container(
        margin: EdgeInsets.only(left: 30),
        child: Center(
            child: IconButton(
                onPressed: () => HandleNextButton(),
                icon:
                    Icon(Icons.arrow_forward, color: Colors.blue, size: 100))));
    // Tooltip(
    //     message: 'Video seterusnya',
    //     showDuration: Duration(seconds: 3),
    //     textStyle: TextStyle(fontSize: 15, color: Colors.white),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(5),
    //         color: Colors.black26),
    //     child: Icon(Icons.arrow_forward,
    //         color: Colors.blue, size: 100)
    //         )
  }

  // ignore: non_constant_identifier_names
  HandleNextButton() {
    if (indexVideo < 4) {
      print("tap next button");
      // currentVideo.videoPlayerController.pause();
      // print("pause video");
      setState(() {
        indexVideo = indexVideo + 1;
      });
      // ReinitializeVideoPlayer();
    }

    // print("IsFirstLoad");
    // print(firstLoad);
    // if (!firstLoad) {
    //   print("tap next button");
    //   currentVideo.videoPlayerController.pause();
    //   print("pause video");
    //   setState(() {
    //     indexVideo = indexVideo + 1;
    //   });
    //   ReinitializeVideoPlayer();r
    // } else {
    //   setState(() {
    //     firstLoad = false;
    //   });
    // }
  }

  // ignore: non_constant_identifier_names
  ReinitializeVideoPlayer() {
    setState(() {
      currentTitleVideo = listVideoTitle[indexVideo];
      currentVideoSource = listVideoSource[indexVideo];
      currentVideo = VideoItems(
        videoPlayerController: VideoPlayerController.asset(
          currentVideoSource,
        ),
        looping: true,
        autoplay: false,
      );
      currentVideo.createState();
    });
    print("current video index:");
    print(indexVideo);
    print("current video playing:");
    print(currentVideoSource);
    print("current video source playing:");
    print(currentVideo.videoPlayerController.dataSource);

    // if (_controller != null) {
    //   print("controller not null");
    //   _controller.dispose();
    // } else {
    //   print("controller is null");
    // }
    // currentVideoSource = listVideoSource[indexVideo];
    // _controller = VideoPlayerController.asset(currentVideoSource);
    // _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
  }
}

// ignore: non_constant_identifier_names
InitializeView() {
  // MediaQueryData queryData;
  // queryData = MediaQuery.of(context);
  // deviceAspectRatio = queryData.devicePixelRatio;
}
