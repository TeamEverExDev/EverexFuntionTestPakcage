library after_layout;

import 'dart:async';

import 'package:flutter/widgets.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) afterFirstLayout(context);
      },
    );
  }

  // @override
  // Widget build(BuildContext buildContext) {
  //   Orientation viewOrientation = MediaQuery.of(context).orientation;
  //   if (viewOrientation == Orientation.landscape) {
  //     return landScapeView(buildContext);
  //   } else {
  //     return portraitView(buildContext);
  //   }
  // }
  //
  // Widget portraitView(BuildContext buildContext);
  //
  // Widget landScapeView(BuildContext buildContext);

  FutureOr<void> afterFirstLayout(BuildContext context);
}
