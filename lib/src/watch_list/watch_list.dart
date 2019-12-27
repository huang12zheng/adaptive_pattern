import 'package:adaptive_widget/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../watch_stack/index.dart';

class WatchList extends StatelessWidget {
  final List<CardModel> datas;

  const WatchList({Key key, this.datas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) =>
        Provider<CardModel>.value(
          value: datas[index],
          child: WatchStack(),
        )
    );
  }
}