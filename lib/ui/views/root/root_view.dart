import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klearcard/ui/views/empty/empty_view.dart';
import 'package:klearcard/ui/views/root/root_viewModel.dart';
import 'package:klearcard/ui/views/wallet/wallet_view.dart';
import 'package:klearcard/utils/color.dart';
import 'package:stacked/stacked.dart';

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  DateTime backButtonPressTime;

  List<Widget> originalScreenList;
  Map<int, bool> originalScreenDic;
  List<Widget> listScreens;
  List<int> listScreensIndex;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();

    originalScreenList = [
      WalletView(),
      EmptyView("Teams"),
      EmptyView("Requests"),
      EmptyView("More"),
    ];
    originalScreenDic = {0: true, 1: false, 2: false, 3: false, 4: false};
    listScreens = [originalScreenList.first];
    listScreensIndex = [0];
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      viewModelBuilder: () => RootViewModel(),
      builder: (context, dashboardViewModel, child) => AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: kCanvasColor,
          body: SafeArea(
            child: IndexedStack(
                index: listScreensIndex.indexOf(tabIndex),
                children: listScreens),
          ),
          bottomNavigationBar: _buildTabBar(),
        ),
      ),
    );
  }

  void _selectedTab(int index) {
    if (originalScreenDic[index] == false) {
      listScreensIndex.add(index);
      originalScreenDic[index] = true;
      listScreensIndex.sort();
      listScreens = listScreensIndex.map((index) {
        return originalScreenList[index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  Widget _buildTabBar() {
    var listItems = [
      BottomAppBarItem(icon: "assets/icons/ic_wallet.png", title: "Wallet"),
      BottomAppBarItem(icon: "assets/icons/ic_teams.png", title: "Teams"),
      BottomAppBarItem(icon: "assets/icons/ic_requests.png", title: "Requests"),
      BottomAppBarItem(icon: "assets/icons/ic_more.png", title: "More"),
    ];

    var items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
      );
    });

    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF9696bb).withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
      color: kWhite,
    );
  }

  Widget _buildTabItem({
    BottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: 58,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item.icon,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  item.title,
                  style: GoogleFonts.muli(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: tabIndex == index
                          ? Color(0xFF5273E2)
                          : Color(0xFF9696BB)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop(BuildContext context) async {
    DateTime currentTime = DateTime.now();
    bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            currentTime.difference(backButtonPressTime) > Duration(seconds: 2);
    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = currentTime;
      return false;
    }
    return true;
  }
}

class BottomAppBarItem {
  String icon;
  String title;

  BottomAppBarItem({this.icon, this.title});
}
