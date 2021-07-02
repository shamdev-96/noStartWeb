import 'package:flutter/cupertino.dart';
import 'package:nostart/widgets/sideLogo.dart';

class SideRocketLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideLogo(),
        Container(
          margin: EdgeInsets.only(left: 0.001, top: 90),
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('images/logo.png'),
              image: AssetImage('images/rocket.png'),
              fit: BoxFit.fill,
            ),
            // shape: BoxShape.rectangle,
          ),
        )
      ],
    );
  }
}
