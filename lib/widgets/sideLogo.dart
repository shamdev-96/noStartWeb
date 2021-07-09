import 'package:flutter/cupertino.dart';
import 'package:nostart/widgets/responsive.dart';

class SideLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<double> logoSize = [];
    if (Responsive.isDesktop(context)) {
      logoSize = [100, 100];
    } else if (Responsive.isMobile(context)) {
      logoSize = [50, 50];
    } else {
      logoSize = [80, 80];
    }
    return Container(
      margin: EdgeInsets.only(top: 10, left: 2),
      height: logoSize[0],
      width: logoSize[1],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/logo.png'),
          fit: BoxFit.contain,
        ),
        // shape: BoxShape.rectangle,
      ),
    );
    // return Responsive(
    //     mobile:
    //     tablet: Container(
    //       margin: EdgeInsets.only(top: 10, left: 2),
    //       height: 100,
    //       width: 100,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage('images/logo.png'),
    //           fit: BoxFit.contain,
    //         ),
    //         // shape: BoxShape.rectangle,
    //       ),
    //     ),
    //     desktop: Container(
    //       margin: EdgeInsets.only(top: 10, left: 5),
    //       height: 100,
    //       width: 100,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage('images/logo.png'),
    //           fit: BoxFit.contain,
    //         ),
    //         // shape: BoxShape.rectangle,
    //       ),
    //     ));
  }
}
