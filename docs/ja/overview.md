# OpenStage 40G 概要

## OpenStage 40G とは

OpenStage 40G は、Siemens Enterprise Communications の OpenStage シリーズに属する
IP 電話機。
OpenStage 40 系には SIP / HFA など複数の系統があり、本リポジトリでは主に **OpenStage 40G SIP** の実機を対象にしている。

`G` は Gigabit Ethernet 対応モデルを示すらしい。

### Factory Reset

基本中古で買うことになるが、そうなると Factory Reset したくなる。

やり方：289 を同時押して 124816 を入力する

<https://wiki.unify.com/wiki/OpenStage_SIP_FAQ#How_can_I_invoke_a_factory_reset.3F>

## 調査すること

- 配布ファームウェアの展開とファイルシステム解析
- ブートシーケンス
- Linux userspace とプロセス構成
- SSH を利用した実機上での調査
- UI の構成
- Service Menu の解析・変更
- framebuffer と LCD の表示経路
- バックライト制御
- kernel module / device node の解析
- 実機上で動作する PoC

## 資料

OpenStage シリーズには、現在も Unify OpenScape Experts Wiki 上に多くの資料が残っている。

### Unify OpenScape Experts Wiki

- Wiki: https://wiki.unify.com/
- OpenStage 40 SIP User Manual: https://wiki.unify.com/wiki/File:User_Manual_OpenStage_40_SIP.pdf
- OpenStage HFA/SIP datasheet: https://wiki.unify.com/images/e/e3/Datasheet_OpenStage_IP.pdf
- OpenStage SIP administration manual: https://wiki.unify.com/images/1/1b/Administration_Manual_OpenStage_OpenScape_Voice.pdf

### 関連する CVE など

- CVE-2024-28065
  - https://www.syss.de/fileadmin/dokumente/Publikationen/Advisories/SYSS-2024-007.txt
- CVE-2024-28066
  - https://www.syss.de/fileadmin/dokumente/Publikationen/Advisories/SYSS-2024-008.txt
- https://www.pentagrid.ch/en/blog/rce-and-local-root-in-openstage-and-openscape-phones/

## 注意

このリポジトリの内容は、手元の実機に対する解析・実験の記録である。
製品やファームウェアのすべてのリビジョンで同じ結果になることを保証するものではない。
