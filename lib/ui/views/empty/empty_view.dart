import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {
  final String pageName;

  EmptyView(this.pageName);

  @override
  _EmptyViewState createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("${widget.pageName}")));
  }
}
