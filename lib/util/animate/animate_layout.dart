import 'package:flutter/material.dart';

AnimatedCrossFadeBuilder autoLayoutBuilderStragery =
    (topChild, topChildKey, bottomChild, bottomChildKey) {
  return Stack(alignment: Alignment.center, children: <Widget>[
    Positioned(key: bottomChildKey, child: bottomChild),
    Positioned(key: topChildKey, child: topChild,)
  ]);
};
