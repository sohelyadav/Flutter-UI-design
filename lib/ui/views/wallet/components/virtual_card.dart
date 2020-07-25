import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klearcard/utils/color.dart';
import 'package:klearcard/utils/style.dart';
import 'package:klearcard/utils/themes.dart';

class VirtualCardWidget extends StatefulWidget {
  final double cardHeight;

  VirtualCardWidget({this.cardHeight});

  @override
  _VirtualCardWidgetState createState() => _VirtualCardWidgetState();
}

class _VirtualCardWidgetState extends State<VirtualCardWidget> {

  List<Gradient> mCardBackgroundColor = [kBlueCard, kBlackCard, kBlueCard];
  int mSelectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.cardHeight,
          color: kCanvasColor,
          child: Swiper(
            itemCount: 3,
            viewportFraction: 0.85,
            scale: 0.9,
            loop: false,
            onIndexChanged: (index) {
              setState(() {
                mSelectedPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: mCardBackgroundColor[index],
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF73738E).withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Image.asset("assets/images/bg_card.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0, bottom: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sales team",
                                      style: GoogleFonts.muli(
                                          color: kWhite,
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      "S\$2,617.14",
                                      style: GoogleFonts.muli(
                                          color: kWhite,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14.0, top: 13.0),
                                child: Container(
                                  child: Icon(
                                    Icons.info_outline,
                                    color: kWhite,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  height: 32,
                                  width: 32,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("****", style: kStyleCardDigitText),
                                Text("****", style: kStyleCardDigitText),
                                Text("****", style: kStyleCardDigitText),
                                Text("4322", style: kStyleCardDigitText),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CARD TYPE",
                                      style: GoogleFonts.muli(
                                          color:
                                              Color(0xFFF5F5FB).withOpacity(0.7),
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "VIRTUAL",
                                      style: TextStyle(
                                          color: Color(0xFFF5F5FB),
                                          fontSize: 17.0,
                                          fontFamily: 'Ocr',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "VALID THRU",
                                      style: GoogleFonts.muli(
                                          color:
                                              Color(0xFFF5F5FB).withOpacity(0.7),
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "12/22",
                                      style: TextStyle(
                                          color: Color(0xFFF5F5FB),
                                          fontSize: 17.0,
                                          fontFamily: 'Ocr',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          color: kCanvasColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SelectedPage(numberOfDots: 3, pageIndex: mSelectedPage),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectedPage extends StatelessWidget {
  final int numberOfDots;
  final int pageIndex;

  SelectedPage({this.numberOfDots, this.pageIndex});

  Widget _inactiveIndicator() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Color(0xFFD6D6E5),
            borderRadius: BorderRadius.circular(50.0)),
      ),
    ));
  }

  Widget _activeIndicator() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 16.0,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == pageIndex ? _activeIndicator() : _inactiveIndicator());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildPageIndicator(),
      ),
    );
  }
}
