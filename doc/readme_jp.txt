gizac
============

auther: heriet (http://heriet.info/)
source: https://github.com/heriet/gizac


概要
------------
gizac（ぎざしー）はドット絵画像変換ソフトウェアです。
下記の操作が可能です。

* edgからpsdへの変換


インストール方法
------------

gizac.exe を任意のディレクトリに配置してください。


使い方
------------

コマンドプロンプト等から gizac.exe を実行してください

  > gizac psd [edgファイルのパス]

例えば、hoge.edgをpsdに変換したい場合は

  > gizac psd hoge.edg
  convert psd: hoge.edg => hoge.psd

のように出力され、hoge.psdが出力されます


いまのところ、edgからpsd変換時には下記ような条件で変換しています。

* psd変換後はRGBカラー形式になります
* edgパレット上の背景色はpsdで透過色になります
* edgのページはpsdのレイヤーグループに、edgのレイヤーはpsdのレイヤーになります
* edgのページアニメーション情報はpsd変換時に失われます（psdのアニメーションフレームに引き継がれません）


免責事項
------------
このソフトウェアを利用することによって生じるいかなる損害に関して作者が責任を負うことはありません。ご了承ください。


連絡先
------------

なにかあれば @heriet (https://twitter.com/heriet) までどうぞ
