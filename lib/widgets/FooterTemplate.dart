import 'package:flutter/cupertino.dart';
import 'package:nostart/widgets/responsive.dart';

double mobileFontSize = 11;
double tabletFontSize = 13;
double desktopFontSize = 16;

class FooterTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double standardFontSize = 0;
    if (Responsive.isDesktop(context)) {
      standardFontSize = desktopFontSize;
    } else if (Responsive.isMobile(context)) {
      standardFontSize = mobileFontSize;
    } else {
      standardFontSize = tabletFontSize;
    }

    return new Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
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
                          fontSize: standardFontSize,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            //row 2
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'UNIVERSITY OF MALAYA IMPACT ORIENTED INTERDISCIPLINARY RESEARCH GRANT (IIR0310-2019)',
                    style: TextStyle(fontSize: standardFontSize - 1),
                    textAlign: TextAlign.center,
                  ),
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
                      style: TextStyle(fontSize: standardFontSize - 1),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            //row 4
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Collaborator:',
                      style: TextStyle(
                          fontSize: standardFontSize,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            //row 5
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'PROGRAM KESIHATAN ORAL TANPA ASAP ROKOK(KOTAK), BAHAGIAN KESIHATAN PERGIGIAN NEGERI SEMBILAN',
                    style: TextStyle(fontSize: standardFontSize - 1),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ));

    // return new Responsive(
    //     mobile:
    //      Container(
    //         child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         //row 1
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Supported By:',
    //                   style: TextStyle(
    //                       fontSize: mobileFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 2
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'UNIVERSITY OF MALAYA IMPACT ORIENTED INTERDISCIPLINARY RESEARCH GRANT (IIR0310-2019)',
    //                 style: TextStyle(fontSize: mobileFontSize - 1),
    //                 // textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //         //row 3
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'LONG-TERM RESEARCH GRANT (LRGS) NANOMITE-UNIVERSITY OF MALAYA (RU029-2014)',
    //                 style: TextStyle(fontSize: mobileFontSize - 1),
    //                 // textAlign: TextAlign.center
    //               ),
    //             ],
    //           ),
    //         ),
    //         //row 4
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Collaborator:',
    //                   style: TextStyle(
    //                       fontSize: mobileFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 5
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'PROGRAM KESIHATAN ORAL TANPA ASAP ROKOK(KOTAK), BAHAGIAN KESIHATAN PERGIGIAN NEGERI SEMBILAN',
    //                 style: TextStyle(fontSize: mobileFontSize - 1),
    //                 // textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     )),

    //     tablet: Container(
    //         child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         //row 1
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Supported By:',
    //                   style: TextStyle(
    //                       fontSize: tabletFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 2
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'UNIVERSITY OF MALAYA IMPACT ORIENTED INTERDISCIPLINARY RESEARCH GRANT (IIR0310-2019)',
    //                 style: TextStyle(fontSize: tabletFontSize - 1),
    //                 // textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //         //row 3
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'LONG-TERM RESEARCH GRANT (LRGS) NANOMITE-UNIVERSITY OF MALAYA (RU029-2014)',
    //                 style: TextStyle(fontSize: tabletFontSize - 1),
    //                 // textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //         //row 4
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Collaborator:',
    //                   style: TextStyle(
    //                       fontSize: tabletFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 5
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 'PROGRAM KESIHATAN ORAL TANPA ASAP ROKOK(KOTAK), BAHAGIAN KESIHATAN PERGIGIAN NEGERI SEMBILAN',
    //                 style: TextStyle(fontSize: tabletFontSize - 1),
    //                 // textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     )),
    //     desktop: Container(
    //         child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         //row 1
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Supported By:',
    //                   style: TextStyle(
    //                       fontSize: desktopFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 2
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                   'UNIVERSITY OF MALAYA IMPACT ORIENTED INTERDISCIPLINARY RESEARCH GRANT (IIR0310-2019)',
    //                   style: TextStyle(fontSize: desktopFontSize - 1)),
    //             ],
    //           ),
    //         ),
    //         //row 3
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                   'LONG-TERM RESEARCH GRANT (LRGS) NANOMITE-UNIVERSITY OF MALAYA (RU029-2014)',
    //                   style: TextStyle(fontSize: desktopFontSize - 1)),
    //             ],
    //           ),
    //         ),
    //         //row 4
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text('Collaborator:',
    //                   style: TextStyle(
    //                       fontSize: desktopFontSize,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //         ),
    //         //row 5
    //         Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                   'PROGRAM KESIHATAN ORAL TANPA ASAP ROKOK(KOTAK), BAHAGIAN KESIHATAN PERGIGIAN NEGERI SEMBILAN',
    //                   style: TextStyle(fontSize: desktopFontSize - 1)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     )));
  }
}
