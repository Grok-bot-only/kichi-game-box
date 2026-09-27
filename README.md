# kichi-game-box（機知・箱）

空の箱だけの Roblox 体験。深層 / DAMP FREQUENCY とは**別リポ・別体験**。

- Version: `0.0.1-box`
- 内容: 大きな床 Part + SpawnLocation + 三人称カメラ既定
- ホラーシステム・キャンパス・深層コードは含まない

## ローカル

```bash
rojo build -o game.rbxl
# または
rojo serve
```

## 新規 Experience の作成（必須・手動）

Open Cloud API キーでは **Universe/Experience の新規作成は不可**（`universes/v1/universes/create` は Cookie+XSRF 専用。2026-09 時点でも API キー対応は未提供）。

Creator Dashboard で空の体験を1つ作ってください:

1. https://create.roblox.com/dashboard/creations を開く（アカウント `prisra97`）
2. **Create** → **Experience**（または「体験を作成」）
3. テンプレートは **Baseplate** / 空でOK
4. 表示名を一時的に **機知・箱** または **NEW BOX** にする（後で改名可）
5. 作成後、体験カードの ⋯ → **Copy Universe ID**
6. 体験を開き **Places** → ルート Place の URL から Place ID を控える
   - URL例: `.../experiences/{universeId}/places/{placeId}/configure`
7. API キー設定でこの新体験に **universe-places: Write** を付与（Restrict by Experience を外すか、新体験を追加）
8. Universe ID / Place ID をエージェントに渡せば、このリポの `game.rbxl` を Place Publishing API で即 publish できる

**絶対に触らない**: Place `122194113355813` / Universe `10766513367`（深層 / 灯籠側）

## Publish（ID 受領後）

```bash
rojo build -o game.rbxl
curl -X POST \
  "https://apis.roblox.com/universes/v1/${UNIVERSE_ID}/places/${PLACE_ID}/versions?versionType=Published" \
  -H "x-api-key: $ROBLOX_OPEN_CLOUD_API_KEY" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @game.rbxl
```

プレイURL: `https://www.roblox.com/games/{PLACE_ID}/`
