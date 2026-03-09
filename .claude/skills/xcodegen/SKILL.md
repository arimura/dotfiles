---
description: XcodeGen project.yml の作成・編集時に適用する注意点。LLMが繰り返し間違えるポイントを防止する。
---

# XcodeGen 注意点

`project.yml` を作成・編集する際、以下のルールを必ず守ること。

## 1. UILaunchStoryboardName を必ず含める

ターゲットの `info.properties` に `UILaunchStoryboardName` を必ず設定する。これがないとアプリがスクリーンサイズを正しく認識できず、レイアウトが崩れる。

```yaml
targets:
  MyApp:
    type: application
    platform: iOS
    info:
      properties:
        UILaunchStoryboardName: LaunchScreen  # 必須。省略するとスクリーンサイズの認識がおかしくなる
```

## 2. CocoaPods の依存を project.yml に書かない

CocoaPods は XcodeGen が生成した `.xcodeproj` を入力として `pod install` で統合する。つまり XcodeGen → CocoaPods の順で実行される。

- `project.yml` に CocoaPods のライブラリをターゲットの `dependencies` として書く必要はない
- `pod 'LibName'` は `Podfile` で管理する
- XcodeGen が CocoaPods を意識する必要はほとんどない

```yaml
# NG: CocoaPods のライブラリを dependencies に書く
targets:
  MyApp:
    dependencies:
      - pod: Alamofire  # これは不要

# OK: CocoaPods の依存は Podfile に任せる
targets:
  MyApp:
    dependencies:
      - package: SomeSwiftPackage  # SPM の依存のみ書く
```

ワークフロー: `xcodegen generate` → `pod install` → `.xcworkspace` を使って開発する。
