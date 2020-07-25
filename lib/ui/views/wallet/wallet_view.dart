import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klearcard/ui/views/wallet/components/cards_animation.dart';
import 'package:klearcard/ui/views/wallet/components/expense_date_list_tile.dart';
import 'package:klearcard/ui/views/wallet/components/virtual_card.dart';
import 'package:klearcard/utils/color.dart';
import 'package:klearcard/utils/demins.dart';
import 'package:klearcard/ui/views/wallet/wallet_viewModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatefulWidget {
  @override
  WalletViewState createState() => WalletViewState();
}

class WalletViewState extends State<WalletView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CardsAnimation cardsAnimation;
  static PanelController _slidingPanelController = new PanelController();

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    cardsAnimation = CardsAnimation(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return ViewModelBuilder<WalletViewModel>.reactive(
        onModelReady: (model) => model.fetchExpenseData(),
        viewModelBuilder: () => WalletViewModel(),
        builder: (context, walletViewModel, child) {
          return AnimatedBuilder(
              animation: cardsAnimation.controller,
              builder: (BuildContext context, Widget child) {
                return SlidingUpPanel(
                  controller: _slidingPanelController,
                  minHeight: MediaQuery.of(context).size.height - 420,
                  maxHeight: MediaQuery.of(context).size.height,
                  borderRadius: kSlidingUpPanelCornerRadius,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: Color.fromRGBO(0, 0, 0, 0.0),
                    )
                  ],
                  collapsed: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        height: 4,
                        width: 48,
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(2.0)),
                      ),
                    ],
                  ),
                  panel: Padding(
                    padding: const EdgeInsets.only(bottom: 76),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 48.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions",
                                style: GoogleFonts.muli(
                                    color: kBlack,
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w900),
                              ),
                              Image.asset(
                                "assets/icons/ic_filter.png",
                                height: 18,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 24, left: 16.0, right: 16.0),
                            child: walletViewModel.isBusy == true
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: CupertinoActivityIndicator())
                                : ListView.builder(
                                    itemCount: walletViewModel
                                        .expenseData.expenseData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ExpenseDateTile(
                                          walletViewModel.expenseData, index);
                                    }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 16.0, bottom: 24.0),
                        child: Text(
                          "Wallets",
                          style: GoogleFonts.muli(
                              color: kBlack,
                              fontSize: 34.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Transform(
                        transform: new Matrix4.translationValues(
                          cardsAnimation.cardsScrollerXTranslation.value,
                          0.0,
                          0.0,
                        ),
                        child: Container(
                          color: kWhite,
                          child: VirtualCardWidget(
                            cardHeight: 210.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
