# ファームウェア

ファームウェアの入手は少し困難である。

> 公式のOpenStage 40GファームウェアはUnify（シーメンス・エンタープライズ・コミュニケーションズ）は、本製品を一般公開したり、無料ダウンロードとして配布したりしていません。
> これには、有効なサービス契約、またはUnify OpenScape Experts Wiki経由での公式パートナーログインが必要です。
> ただし、古いリリースファイルやコミュニティで共有されているリリースファイルは、 IP-Phone-Forumなどの通信ユーザーコミュニティやアーカイブされたストレージリポジトリで時折議論され、共有されています。

らしい。

いろいろと調べると、どうやら謎のサイトで公開されている（いた？）らしい。

- <https://web.archive.org/web/20250314025743/https://dls.grosc.com/>

これの、`OS40_SIP_V3_R5_21_0.img` というものがそれ。
いかんせん、よくわからないサイトなので、グレーというかあんまり良い方法ではない気がする。

## 展開方法

少し古いファームウェアなら簡単に展開ができてしまう。

GitHub で調べると以下のリポジトリを発見する。

<https://github.com/fffilimonov/siemen_op_firm>

> firmware repack siemens openstage 40/60/80

これの [`unpack.sh`](https://github.com/fffilimonov/siemen_op_firm/blob/master/unpack.sh) を用いれば展開可能。
なんとご丁寧に [`pack.sh`](https://github.com/fffilimonov/siemen_op_firm/blob/master/pack.sh) もある。謎すぎる。
GPL-2.0 license なのもよくわからない。

### 関連する CVE

簡単に展開できてしまうことは CVE になっているらしい。（CVE-2024-28065）

> Unify CP IP Phone firmware files are not encrypted and contain sensitive information such as the root password hash (see SYSS-2024-008[2]).
>
> https://www.syss.de/fileadmin/dokumente/Publikationen/Advisories/SYSS-2024-007.txt

ご丁寧に PoC もある。

驚きポイントとして、先程の GitHub に上がっている謎リポジトリは 2014 年からあるが、この CVE は 2024 年に発見・報告されている。

## わかったこと

解析対象のファームウェアには Linux 用の root ファイルシステムが含まれており、一般的な組込み Linux と同様にファイル単位で調査できる。

とりあえず以下のような要素が確認できる。

- BusyBox
- uClibc
- init script
- OpenStage 固有のアプリケーション・ライブラリ
  - `/Opera_Deploy` がそれ
- kernel module
- UI 関連リソース

CPU arch は MIPS BE （なので、解析時はエンディアンなどに注意が必要）

- c.f. [MIPSのABIのここが変.md](https://gist.github.com/rui314/b3a5b107ce20c2d54f345216cc15a980)
