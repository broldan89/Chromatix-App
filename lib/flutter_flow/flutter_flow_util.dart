import 'package:flutter/material.dart';

export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowModel<W extends StatefulWidget> {
  void initState(BuildContext context);
  void dispose();
}

T createModel<T extends FlutterFlowModel>(
  BuildContext context,
  T Function() defaultBuilder,
) {
  return defaultBuilder();
}

extension StringExecutionContext on BuildContext {
  void goNamed(String name) => Navigator.of(this).pushNamed(name);
  void pushNamed(String name) => Navigator.of(this).pushNamed(name);
  void pop() => Navigator.of(this).pop();
}
