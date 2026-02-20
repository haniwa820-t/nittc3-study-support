#import "@preview/js:0.1.3": *
#import "@preview/treet:1.0.0": *
#import "@preview/frame-it:1.2.0": *
#import "@preview/muchpdf:0.1.0": muchpdf
#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("No.", gray),
  // You can add as many as you want
  syntax: ("No.",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
#show: js.with(
  lang: "ja",
  seriffont-cjk: "Harano Aji Mincho",
  sansfont: "Harano Aji Gothic",
  sansfont-cjk: "Harano Aji Gothic",
)
#set page(
  paper: "a4",
  numbering: "1",
  columns: 1,
)
#align(center)[
  #text(
    size: 20pt,
  )[
    VScodeでレポートを書こう!−準備編−
  ]
  #v(3em)
  #text(
    size: 12pt,
  )[
    山根義琉 \
    情報電子工学科2年 \
    #v(1em)
    #datetime.today().display("[year]年[month]月[day]日")
  ]
]
#outline(
  title: "目次",
  depth: 3,
  indent: auto,
)
#set page(
  columns: 2,
)
#pagebreak()
= VScodeの基礎知識
VScedeはIDE#footnote[総合開発環境]であり、テキストベースのファイルならばほぼすべての編集が快適に行える。ここではその機能の一部と共にVScodeでのGUI#footnote[graphical user interface]上の操作方法について紹介し、ドキュメント作成の準備を行う。このPDFはVScodeでtypstを使い書いている。
== 拡張機能
VScodeでは機能を拡張するために主に個人が開発している「拡張機能」をインストールすることができる。またそれについて「設定」を行うことでカスタマイズすることが可能である。
== 設定
設定にはグローバルとワークスペースがあり前者は如何様なフォルダーを開いても全てにおいて適用される設定を記述するもので、後者はそのフォルダを編集する際に適用される設定のみを記述できる。JSONというファイルを使い設定を記述することができる。ファイルはこの位置に置けばいい。
#example[ファイル構成][
  #{
    set text(font: "DejaVu Sans Mono")
    text[./]
    linebreak()
    tree-list[
      - .vscode
        - settings.json
      - etc...
    ]
  }
]
設定画面からGUIでも設定は変更できる。JSONファイルの例はこんな感じ。
```json
"files.autoSave": "afterDelay",
"[typst]": {
    "editor.wordWrap": "on",
}
```
このJSONの中身は使う組版#footnote[PDFなどにレンダリングする仕組み]エンジンによって色々な設定があるのでその都度紹介する。
== スペニット
スペニットというファイルを編集することである単語を発動条件にして雛形を出力することが可能となる。これはグローバルと拡張子#footnote[.以降のやつ eg .txt,.tex,.py]ごとに設定できる。便利なのでぜひ使ってみてほしい。
= 色々な仕組み
作成したいドキュメントの種類ごとに最適な方法があるので以降、個人的に一押しな4つを紹介する。
== MarkDown
一番ベーシックな文章作成方式で様々な場面で使われる。とりあえずMarkDownさえ入れておけば何かしらができる。

*良い点*
- シンプル
- コンパイルなし
- 互換性が高い

*悪い点*
- 応用が効かない(組版がない)
- 外部ライブラリがない
- 多少環境依存する

== ノベライター
この組み合わせは原稿用紙や進捗管理が恐ろしく有能なのでベタ打ちのテキストを作成するときは非常に強力。

*良い点*
- 日本語に特化
- 文章を書くことに有用な機能
- 文字数カウントからPDF化まで大抵できる

*悪い点*
- 記号や数式はほとんど機能しない
- カスタムできない
- 互換性がない

== LaTeX
TeXから派生した近代的な大型の組版システムで圧倒的な歴史と知名度を誇る。

*良い点*
- 今まで上で挙げたこともそれ以外もすべてできる
- 数式・図・表・絵まで同じファイルで書ける
- 大抵のことは自動でできる

*悪い点*
- 独自性が高く難解
- エラーが不親切
- コンパイルが必要(超遅い)

== Typst
現時点で一番有力なLaTeXの後継候補でRust製のモダンな組版システム。ナウい。

*良い点*
- 導入・エラー・コンパイルが初心者に優しい
- コンパイルがほぼノータイム
- 文法が明確でプログラミング言語より
- MarkDown記法を模倣した視認性の高い方式

*悪い点*
- テンプレートが少ない
- LaTeXの知識をつけても活かせない

== 結局何が良い?
まずMarkDownを触って慣れることが大切なのでそこから。文章特化ならばノベルライターへ、レポート(組版)特化ならTypstが無難。LaTeXも超おすすめなのだが難解でおそらく挫折するので試したい人だけにした方が良い。

= 環境設定
この2つは特に厄介である。複雑な環境構築とその他諸々の設定をしなくてはならない。
== MarkDown
#syntax[基礎情報][
  #terms.item[数式][◯]
  #terms.item[図表][△]
  #terms.item[描画][✗]
  #terms.item[拡張子][.md]
  #terms.item[コンパイル][なし]
]
=== 手順
+ 拡張機能Markdown All in Oneとmarkdownlintをインストール
+ .mdファイルを作成
+ 右上のボタンでプレビューとかする

== ノベルライター
#syntax[基礎情報][
  #terms.item[数式][✗]
  #terms.item[図表][✗]
  #terms.item[描画][✗]
  #terms.item[拡張子][.txt]
  #terms.item[コンパイル][なし]
]
=== 手順
+ 拡張機能novel-writerをインストール
+ .txtファイルを作成
+ 右上のボタンでプレビューとかする

== LaTeX
#syntax[基礎情報][
  #terms.item[数式][◎]
  #terms.item[図表][◎]
  #terms.item[描画][◎]
  #terms.item[拡張子][.tex]
  #terms.item[コンパイル][あり]
]
=== 手順
+ ターミナルでTeX Liveをインストール\ `brew install --cask mactex-no-gui`\ `exec $SHELL -l`\ `sudo tlmgr update --self --all`\  *ここで`-no-gui`としているがVScodeでLaTeXを使わない場合はその部分を消したコマンドにする*
+ pathを通す
+ 拡張機能LaTeX Workshopをインストール
+ settings.jsonに以下を記述
```json
//--LaTeXの整形--//
"latex-workshop.formatting.latex": "latexindent",
//--LaTeXエンジンの設定--//
"latex-workshop.latex.outDir": "output",
"latex-workshop.latex.tools": [
  { //--cmdxがあった
    "name": "lualatex",
    "command": "lualatex",
    "args": [
      "-file-line-error",
      "-synctex=1",
      "-interaction=nonstopmode",
      "-halt-on-error",
      "-output-directory=%OUTDIR%",
      "-shell-escape", //svg用
      "%DOC%"
    ],
    "env": {}
  },
  {
    "name": "pbibtex(ja)",
    "command": "pbibtex",
    "args": [
      "-kanji=utf8",
      "%OUTDIR%/%DOCFILE%"
    ]
  },
  {
    "name": "biber",
    "command": "biber",
    "args": [
      "--output-directory=%OUTDIR%",
      "%DOCFILE%"
    ]
  },
],
//--LaTeXレシピの設定--//
"latex-workshop.latex.recipes": [
  {
    "name": "lua",
    "tools": [
      "lualatex",
    ]
  },
  {
    "name": "lua*2",
    "tools": [
      "lualatex",
      "lualatex",
    ]
  },
  {
    "name": "lua-bib-lua*2",
    "tools": [
      "lualatex",
      "pbibtex(ja)",
      "lualatex",
      "lualatex",
    ]
  },
  {
    "name": "lua-biber-lua*2",
    "tools": [
      "lualatex",
      "biber",
      "lualatex",
      "lualatex",
    ]
  },
],
//--コンパイル時--//
// ⌘ + sでファイル保存時に自動でコンパイルする
"latex-workshop.latex.autoBuild.run": "onSave",
// 直近で使用したレシピでコンパイルする
"latex-workshop.latex.recipe.default": "lastUsed",
// LaTeX Workshopのインテリセンスを有効にする
"latex-workshop.intellisense.package.enabled": true,
// PDFをVSCode で開く
"latex-workshop.view.pdf.viewer": "tab",
// PDFの幅を調整する
"latex-workshop.view.pdf.zoom": "page-width",
// PDFを右側に開く
"latex-workshop.view.pdf.tab.editorGroup": "right",
//不要なファイルを削除
"latex-workshop.latex.autoClean.run": "onBuilt",
"latex-workshop.latex.autoBuild.onSave.files.ignore": [
  "**/*.sty",
  "**/*.cls",
  "**/*.tex"
],
"latex-workshop.latex.clean.fileTypes": [
  "*.aux",
  "*.bbl",
  "*.blg",
  "*.idx",
  "*.ind",
  "*.lof",
  "*.lot",
  "*.out",
  "*.toc",
  "*.acn",
  "*.acr",
  "*.alg",
  "*.glg",
  "*.glo",
  "*.gls",
  "*.ist",
  "*.fls",
  "*.log",
  "*.fdb_latexmk",
  "*.snm",
  "*.nav",
  "*.dvi",
  "*.synctex.gz",
],
```
4. ワークスペースのsetting.jsonを設定する(自由にして良い)
```json
// オートセーブ
"files.autoSave": "afterDelay",
// LaTeXファイルのときに文字列を折り返す
"[latex]": {
  "editor.wordWrap": "on",
},
// bibTeXファイルのときに文字列を折り返さない
"[bibtex]": {
  "editor.wordWrap": "off",
},
// 実行時のレシピを指定
"latex-workshop.latex.recipe.default": "lua_bibla",
// pdfの見た目を自由に変更できる
"latex-workshop.view.pdf.color.dark.pageBorderColor": "lightgrey",
"latex-workshop.view.pdf.color.dark.backgroundColor": "#0f1419",
"latex-workshop.view.pdf.color.dark.pageColorsBackground": "#FFFDE8",
"latex-workshop.view.pdf.color.dark.pageColorsForeground": "#102010",
```
5. メニューバーのTeXアイコンから実行(セーブ時に勝手にコンパイルする設定は時に邪魔なのでなくして良い)

== Typst
#syntax[基礎情報][
  #terms.item[数式][◎]
  #terms.item[図表][◯]
  #terms.item[描画][◎]
  #terms.item[拡張子][.typ]
  #terms.item[コンパイル][あり]
]
=== 手順
+ ターミナルでTypstをインストール\ `brew install typst`
+ pathを通す
+ 拡張機能Tinymist Typstをインストール
+ プレビューとコンパイルボタンが右上にできるのでそこから実行

= 実例
同じようなドキュメントを作成した際の細かい違いと文法の違いについて示す。
== MarkDownでレポート
=== ソースコード
```md
# MarkDownでレポート

- [MarkDownでレポート](#markdownでレポート)
	- [数式](#数式)
		- [ブロック](#ブロック)
		- [インライン](#インライン)

## 数式

### ブロック

ガウス積分：
$$\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}$$

オイラーの公式：
$$e^{i\theta} = \cos\theta + i\sin\theta$$

自然対数の定義：
$$\lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = e$$

テイラー展開：
$$f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!} (x-a)^n$$

### インライン

二次方程式 $ax^2 + bx + c = 0$ ($a \neq 0$) の解は：

$$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$$

判別式 $D = b^2 - 4ac$ により：

- $D > 0$ のとき、異なる2つの実数解
- $D = 0$ のとき、重解
- $D < 0$ のとき、共役な2つの複素数解

```
=== PDF出力
#figure(
  rect(stroke: 1pt + black, inset: 0pt)[
    #muchpdf(
      read("example_pdf/markdown.pdf", encoding: none),
    )
  ],
  caption: [MarkDown],
)
== Typstでレポート
=== ソースコード
```typ
#import "@preview/js:0.1.3": *
#show: js.with(
  lang: "ja",
  seriffont-cjk: "Harano Aji Mincho",
	sansfont: "Harano Aji Gothic",
  sansfont-cjk: "Harano Aji Gothic"
)
#set page(
  paper: "a4",
  numbering: "1",
  columns: 1,
)
#align(center)[
  #text(
    size: 20pt,
  )[
    Typstでレポート
  ]
  #v(2em)
  #text(
    size: 12pt,
  )[
    山根義琉 \
    #v(1em)
    #datetime.today().display("[year]年[month]月[day]日")
  ]
]
#outline(
    title: "目次",
    depth: 2,
    indent: auto,
)
= 数式
== ブロック
ガウス積分：
$
integral_(-infinity)^(infinity) e^(-x^2) d x = sqrt(pi)
$

オイラーの公式：
$
e^(i theta) = cos theta + i sin theta
$

自然対数の定義：
$
lim_(n -> infinity) (1 + 1/n)^n = e
$

テイラー展開：
$
f(x) = sum_(n=0)^(infinity) frac(f^((n))(a), n!) (x-a)^n
$
== インライン
二次方程式 $a x^2 + b x + c = 0$ ($a != 0$) の解は：
$
x = frac(-b plus.minus sqrt(b^2 - 4 a c), 2 a)
$
判別式 $D = b^2 - 4 a c$ により：
- $D > 0$ のとき、異なる2つの実数解
- $D = 0$ のとき、重解
- $D < 0$ のとき、共役な2つの複素数解
```
=== PDF出力
#figure(
  rect(stroke: 1pt + black, inset: 0pt)[
    #muchpdf(
      read("example_pdf/typst.pdf", encoding: none),
    )
  ],
  caption: [Typst],
)
== LaTeXでレポート
=== ソースコード
```latex
\documentclass{jlreq}
\usepackage[top=20truemm,bottom=20truemm%
,left=20truemm,right=20truemm]{geometry}
%
\title{\LaTeX でレポート}
\author{山根義琉}
\date{\today}
\begin{document}
\maketitle
\tableofcontents
\section{数式}
\subsection{ブロック}
ガウス積分：
\[
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
\]

オイラーの公式：
\[
e^{i\theta} = \cos\theta + i\sin\theta
\]

自然対数の定義：
\[
\lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = e
\]

テイラー展開：
\[
f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!} (x-a)^n
\]
\subsection{インライン}
二次方程式 $ax^2 + bx + c = 0$ ($a \neq 0$) の解は：

\[
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
\]

判別式 $D = b^2 - 4ac$ により：
\begin{itemize}
    \item $D > 0$ のとき、異なる2つの実数解
    \item $D = 0$ のとき、重解
    \item $D < 0$ のとき、共役な2つの複素数解
\end{itemize}
\end{document}
```
=== PDF出力
#figure(
  rect(stroke: 1pt + black, inset: 0pt)[
    #muchpdf(
      read("example_pdf/output/latex.pdf", encoding: none),
    )
  ],
  caption: [LaTeX],
)
