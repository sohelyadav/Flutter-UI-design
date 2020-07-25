import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klearcard/data/remote/expense/expense_model.dart';
import 'package:klearcard/utils/color.dart';

class ExpenseDetailTile extends StatelessWidget {
  final Datum data;

  ExpenseDetailTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(12.0),
                  color: Color(0xFFF5F5FB),
                ),
                child: Image.asset(data.logo),
              ),
              SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.serviceName}",
                    style: GoogleFonts.muli(
                        color: Color(0xFF373A4D),
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${data.teamName}",
                    style: GoogleFonts.muli(
                      color: kPrimaryColor,
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
          RichText(
            text: TextSpan(
              text: "${splitAndReturn(data.amount, 0)}",
              style: GoogleFonts.muli(
                  color: Color(0xFF030710),
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                    text: ".${splitAndReturn(data.amount, 1)}",
                    style: GoogleFonts.muli(
                        color:
                        Color(0xFFD6D6E5))),
                TextSpan(
                    text: '  S\$',
                    style: GoogleFonts.muli(
                        color:
                        Color(0xFFD6D6E5))),
              ],
            ),
          )
        ],
      ),
    );
  }

  String splitAndReturn(String amount, int returnIndex) {
    var parts = amount.split(".");
    return parts[returnIndex].trim();
  }
}
