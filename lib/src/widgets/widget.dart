import 'package:flutter_latex/src/models/widget_meta.dart';

abstract class TeXViewWidget {
  const TeXViewWidget();

  TeXViewWidgetMeta meta();

  void onTapManager(String id) {}

  Map<dynamic, dynamic> toJson();
}
