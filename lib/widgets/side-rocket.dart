import 'package:flutter/cupertino.dart';
import 'package:nostart/widgets/responsive.dart';
import 'package:nostart/widgets/sideLogo.dart';

class SideRocketLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<double> paddingSize = [];
    double leftPaddingSize = 0;
    if (Responsive.isDesktop(context)) {
      paddingSize = [500, 500];
      leftPaddingSize = 0.001;
    } else if (Responsive.isMobile(context)) {
      paddingSize = [250, 250];
      leftPaddingSize = MediaQuery.of(context).size.width > 500 ? 60 : 30;
    } else {
      paddingSize = [300, 300];
      leftPaddingSize = MediaQuery.of(context).size.width > 900 ? 250 : 130;
    }
    return Responsive(
      mobile: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideLogo(),
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: 90, left: leftPaddingSize, right: leftPaddingSize),
              height: paddingSize[0],
              width: paddingSize[1],
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage('images/logo.png'),
                  image: AssetImage('images/rocket.png'),
                  fit: BoxFit.fill,
                ),
                // shape: BoxShape.rectangle,
              ),
            ),
          )
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideLogo(),
          Container(
            margin: EdgeInsets.only(left: leftPaddingSize, top: 90),
            height: paddingSize[0],
            width: paddingSize[1],
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('images/logo.png'),
                image: AssetImage('images/rocket.png'),
                fit: BoxFit.contain,
              ),
              // shape: BoxShape.rectangle,
            ),
          )
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideLogo(),
          Container(
            margin: EdgeInsets.only(left: leftPaddingSize, top: 90),
            height: paddingSize[0],
            width: paddingSize[1],
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('images/logo.png'),
                image: AssetImage('images/rocket.png'),
                fit: BoxFit.contain,
              ),
              // shape: BoxShape.rectangle,
            ),
          )
        ],
      ),
    );

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SideLogo(),
    //     Container(
    //       margin: EdgeInsets.only(left: 0.001, top: 90),
    //       height: paddingSize[0],
    //       width: paddingSize[1],
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           // image: AssetImage('images/logo.png'),
    //           image: AssetImage('images/rocket.png'),
    //           fit: BoxFit.contain,
    //         ),
    //         // shape: BoxShape.rectangle,
    //       ),
    //     )
    //   ],
    // );
  }
}
