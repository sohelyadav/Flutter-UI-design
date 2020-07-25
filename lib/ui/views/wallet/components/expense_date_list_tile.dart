import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klearcard/data/remote/expense/expense_model.dart';
import 'package:klearcard/ui/views/wallet/components/expense_detail_list_tile.dart';
import 'package:klearcard/utils/color.dart';

class ExpenseDateTile extends StatelessWidget {
  final ExpenseResponse data;
  final int index;

  ExpenseDateTile(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top : 16.0,bottom: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data.expenseData[index].date}",
                style: GoogleFonts.muli(
                    color: kPrimaryColor,
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  text:
                      "${splitAndReturn(data.expenseData[index].totalAmount, 0)}",
                  style: GoogleFonts.muli(
                      color: Color(0xFF030710),
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            ".${splitAndReturn(data.expenseData[index].totalAmount, 1)}",
                        style: GoogleFonts.muli(color: Color(0xFFD6D6E5))),
                    TextSpan(
                        text: '  S\$',
                        style: GoogleFonts.muli(color: Color(0xFFD6D6E5))),
                  ],
                ),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.expenseData[index].data.length,
            itemBuilder: (BuildContext context, int childIndex) {
              return ExpenseDetailTile(
                  data.expenseData[index].data[childIndex]);
            })
      ],
    );
  }

  String splitAndReturn(String amount, int returnIndex) {
    var parts = amount.split(".");
    return parts[returnIndex].trim();
  }
}
