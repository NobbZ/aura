-- Library for AURA output in different languages.

module AuraLanguages where

import Utilities (colourize, cyan)

data Language = English | Japanese deriving (Eq,Enum,Show)

allLanguages :: [Language]
allLanguages = [English ..]

english :: Language
english = English

japanese :: Language
japanese = Japanese

-- Backticks
bt :: String -> String
bt cs = "`" ++ colourize cyan cs ++ "`"

-- AuraLib functions
buildPackagesMsg1 :: Language -> String -> String
buildPackagesMsg1 English p  = "Building " ++ bt p ++ "..."
buildPackagesMsg1 Japanese p = bt p ++ "を作成中・・・"

buildPackagesMsg2 :: Language -> String
buildPackagesMsg2 English  = "So be it."
buildPackagesMsg2 Japanese = "分かった。脱出！"

buildFailMsg1 :: Language -> String -> String
buildFailMsg1 English p  = "Well, building " ++ bt p ++ " failed."
buildFailMsg1 Japanese p = bt p ++ "の作成は失敗したようだ。"

buildFailMsg2 :: Language -> String
buildFailMsg2 English  = "Also, the following weren't built:"
buildFailMsg2 Japanese = "ちなみに下記のパッケージも作成されなかった："

buildFailMsg3 :: Language -> String
buildFailMsg3 English  = "Some packages may have built properly."
buildFailMsg3 Japanese = "今のは失敗したけど前に作成のできたやつ" ++
                             "があるかもしれない。"
buildFailMsg4 :: Language -> String
buildFailMsg4 English  = "Would you like to install them? [y/n]"
buildFailMsg4 Japanese = "できたやつのインストールを続行する？ [y/n]"

displayBuildErrorsMsg1 :: Language -> String
displayBuildErrorsMsg1 English  = "Dumping makepkg output in "
displayBuildErrorsMsg1 Japanese = "抑えていたmakepkgの出力を受け取る用意・・・"

getDepsToInstallMsg1 :: Language -> String
getDepsToInstallMsg1 English  = "No AUR packages specified for install."
getDepsToInstallMsg1 Japanese = "パッケージは一つも指摘されていない。"

getRealPkgConflictsMsg1 :: Language -> String -> String -> String -> String
getRealPkgConflictsMsg1 English name rec req =
    "The dependency " ++ bt name ++ " demands version " ++ bt req ++ ",\n" ++
    "but the most recent version is " ++ bt rec ++ "."
getRealPkgConflictsMsg1 Japanese name rec req =
    "パッケージ" ++ bt name ++ "はバージョン" ++ bt req ++ "を要するが" ++
    "一番最新のバージョンは" ++ bt rec ++ "。"

getRealPkgConflictsMsg2 :: Language -> String -> String
getRealPkgConflictsMsg2 English p = 
    bt p ++ " is an ignored package! See your `pacman.conf` file."
getRealPkgConflictsMsg2 Japanese p =
    bt p ++ "は無視されるパッケージ！`pacman.conf`を参考に。"

getVirtualConflictsMsg1 :: Language -> String -> String
getVirtualConflictsMsg1 English p =
    bt p ++ " exists in NO WAY as a package or as one provided by another!"
getVirtualConflictsMsg1 Japanese p =
    bt p ++ "はパッケージでもないし、他のパッケージにも提供されていない！"
                                     
getVirtualConflictsMsg2 :: Language -> String -> String -> String
getVirtualConflictsMsg2 English p pro =
    bt pro ++ " provides " ++ bt p ++ ", but " ++ bt pro ++
    " is an ignored package."
getVirtualConflictsMsg2 Japanese p pro =
    bt p ++ "は" ++ bt pro ++ "に提供されているが、" ++ bt pro ++
    "は無視されるパッケージ。"

-- Fix this up. Inconsistent variable names too.
getVirtualConflictsMsg3 :: Language -> String -> String -> String -> String ->
                           String
getVirtualConflictsMsg3 English d dVer pro proVer =
    "The dependency " ++ bt d ++ " demands version " ++ bt dVer ++
    " but its providing package " ++ bt pro ++ " gives version " ++ bt proVer
getVirtualConflictsMsg3 Japanese d dVer pro proVer =
    "仮のパッケージ" ++ bt d ++ "はバージョン" ++ bt dVer ++ "を要するが、" ++
    "それを提供する" ++ bt pro ++ "はバージョン" ++ bt proVer ++
    "しか提供しない"

-- aura functions
executeOptsMsg1 :: Language -> String
executeOptsMsg1 English  = "Conflicting flags given!"
executeOptsMsg1 Japanese = "矛盾しているオプションあり。"

installPackagesMsg1 :: Language -> String
installPackagesMsg1 English  = "Dependency checking failed for these reasons:"
installPackagesMsg1 Japanese = "従属パッケージの確認は以下の理由で失敗した："

installPackagesMsg2 :: Language -> String
installPackagesMsg2 English  = "No valid packages specified."
installPackagesMsg2 Japanese = "適当なパッケージを入力してください。"

installPackagesMsg3 :: Language -> String
installPackagesMsg3 English  = "Continue? [y/n]"
installPackagesMsg3 Japanese = "続行？ [y/n]"

installPackagesMsg4 :: Language -> String
installPackagesMsg4 English  = "Installation manually aborted."
installPackagesMsg4 Japanese = "続行は意図的に阻止された。"

installPackagesMsg5 :: Language -> String
installPackagesMsg5 English  = "Determining dependencies..."
installPackagesMsg5 Japanese = "従属パッケージを確認中・・・"

reportNonPackagesMsg1 :: Language -> String
reportNonPackagesMsg1 English  = "The following are not packages:"
reportNonPackagesMsg1 Japanese = "下記はパッケージではない："

reportIgnoredPackagesMsg1 :: Language -> String
reportIgnoredPackagesMsg1 English  = "The following packages will be ignored:"
reportIgnoredPackagesMsg1 Japanese = "下記のパッケージは無視される："

reportPkgsToInstallMsg1 :: Language -> String
reportPkgsToInstallMsg1 English  = "Pacman dependencies:"
reportPkgsToInstallMsg1 Japanese = "Pacmanの従属パッケージ："

reportPkgsToInstallMsg2 :: Language -> String
reportPkgsToInstallMsg2 English  = "AUR dependencies:"    
reportPkgsToInstallMsg2 Japanese = "AURの従属パッケージ："

reportPkgsToInstallMsg3 :: Language -> String
reportPkgsToInstallMsg3 English  = "Main AUR packages:"    
reportPkgsToInstallMsg3 Japanese = "主なAURパッケージ："
    
reportBadDowngradePkgsMsg1 :: Language -> String
reportBadDowngradePkgsMsg1 English = 
    "The following aren't installed, and thus can't be downgraded:"
reportBadDowngradePkgsMsg1 Japanese =
    "このパッケージは最初からインストールしていないので、格下げはできない。"

upgradeAURPkgsMsg1 :: Language -> String
upgradeAURPkgsMsg1 English  = "Fetching PKGBUILDs..."
upgradeAURPkgsMsg1 Japanese = "PKGBUILDをダウンロード中・・・"

upgradeAURPkgsMsg2 :: Language -> String
upgradeAURPkgsMsg2 English  = "Comparing package versions..."
upgradeAURPkgsMsg2 Japanese = "バージョンを比較中・・・"

upgradeAURPkgsMsg3 :: Language -> String
upgradeAURPkgsMsg3 English  = "No AUR package upgrades necessary."
upgradeAURPkgsMsg3 Japanese = "アップグレードは必要ない。"

upgradeAURPkgsMsg4 :: Language -> String -> String
upgradeAURPkgsMsg4 English p  = "Got " ++ bt p ++ "."
upgradeAURPkgsMsg4 Japanese p = bt p ++ "、OK."

downloadTarballsMsg1 :: Language -> String -> String
downloadTarballsMsg1 English p  =
    "Downloading " ++ bt p ++ " source tarball..."
downloadTarballsMsg1 Japanese p =
    bt p ++ "のソースコードのターボールをダウンロード中・・・"

displayPkgbuildMsg1 :: Language -> String -> String
displayPkgbuildMsg1 English pkg  = bt pkg ++ " does not exist."
displayPkgbuildMsg1 Japanese pkg = bt pkg ++ "は存在しない。"

getDowngradeChoiceMsg1 :: Language -> String -> String
getDowngradeChoiceMsg1 English p =
    "What version of " ++ bt p ++ " do you want?"
getDowngradeChoiceMsg1 Japanese p =
    bt p ++ "はどのバージョンにする？"

displayOutputLanguagesMsg1 :: Language -> String
displayOutputLanguagesMsg1 English = "The following languages are available:"
displayOutputLanguagesMsg1 Japanese = "auraは以下の言語に対応している："

-- Pacman functions
syncDatabaseMsg1 :: Language -> String
syncDatabaseMsg1 English  = "Syncing package database..."
syncDatabaseMsg1 Japanese = "パッケージのデータベースを同期・・・"