gizac
============

auther: heriet (http://heriet.info/)
source: https://github.com/heriet/gizac


概要
------------
gizac（ぎざしー）はドット絵画像変換ソフトウェアです。
下記の操作が可能です。

* edg/galからgifへの変換
* edg/galからpsdへの変換

インストール方法
------------

gizac.exe を任意のディレクトリに配置してください。


使い方
------------

コマンドプロンプト等から gizac.exe を実行してください

  > gizac <コマンド> <変換元ファイルのパス（複数指定可）>

コマンド
　　gif   gifへの変換
　　psd   psdへの変換

例えば、hoge.edgをpsdに変換したい場合は

  > gizac psd hoge.edg
  convert psd: hoge.edg => hoge.psd

のように表示され、hoge.psdが出力されます


いまのところ、psd変換時には下記ような条件で変換しています。

* psd変換後はRGBカラー形式になります
* パレット上の背景色はpsdで透過色になります
* edgのページ/galのフレームはpsdのレイヤーグループに、レイヤーはpsdのレイヤーになります
* 構成やディレイなどのアニメーション情報はpsd変換時に失われます（psdのアニメーションフレームに引き継がれません）


免責事項
------------
このソフトウェアを利用することによって生じるいかなる損害に関して作者が責任を負うことはありません。ご了承ください。


連絡先
------------

なにかあれば @heriet (https://twitter.com/heriet) までどうぞ
