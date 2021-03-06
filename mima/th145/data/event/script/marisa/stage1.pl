#========================================================================
#	霧雨魔理沙ストーリー
#	ステージ１　VS霊夢
#	場所：神社
#	ステージタイトル
#	   「もう後戻りは出来ない」
#
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

#フェイス画像参照の定義
,LoadImageDef,"data/event/pic/marisa.csv"
,LoadImageDef,"data/event/pic/reimu.csv"

#フェイス画像
,DefineObject,marisa,-360,0,false
,DefineObject,reimu,-360,0,true

,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,GoSub,init				,# 初期化ルーチン呼び出し

#開始カメラ演出
,Function,GameStory_BeginCamera();
,Sleep,2,#ウェイト命令
,Function,"::act.fader.FadeIn(60, 0x00000000, null);"

,Function,"GameStory_PlayBGM(701);",# 会話BGM再生開始

#肩書き登録
,DefineObject,marisa_label,50,360,false
,DefineObject,reimu_label,1120,360,false

#初期表情設定
,ImageDef,marisa,魔理沙_普1,0,0
,ImageDef,reimu,霊夢_普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Function,"function main(){ for (local i=0; i < 60; i++) suspend(); }"

#タイトルコール出現
,Function,GameStory_TitleCall();
,Function,"function main(){ for (local i=0; i < 150; i++) suspend(); }"

# 1P上から登場
,Function,GameStory_1P_In_Side(),
,Function,"function main(){ for (local i=0; i < 90; i++) suspend(); }"
,Function,GameStory_2P_In_Side(),
,Function,"function main(){ for (local i=0; i < 60; i++) suspend(); }"


,SetFocus,marisa		,#発言中キャラを指定
,ImageDef,marisa,魔理沙_嬉1,0,0
,th145_Show,marisa,-1280	,#霊夢フェイス表示開始
a\,a11x2,0,0
,ImageDef,marisa,魔理沙_驚3,0,0
b\,a15x3,0,0
,ClearBalloon,marisa


,SetFocus,reimu		,#発言中キャラを指定
,ImageDef,reimu,霊夢_汗1,0,0
,th145_Show,reimu,-1280	,#霊夢フェイス表示開始
c\,a15x3,0,0
,ImageDef,reimu,霊夢_敵2,0,0
d\,a15x3,0,0
,ClearBalloon,reimu


#紹介カット表示　霊夢は「霊夢_敵2」からのみ実行可能\,a11x2,0,0
,th145_CharName_Cutin,reimu
,Function,"function main(){ for (local i=0; i < 30; i++) suspend(); }"

# ********************************************
# ********************************************

,SetFocus,marisa,
,ImageDef,marisa,魔理沙_普1,0,0
e\,a11x2,0,0
,ClearBalloon,marisa

,SetFocus,reimu,
,ImageDef,reimu,霊夢_惑1,0,0
f\,c11x2,0,0
,ImageDef,reimu,霊夢_普2,0,0
g\,a11x2,0,0
,ImageDef,reimu,霊夢_惑1,0,0
h\,a15x3,0,0
,ClearBalloon,reimu

,SetFocus,marisa,
,ImageDef,marisa,魔理沙_決1,0,0
i\,a15x3,0,0
,ClearBalloon,marisa

,SetFocus,reimu,
,ImageDef,reimu,霊夢_怒1,0,0
j\,a11x2,0,0
,ClearBalloon,reimu

,SetFocus,marisa,
,ImageDef,marisa,魔理沙_普2,0,0
k\,a15x3,0,0
,ClearBalloon,marisa

,SetFocus,reimu,
,ImageDef,reimu,霊夢_決1,0,0
l\,a15x3,0,0
,ClearBalloon,reimu

,SetFocus,marisa,
,ImageDef,marisa,魔理沙_普1,0,0
o\,a15x3,0,0
,ClearBalloon,marisa


,Function,"StopBGM(500);",# BGM停止

#両者フェイス撤去
,th145_Hide,marisa,-1280,&
,th145_Hide,reimu,-1280,

,Function,"GameStory_PlayBattleBGM(503);",# 戦闘BGM再生開始

,Function,"RoundStory_Ready();",# TODO::対戦開始命令

,End

# -----------------
# 戦闘中に会話が入ります（スペルカード一つ使った後くらいかな）
#
:main_2

,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_決1,0,0
,ImageDef,reimu,霊夢_決1,0,0

,Sleep,5

#,Move,marisa,0,-25,25	,#フェイス画像位置を非トーク位置にシフト
,th145_Show,marisa,-1280,&,#魔理沙フェイス表示開始
,th145_Show,reimu,-1280,#魔理沙フェイス表示開始


,SetFocus,marisa		,#発言中キャラを指定
p\,a15x3,0,0
,ClearBalloon,marisa

,SetFocus,reimu		,
x\,a15x3,0,0
,ClearBalloon,reimu


#両者フェイス撤去
,th145_Hide,marisa,-1280,&
,th145_Hide,reimu,-1280,

,Sleep,60

,Function,"RoundStory_TalkFight();",# TODO::対再開命令

,End


# -------------------------------------------------------
# 敗北編
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_負1,0,0
,ImageDef,reimu,霊夢_余1,0,0

,th145_Show,marisa,-1280	,&,#魔理沙フェイス表示開始
,th145_Show,reimu,-1280	,#魔理沙フェイス表示開始

,SetFocus,reimu
,ImageDef,reimu,霊夢_汗1,0,0
r\,a11x2,0,0



,Function,"::StopBGM(1500);"
#コンテニュー処理へのジャンプを予定　現在は仮で次のステージに進んでから一つ戻る処理を行い、同ステージの最初から再開します
,Thread,"::story.BeginOpening();"#オープニング開始

,End

# -------------------------------------------------------
# 勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_驚1,0,0
,ImageDef,reimu,霊夢_負1,0,0

,th145_Show,marisa,-1280	,&,#魔理沙フェイス表示開始
,th145_Show,reimu,-1280	,#魔理沙フェイス表示開始


,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_普1,0,0
t\,a15x3,0,0
,ImageDef,marisa,魔理沙_普2,0,0
u\,a15x3,0,0
,ClearBalloon,marisa

,SetFocus,reimu		,
,ImageDef,reimu,霊夢_負1,0,0
w\,a15x3,0,0
,ClearBalloon,reimu

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_普2,0,0
x\,a15x3,0,0
,ClearBalloon,marisa


,Function,"::StopBGM(1500);"
,Thread,"::story.NextStage();"



,End

# -------------------------------------------------------
# サブルーチン
# -------------------------------------------------------
:TestMessage
サブルーチン実行\
,ClearBalloon
,Return
