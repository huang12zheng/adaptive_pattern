import 'package:adaptive_widget/src/watch_list/watch_list.dart';
import 'package:flutter/material.dart';

import '../share_date/share_data.dart';

class WatchDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WatchDemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Watch Stack Demo'),
            ),
            body: SizedBox(
                height: 122,
                width: 122,
                child: WatchList(datas: ShareData.cards(context)))));
  }
}
