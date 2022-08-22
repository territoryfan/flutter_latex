import 'package:flutter_latex/flutter_latex.dart';
import 'package:flutter_latex/src/models/widget_meta.dart';
import 'package:flutter_latex/src/utils/style_utils.dart';

class TeXViewInkWell extends TeXViewWidget {
  final String id;

  /// A [TeXViewWidget] as child.
  final TeXViewWidget child;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle style;

  final bool rippleEffect;

  /// On Tap Callback when a tap is triggered.
  final Function(String id) onTap;

  const TeXViewInkWell(
      {this.child,
      this.id,
      this.onTap,
      this.rippleEffect,
      this.style});

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
        id: this.id,
        tag: 'div',
        classList: 'tex-view-ink-well',
        node: Node.InternalChild);
  }

  @override
  void onTapManager(String id) {
    if (this.id == id) this.onTap(id);
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': this.child.toJson(),
        'style': this.style?.initStyle() ?? teXViewDefaultStyle,
        'rippleEffect': this.rippleEffect ?? true,
      };
}
