class TeXViewFont {
  /// Assign a font-family name.
  final String fontFamily;

  /// Font location e.g. 'fonts/font_name.ttf'
  final String src;

  const TeXViewFont({this.fontFamily, this.src});

  Map toJson() => {
        'font_family': this.fontFamily,
        'src': this.src,
      };
}
