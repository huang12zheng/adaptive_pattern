import 'package:adaptive_widget/src/watch_list/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_widget/util/data_provider.dart';

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



const String detail_str='123456,AMZHUANG\nzx do a artwork produce\n it is a good thing\n thank you.';

const String detail_str2=r"""
Runes input = new Runes('\u2665');
var index = String.fromCharCodes(input);
复制代码I/flutter ( 6849): index1：9829
I/flutter ( 6849): index1：[9829]
I/flutter ( 6849): index1：(9829)

作者：前行的乌龟
链接：https://juejin.im/post/5dbc5f6ff265da4d104b86be
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。';
""";

class ShareData{
  static List<CardModel> cards(context)=> [
    CardModel(
          title: Text('test',style: Theme.of(context).textTheme.display1,),
          subtitle: Text('test zx\n no need',style: Theme.of(context).textTheme.subtitle,),
          detail: [Text(detail_str*5,style: Theme.of(context).textTheme.body1)],
        ),
    CardModel(
          title: Text('test2',style: Theme.of(context).textTheme.display1,),
          subtitle: Text('pageView2',style: Theme.of(context).textTheme.subtitle,),
          detail: [Text(detail_str2,style: Theme.of(context).textTheme.body1)],
        )
  ];
}