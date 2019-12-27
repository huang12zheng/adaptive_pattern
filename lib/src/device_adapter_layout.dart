import 'package:flutter/material.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
/// implement:
///   1.Devices
///   2.NullHandle(DefaultHandle)
class DeviceAdapterLayout extends StatelessWidget
  implements WatchDevice,TVDevice,MobileDevice,TabletDevice,DesktopDevice{
  const DeviceAdapterLayout({Key key, 
    this.buildWatch, this.buildTV, this.buildDesktop,
    this.buildMobile, this.buildTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(builder: (BuildContext ctx, ScreenSize size) {
      switch (size.size) {
        case LayoutSize.watch: return buildWatch(ctx);
        case LayoutSize.mobile: return buildMobile(ctx,size);
        case LayoutSize.tablet: return buildTablet(ctx,size);
        case LayoutSize.desktop: return buildDesktop(ctx);
        // case LayoutSize.tv: return ;
        default:  return buildTV(ctx);
      }
    },);
  }

  final Widget Function(BuildContext context) buildWatch;
  final Widget Function(BuildContext context) buildTV;
  final Widget Function(BuildContext context) buildDesktop;
  /// [small:220] [middle:360] [large:400]
  /// [width > 600] is tablet
  final Widget Function(BuildContext context,ScreenSize size) buildMobile;
  /// [small:600] [large:720]
  final Widget Function(BuildContext context,ScreenSize size) buildTablet;

}

abstract class WatchDevice{
  Function(BuildContext context) get buildWatch;
}
abstract class TVDevice{
  Function(BuildContext context) get buildTV;
}
abstract class MobileDevice{
  Function(BuildContext context,ScreenSize size) get buildMobile;
}
abstract class TabletDevice{
  Function(BuildContext context,ScreenSize size) get buildTablet;
}
abstract class DesktopDevice{
  Function(BuildContext context) get buildDesktop;
}
