import 'package:flutter_latex/flutter_latex.dart';
import 'package:flutter_latex/src/utils/style_utils.dart';

///TeXViewPadding to manage different types of padding of TeXView.
class TeXViewPadding {
  final TeXViewSizeUnit sizeUnit;

  /// Top padding.
  final int top;

  /// Bottom padding.
  final int bottom;

  /// Right padding.
  final int right;

  /// Left padding.
  final int left;

  /// All sides padding and it'll override top, bottom,right and left padding.
  final int all;

  const TeXViewPadding.all(this.all, {this.sizeUnit})
      : this.top = null,
        this.bottom = null,
        this.right = null,
        this.left = null;

  const TeXViewPadding.only(
      {this.sizeUnit, this.top, this.bottom, this.right, this.left})
      : this.all = null;

  /// It'll provide CSS margin code.
  String getPadding() {
    if (this.all != null) {
      return "padding: ${getSizeWithUnit(all, sizeUnit)};";
    } else {
      return """padding: ${getSizeWithUnit(top, sizeUnit)} ${getSizeWithUnit(right, sizeUnit)} ${getSizeWithUnit(bottom, sizeUnit)} ${getSizeWithUnit(left, sizeUnit)};""";
    }
  }
}
