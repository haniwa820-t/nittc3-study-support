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