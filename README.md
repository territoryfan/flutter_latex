# flutter_latex
[![GitHub stars](https://img.shields.io/github/stars/shah-xad/flutter_latex?style=social)](https://github.com/shah-xad/flutter_latex/stargazers) [![pub package](https://img.shields.io/pub/v/flutter_latex.svg)](https://pub.dev/packages/flutter_latex)

<img src="https://raw.githubusercontent.com/shah-xad/flutter_latex/master/example/assets/flutter_latex_banner.png" alt=""/>

# About
A Flutter Package to render **fully offline** so many types of equations and expressions based on **LaTeX** , **TeX** and **MathML**, most commonly used are as followings:

- **Mathematics / Maths Equations and expressions** (Algebra, Calculus, Geometry, Geometry etc...)

- **Physics Equations and expressions**

- **Signal Processing Equations and expressions**

- **Chemistry Equations and expressions**

- **Statistics / Stats Equations and expressions**

- It also includes full **HTML** with **JavaScript** support.

# How it works?

Basically it's a flutter dart wrapper around the most powerful JavaScript libraries [MathJax](https://github.com/mathjax/MathJax) and [Katex](https://github.com/KaTeX/KaTeX) which render the equations in [webview_flutter_plus](https://pub.dartlang.org/packages/webview_flutter_plus).

# How to use?
**1:** Add flutter_latex latest  [![pub package](https://img.shields.io/pub/v/flutter_latex.svg)](https://pub.dev/packages/flutter_latex) version under dependencies to your package's pubspec.yaml file.

```yaml
dependencies:
  flutter_latex: ^4.0.3+4
``` 

**2:** You can install packages from the command line:

```bash
$ flutter packages get
```

Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.


**3:** Now you need to put the following implementations in `Android`, `iOS`, and `Web` respectively.

### Android
Make sure to add this line `android:usesCleartextTraffic="true"` in your `<project-directory>/android/app/src/main/AndroidManifest.xml` under `application` like this.

```xml
<application
       ...
       ...
       android:usesCleartextTraffic="true">
</application>
```

It completely works offline, without internet connection, but these are required permissions to work properly:


```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
```

It'll still work in debug mode without permissions, but it won't work in release application without mentioned permissions.

### iOS
Add following code in your `<project-directory>/ios/Runner/Info.plist`

```plist
<key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key> <true/>
  </dict>
<key>io.flutter.embedded_views_preview</key> <true/> 
```

### Web
For Web support you need to put `<script src="assets/packages/flutter_latex/js/flutter_latex.js"></script>` and `<script type="text/javascript">window.flutterWebRenderer = "canvaskit";</script>` in `<head>` tag of your `<project-directory>/web/index.html` like this.

```html
<head>
  
    <meta charset="UTF-8">
    <title>Flutter TeX</title>

    <script src="assets/packages/flutter_latex/js/flutter_latex.js"></script>
    <script type="text/javascript">window.flutterWebRenderer = "canvaskit";</script>
</head>
```

**4:** Now in your Dart code, you can use:

```dart
import 'package:flutter_latex/flutter_latex.dart'; 
```

**5:** Now you can use TeXView as a widget:

# Examples

### Quick Example

```dart
TeXView(
    child: TeXViewColumn(children: [
      TeXViewInkWell(
        id: "id_0",
        child: TeXViewColumn(children: [
          TeXViewDocument(r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
              style: TeXViewStyle(textAlign: TeXViewTextAlign.Center)),
          TeXViewContainer(
            child: TeXViewImage.network(
                'https://raw.githubusercontent.com/shah-xad/flutter_latex/master/example/assets/flutter_latex_banner.png'),
            style: TeXViewStyle(
              margin: TeXViewMargin.all(10),
              borderRadius: TeXViewBorderRadius.all(20),
            ),
          ),
          TeXViewDocument(r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
              style: TeXViewStyle.fromCSS(
                  'padding: 15px; color: white; background: green'))
        ]),
      )
    ]),
    style: TeXViewStyle(
      elevation: 10,
      borderRadius: TeXViewBorderRadius.all(25),
      border: TeXViewBorder.all(TeXViewBorderDecoration(
          borderColor: Colors.blue,
          borderStyle: TeXViewBorderStyle.solid,
          borderWidth: 5)),
      backgroundColor: Colors.white,
    ),
   ),
  )
```
# Api Changes.
* Please see [CHANGELOG.md](https://github.com/shah-xad/flutter_latex/blob/master/CHANGELOG.md).

# Api Usage.
- `children:` A list of `TeXViewWidget`

- **`TeXViewWidget`**
    - `TeXViewDocument` Holds TeX data by using a raw string e.g. `r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """` You can also put HTML and Javascript code in it.
    - `TeXViewMarkdown` Holds markdown data.
    - `TeXViewContainer` Holds a single `TeXViewWidget` with styling.
    - `TeXViewImage` renders image from assets or network.
    - `TeXViewColumn` holds a list of `TeXViewWidget` vertically.
    - `TeXViewInkWell` for listening tap events. Its child and id is mandatory.
    - `TeXViewGroup` a group of `TeXViewGroupItem` usually used to create quiz layout.
    - `TeXViewDetails` like html `<details>`.


- `TeXViewStyle()` You can style each and everything using `TeXViewStyle()` or by using custom `CSS` code by `TeXViewStyle.fromCSS()` where you can pass hard coded String containing CSS code. For more information please check the example.
    
- `renderingEngine:` Render Engine to render TeX (Default is Katex Rendering Engine). Use **Katex RenderingEngine** for fast render and  **MathJax RenderingEngine** for quality render.

- `loadingWidgetBuilder:` Show a loading widget before rendering completes.

- `onRenderFinished:` Callback with the rendered page height, when TEX rendering finishes.
  
- `onTeXViewCreated:` Callback when TeXView loading finishes.

For more please see the [Example](https://github.com/shah-xad/flutter_latex/tree/master/example).

# To Do:
- ~~Speed Optimizations as it's a bit slow rendering speed. It takes 1-2 seconds to render after application loaded.~~ (Solved by adding Katex Support)
- `Bug in Web Support` on `setState` everything disappears.

# Cautions:
- Please avoid using too many `TeXView` in a single page, because this is based on [webview_flutter_plus](https://pub.dartlang.org/packages/webview_flutter_plus) a complete web browser. Which may cause slowing down your app. I am trying to add all necessary widgets within `TeXView`, So please prefer to use `TeXViewWidget`. You can check [example folder](https://github.com/shah-xad/flutter_latex/tree/master/example) for details. If you find any problem you can [report an issue](https://github.com/shah-xad/flutter_latex/issues/new).
