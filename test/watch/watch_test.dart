import 'package:adaptive_widget/adaptive_widget.dart';
import 'package:adaptive_widget/src/watch_list/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'watch_demo.dart';

void main() {
  /// [ShareData]
  testWidgets('Watch Item1 switch', (WidgetTester tester) async{
    await tester.pumpWidget(WatchDemo());
    expect(find.byType(WatchList),findsOneWidget);
    
    final element = tester.element(find.byType(AnimatedCrossFade));
    
    expect((element.widget as AnimatedCrossFade).crossFadeState,CrossFadeState.showFirst);
    await switchToDetail(tester);
    expect((element.widget as AnimatedCrossFade).crossFadeState,CrossFadeState.showSecond);  
  });

  testWidgets('Watch Item1 scroll', (WidgetTester tester) async{
    await tester.pumpWidget(WatchDemo());
    expect(find.byType(WatchList),findsOneWidget);
    
    final element = tester.element(find.byType(AnimatedCrossFade));
    
    /// before
    expect((element.widget as AnimatedCrossFade).crossFadeState,CrossFadeState.showFirst);
    await switchToDetail(tester);
    /// after
    expect((element.widget as AnimatedCrossFade).crossFadeState,CrossFadeState.showSecond);

    final listview = tester.element(find.byKey(Key('WatchStackDetail')));
    // expect((listview.widget as ScrollView).controller.offset!=0,true);  
  });
}

Future switchToDetail(WidgetTester tester) async {
  expect(find.text('test'), findsOneWidget);
  await tester.tap(find.byType(WatchStack));
  await tester.pump();
}