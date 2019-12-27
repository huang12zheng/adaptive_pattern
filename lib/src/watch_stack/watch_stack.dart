import 'package:adaptive_widget/util/animate/animate_layout.dart';
import 'package:adaptive_widget/util/provider_widget.dart';
import 'watch_stack_detail.dart';
import 'watch_stack_preview.dart';
import 'package:flutter/material.dart';

enum WatchState { preview, detail }

class WatchStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// ProviderWidget is StatefulWidget. model would set only once in state
    return ProviderWidget<WatchStackModel>(
        model: WatchStackModel(),
        builder: (BuildContext context, WatchStackModel value, Widget child) =>
            AnimatedCrossFade(
                crossFadeState: value.crossFadeState(),
                duration: const Duration(milliseconds: 1000),
                firstChild: GestureDetector(
                    onTap: value.toggleDetail, child: WatchStackPreview()),
                secondChild: GestureDetector(
                  onTap: value.togglePreview,
                  onDoubleTap: value.topBack,
                  child: WatchStackDetail()),
                layoutBuilder: autoLayoutBuilderStragery
                ));
  }
}

/// implement:
/// 1. click, [crossFade] [scroll]
/// 2. click again, [crossFade] back, not [scroll]
class WatchStackModel with ChangeNotifier {
  WatchState state = WatchState.preview;
  ScrollController controller = new ScrollController();

  toggleDetail() async {
    state = WatchState.detail;
    notifyListeners();
    await controller.animateTo(controller.position.maxScrollExtent,
      duration: Duration(
        milliseconds: (controller.position.maxScrollExtent-controller.offset).toInt()*20),
        curve: Curves.linear
    );
    print(controller.offset);
  }

  togglePreview() {
    state = WatchState.preview;
    notifyListeners();
  }

  topBack(){
    controller.animateTo(0,duration: Duration(milliseconds: 500),curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  CrossFadeState crossFadeState() {
    return state == WatchState.preview
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond;
  }
}
