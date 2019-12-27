import 'package:adaptive_widget/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'watch_stack.dart';

class WatchStackDetail extends StatelessWidget{
  final int scrollStrategy;

  const WatchStackDetail({Key key, this.scrollStrategy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CardModel,WatchStackModel>(builder: 
      (BuildContext context, CardModel value, WatchStackModel value2, Widget child) =>
        ListView(
          key: Key('WatchStackDetail'),
          children: [SizedBox(height: 72), ...value.detail.map((item)=>ListTile(subtitle: item)) ] ?? [Text('No Data Here')],
          controller: value2.controller,
        )
    );
  }

}
