import 'package:flutter_latex/flutter_latex.dart';
import 'package:flutter_latex/src/models/widget_meta.dart';
import 'package:flutter_latex/src/utils/style_utils.dart';

class TeXViewContainer extends TeXViewWidget {
  final String id;

  /// A [TeXViewWidget] as child.
  final TeXViewWidget child;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle style;

  const TeXViewContainer({this.id, this.child, this.style});

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
        id: this.id,
        tag: 'div',
        classList: 'tex-view-container',
        node: Node.InternalChild);
  }

  @override
  void onTapManager(String id) {
    this.child.onTapManager(id);
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': this.child.toJson(),
        'style': this.style?.initStyle() ?? teXViewDefaultStyle,
      };
}
