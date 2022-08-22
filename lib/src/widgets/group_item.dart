import 'package:flutter_latex/flutter_latex.dart';
import 'package:flutter_latex/src/models/widget_meta.dart';

class TeXViewGroupItem extends TeXViewWidget {
  final String id;

  /// A [TeXViewWidget] as child.
  final TeXViewWidget child;

  final bool rippleEffect;

  const TeXViewGroupItem(
      {this.id, this.child, this.rippleEffect});

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
        id: this.id,
        tag: 'div',
        classList: 'tex-view-group-item',
        node: Node.InternalChild);
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': this.child.toJson(),
        'rippleEffect': this.rippleEffect ?? true,
      };
}
