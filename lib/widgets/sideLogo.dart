import 'package:flutter/cupertino.dart';

class SideLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 10, left: 5),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/logo.png'),
          fit: BoxFit.fill,
        ),
        // shape: BoxShape.rectangle,
      ),
    );
  }
}
