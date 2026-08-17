# 週次 AI ニュース HTML 生成

今日の日付を確認し、以下の手順で今週の AI ニュース HTML を生成してください。

## 作業ディレクトリ
/Users/akihiro.miki/Documents/ai_news/

---

## 手順

### STEP 1: ニュース収集
Web 検索で **過去7日間** の AI ニュースを収集する。以下のキーワードを組み合わせて複数回検索すること：

- `AI news [今週の年月] engineers developers tools`
- `LLM new model release [今週の年月]`
- `AI creative tools generative [今週の年月]`
- `AI agent coding productivity [今週の年月]`

**優先するトピック**: 新モデルリリース、開発者向けツール、AIエージェント、クリエイティブAI、セキュリティ
**除外**: 投資・M&Aのみのニュース、政治規制のみの話題

面白い・重要な記事を **10本** 選ぶ。

---

### STEP 2: バックナンバー一覧を取得
`/Users/akihiro.miki/Documents/ai_news/` 内の `YYYY_MM_DD.html` 形式のファイルを全て `ls` で確認し、日付と既存ファイルのサイドバー内容（`<!-- ISSUES_LIST_START -->` 〜 `<!-- ISSUES_LIST_END -->` の部分）を読み取る。

---

### STEP 3: 新しい HTML を生成
- **ファイル名**: `/Users/akihiro.miki/Documents/ai_news/YYYY_MM_DD.html`（今日の日付）
- **テンプレート**: 既存の最新 HTML ファイルをベースにする（CSS・構造を継承）
- **ヘッダー**: `<title>AI ニュース — YYYY年M月D日号</title>`
- **記事本文**: 10本の記事をカード形式で記載。各カードに必ず「エンジニア的注目点」を追加する

#### サイドバーの記述ルール
`<!-- ISSUES_LIST_START -->` と `<!-- ISSUES_LIST_END -->` の間に、**新しい順**で全号をリスト：

```html
<!-- ISSUES_LIST_START -->
<a href="2026_05_19.html" class="issue-link active">
  <span class="issue-date">2026年5月19日</span>
  <span class="issue-label">（その号の代表キーワード2〜3個）</span>
</a>
<a href="2026_05_12.html" class="issue-link">
  <span class="issue-date">2026年5月12日</span>
  <span class="issue-label">GPT-5.5 / dreaming / iOS 27</span>
</a>
<!-- ISSUES_LIST_END -->
```

- **今週号**: `class="issue-link active"`
- **過去号**: `class="issue-link"`

---

### STEP 4: 既存 HTML を全て更新
全ての既存 HTML ファイル（今週号以外）について、`<!-- ISSUES_LIST_START -->` 〜 `<!-- ISSUES_LIST_END -->` の部分を新しいリストに差し替える。今週号の `active` クラスを外し（`class="issue-link"`）、その号自身が `active` になるよう修正すること。

---

## スタイル・品質基準
- 応答は日本語
- 各記事: タイトル・日付・タグ・本文・エンジニア的注目点・ソースリンク
- タグ分類: `tag-model`（新モデル）/ `tag-agent`（エージェント）/ `tag-eng`（開発者向け）/ `tag-security`（セキュリティ）/ `tag-creative`（クリエイティブ）
- ソースへのリンクは `target="_blank"` を付ける
