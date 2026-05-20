-- AI Anime Drama Project — Database Schema
-- Template C: Reporting & Insights
-- Store all episode data, platform metrics, and weekly summaries here

-- ============================================================
-- EPISODES
-- Master record for every produced episode
-- ============================================================
CREATE TABLE IF NOT EXISTS episodes (
  id                INTEGER PRIMARY KEY AUTOINCREMENT,
  episode_number    INTEGER NOT NULL,
  series_name       TEXT,
  title_cn          TEXT,
  title_en          TEXT,
  genre             TEXT,    -- apocalypse / cultivation / palace / reincarnation / other
  sub_genre         TEXT,    -- female-lead / system-flow / rules-horror / etc.
  narrative_words   INTEGER,
  production_cost   REAL,    -- in CNY
  production_hours  REAL,
  character_consistent INTEGER DEFAULT 0,  -- 1 = yes, 0 = no
  notes             TEXT,
  created_at        DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- PUBLISHES
-- One row per episode per platform
-- ============================================================
CREATE TABLE IF NOT EXISTS publishes (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  episode_id     INTEGER REFERENCES episodes(id),
  platform       TEXT NOT NULL,  -- hongguo / douyin / youtube / x
  format         TEXT,           -- vertical-9:16 / horizontal-16:9 / square / long-compilation
  publish_date   DATE,
  publish_time   TIME,
  thumbnail_ver  TEXT,           -- A / B (for A/B testing)
  title_used     TEXT,
  tags           TEXT,
  status         TEXT DEFAULT 'published',  -- published / taken-down / draft
  url            TEXT
);

-- ============================================================
-- METRICS_24H
-- Performance data collected 24 hours after publish
-- ============================================================
CREATE TABLE IF NOT EXISTS metrics_24h (
  id               INTEGER PRIMARY KEY AUTOINCREMENT,
  publish_id       INTEGER REFERENCES publishes(id),
  views            INTEGER,
  completion_rate  REAL,   -- % of viewers who watched to end (target: ≥30%)
  click_rate       REAL,   -- CTR from impression to play
  saves            INTEGER,
  shares           INTEGER,
  comments         INTEGER,
  new_followers    INTEGER,
  heat_score       INTEGER,  -- Hongguo/Douyin heat index
  collected_at     DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- METRICS_72H
-- Performance data collected 72 hours after publish
-- Used for go/no-go decision on scaling
-- ============================================================
CREATE TABLE IF NOT EXISTS metrics_72h (
  id               INTEGER PRIMARY KEY AUTOINCREMENT,
  publish_id       INTEGER REFERENCES publishes(id),
  views            INTEGER,
  completion_rate  REAL,
  click_rate       REAL,
  saves            INTEGER,
  shares           INTEGER,
  revenue_estimate REAL,    -- estimated revenue share in CNY
  pass_threshold   INTEGER, -- 1 = completion ≥30% and no errors, 0 = fail
  collected_at     DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- CHARACTERS
-- Character pack registry
-- ============================================================
CREATE TABLE IF NOT EXISTS characters (
  id                 INTEGER PRIMARY KEY AUTOINCREMENT,
  name               TEXT NOT NULL,
  series_name        TEXT,
  description        TEXT,
  face_shape         TEXT,
  hair               TEXT,
  eyes               TEXT,
  outfit             TEXT,
  signature_item     TEXT,
  personality_keywords TEXT,
  do_not_change      TEXT,  -- hard rules for visual consistency
  reference_images   TEXT,  -- comma-separated file paths
  locked             INTEGER DEFAULT 0,  -- 1 = locked, do not modify
  created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- WEEKLY_SUMMARY
-- Human-readable weekly report
-- ============================================================
CREATE TABLE IF NOT EXISTS weekly_summary (
  id                   INTEGER PRIMARY KEY AUTOINCREMENT,
  week_start           DATE,
  week_end             DATE,
  episodes_produced    INTEGER,
  total_views          INTEGER,
  best_platform        TEXT,
  best_genre           TEXT,
  best_episode_id      INTEGER REFERENCES episodes(id),
  avg_completion_rate  REAL,
  total_revenue_est    REAL,
  total_cost           REAL,
  roi_ratio            REAL,  -- revenue / cost
  key_insight          TEXT,  -- what did the data tell you this week?
  next_week_action     TEXT,  -- what will you do differently?
  created_at           DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- PRODUCTION_LOG
-- Track each session's progress through the 10-step pipeline
-- ============================================================
CREATE TABLE IF NOT EXISTS production_log (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  episode_id   INTEGER REFERENCES episodes(id),
  step_number  INTEGER,
  step_name    TEXT,
  -- Steps: 0-Genre, 1-StoryBible, 2-CharacterBible, 3-Outline,
  --        4-Script+Storyboard, 5-VideoGen, 6-Voiceover,
  --        7-Edit, 8-Thumbnail, 9-Publish
  tool_used    TEXT,
  status       TEXT,  -- pending / in-progress / approved / skipped
  approved_by  TEXT DEFAULT 'me',
  notes        TEXT,
  duration_min INTEGER,
  logged_at    DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- SAMPLE DATA — Episode 1 template
-- ============================================================
INSERT INTO episodes (episode_number, series_name, title_en, genre, sub_genre)
VALUES (1, '[YOUR SERIES NAME]', '[Episode 1 Title]', 'apocalypse', 'female-lead');
