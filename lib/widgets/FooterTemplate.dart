import 'package:flutter/cupertino.dart';
import 'package:nostart/constant/styles.dart';

double boldFont = StyleConstant.mainFooterFont;
double smallFont = StyleConstant.textFooterFont;

class FooterTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //row 1
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Supported By:',
                  style: TextStyle(
                      fontSize: boldFont, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        //row 2
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'UNIVERSITY OF MALAYA IMPACT ORIENTED INTERDISCIPLINARY RESEARCH GRANT (IIR0310-2019)',
                  style: TextStyle(fontSize: smallFont)),
            ],
          ),
        ),
        //row 3
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'LONG-TERM RESEARCH GRANT (LRGS) NANOMITE-UNIVERSITY OF MALAYA (RU029-2014)',
                  style: TextStyle(fontSize: smallFont)),
            ],
          ),
        ),
        //row 4
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Collaborator:',
                  style: TextStyle(
                      fontSize: boldFont, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        //row 5
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'PROGRAM KESIHATAN ORAL TANPA ASAP ROKOK(KOTAK), BAHAGIAN KESIHATAN PERGIGIAN NEGERI SEMBILAN',
                  style: TextStyle(fontSize: smallFont)),
            ],
          ),
        ),
      ],
    ));
  }
}
