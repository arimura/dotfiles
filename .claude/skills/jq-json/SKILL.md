---
description: JSON の処理・整形・抽出には jq コマンドを利用する。
---

# JSON 処理には jq を使う

JSON データの処理・整形・抽出・変換を行う際は、Python や Node.js などのスクリプトではなく `jq` コマンドを使うこと。

## 基本方針

- JSON の整形（pretty print）: `jq .`
- フィールドの抽出: `jq '.key'` や `jq '.array[].name'`
- フィルタリング: `jq '.[] | select(.status == "active")'`
- 変換・加工: `jq '{name: .first_name, age: .age}'`
- 複数ファイルの処理もパイプと組み合わせて `jq` で行う

## 例

```bash
# API レスポンスから特定フィールドを抽出
curl -s https://api.example.com/data | jq '.results[].id'

# JSON ファイルの整形
jq . input.json > formatted.json

# 条件付きフィルタ
jq '[.[] | select(.price > 100)]' products.json

# キーの追加・変換
jq '.items[] | {id, display: .name + " (" + .category + ")"}' data.json
```

## 注意点

- Bash ツールで `jq` を使うこと（Grep や Read ではなく）
- JSON の妥当性チェックにも `jq empty` を活用する
- 複雑な変換でも、まず `jq` で実現できないか検討してから他の手段を考える
