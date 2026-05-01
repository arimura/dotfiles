---
description: Markdown を書くときのスタイルルール。表は使わず箇条書きで表現する等、editor/terminal での可読性を優先する。
---

# Markdown Style

Markdown を書く際は以下のルールに従う。

## 表 (table) は使わない

理由: editor や terminal で表示したときに崩れやすく、読みにくいため。

代わりに **箇条書き (list)** を使って同じ情報を表現する。

### NG 例

```markdown
| Name  | Type   | Description     |
| ----- | ------ | --------------- |
| id    | int    | ユーザーID       |
| name  | string | ユーザー名       |
```

### OK 例

```markdown
- `id` (int): ユーザーID
- `name` (string): ユーザー名
```

項目数が多い・階層がある場合はネストした list で表現する。

```markdown
- ユーザー
  - `id` (int): ユーザーID
  - `name` (string): ユーザー名
- 投稿
  - `id` (int): 投稿ID
  - `body` (string): 本文
```
