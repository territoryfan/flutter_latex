import 'package:flutter_latex/flutter_latex.dart';
import 'package:flutter_latex/src/models/widget_meta.dart';
import 'package:flutter_latex/src/utils/style_utils.dart';

class TeXViewVideo extends TeXViewWidget {
  final String id;

  /// Uri for Image.
  final String url;

  final String _type;

  const TeXViewVideo.youtube(this.url, {this.id})
      : this._type = 'tex-view-video-youtube';

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
        id: this.id, tag: 'div', classList: _type, node: Node.Leaf);
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': _initData(),
        'style': "max-width: 100%; max-height: 100%; " + teXViewDefaultStyle,
      };

  String _initData() {
    return """<iframe width="100%" height="100%" frameborder="0" allowfullscreen
    src="https://www.youtube.com/embed/${Uri.parse(this.url).queryParameters['v']}"
    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>""";
  }
}
