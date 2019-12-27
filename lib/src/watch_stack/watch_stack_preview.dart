import 'package:adaptive_widget/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchStackPreview extends StatelessWidget {
  const WatchStackPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardModel>(builder: (_, value, __) {
      // const EdgeInsets _defaultContentPadding =
      //     EdgeInsets.symmetric(horizontal: 16.0);
      // final TextDirection textDirection = Directionality.of(context);
      // final EdgeInsets resolvedContentPadding =
      //     value?.contentPadding?.resolve(textDirection) ??
      //         _defaultContentPadding;
      return SizedBox.expand(
          child: Semantics(
              label: value.label ?? '',
              selected: value.selected ?? false,
              enabled: value.enabled ?? true,
              child: SafeArea(
                  // minimum: resolvedContentPadding,
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.4,
                        child: SizedBox.expand(child: value.cover ?? Container(color: Colors.yellow,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topCenter,
                                child: value.title),
                            Align(
                                alignment: Alignment.center,
                                child: WatchPlayWidget()),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: value.subtitle),
                          ],
                        ),
                      )
                    ],
                  ))));
    });
  }
}

class WatchPlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_filled,
      color: Colors.white,
      size: 48,
    );
  }
}
