# Publish 手順（機知・箱）

## 現状（2026-09-27）

| 操作 | Open Cloud API キー | 結果 |
|------|---------------------|------|
| 既存 Place へ rbxl を Published | ✅ | 動作する |
| 新規 Universe/Experience 作成 | ❌ | XSRF / Cookie 必須（未サポート） |
| 既存 Universe へ Place 追加 | ❌ | 同上 |

ため「箱だけ」の**新しい**ゲーム URL を出すには、Dashboard で空 Experience を1クリック作成 → ID 共有 → こちらで publish、の2段が必要。

## Dashboard クリック手順（prisra97）

1. [Creations](https://create.roblox.com/dashboard/creations) を開く
2. 右上 **Create** → **Experience**
3. 名前: `機知・箱`（または `NEW BOX`）
4. 作成完了後:
   - Universe ID をコピー
   - Places タブ → ルート Place ID を控える
5. [API Keys](https://create.roblox.com/dashboard/credentials) で使用中キーに新体験の **universe-places Write** を追加（または Experience 制限をオフ）
6. チャットで `Universe ID` と `Place ID` を送る → エージェントが空箱 rbxl を publish

深層（`10766513367` / `122194113355813`）は上書き禁止。
