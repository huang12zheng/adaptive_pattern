import 'package:adaptive_widget/base/layout_help.dart';
import 'package:flutter/material.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
/// implement:
///   1.Devices
///   2.NullHandle(DefaultHandle)
class DeviceAdapterLayout<T> extends StatelessWidget {
  const DeviceAdapterLayout({Key key,  this.component,}) : super(key: key);

  final ComponentStrategy<T> component;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(builder: (BuildContext ctx, ScreenSize size) {
      switch (size.size) {
        case LayoutSize.watch:  return component.watchBuilder(ctx,size);
        case LayoutSize.mobile: return component.mobileBuilder(ctx,size);
        case LayoutSize.tablet: return component.tabletBuilder(ctx,size);
        case LayoutSize.desktop: return component.tvBuilder(ctx,size);
        default:  return component.mobileBuilder(ctx,size);
      }
    },);
  }
}