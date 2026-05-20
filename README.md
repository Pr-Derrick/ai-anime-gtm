## How to Use This Repo

1. Open this repo in Claude Code
2. Claude reads CLAUDE.md and CONTEXT.md automatically
3. Start with scratchpad.md — answer the five questions
4. Follow README.md step by step
5. First episode script is ready in SCRIPT-EP1.md — publish before building automation# AI Anime Drama — Build Guide

This is your step-by-step guide for the workshop and beyond.
Open this file in Claude Code. Follow the checkpoints in order.

-----

## Before You Build Anything

Run this five-question check. Write your answers in `scratchpad.md`.

1. What decision should this workflow improve?
1. What input data do I trust enough to use?
1. What output would I actually use next week?
1. What failure mode would make this embarrassing or expensive?
1. What tiny sample would prove the workflow is worth scaling?

If you can’t answer all five, stop and write the answers first.

-----

## The 10-Step Pipeline

### PHASE 1 — LOCK BEFORE BUILDING (Steps 0–2)

These three steps are serial. Do not skip forward. Every shortcut here causes full retakes later.

-----

### Step 0 — Genre & Competitive Research

**Tool:** Doubao / research data
**Time:** 15 minutes
**Input:** Nothing
**Output:** One confirmed genre + 3 comparable titles

Pick one genre. Commit to it.

Recommended for solo creators in 2026:

- **Apocalypse + Female Lead** — proven on Hongguo, empty space on YouTube
- **Reincarnation + AI + Ordinary Person** — narrative hook built in

Do not start production until genre is locked in `scratchpad.md`.

**Checkpoint 0:** Genre written in scratchpad? → Proceed to Step 1.

-----

### Step 1 — Story Bible

**Tool:** Claude
**Time:** 20 minutes
**Input:** Genre + 1 sentence premise
**Output:** World (3 sentences), Protagonist (30 words), Antagonist/Conflict, 10-episode arc

```
Prompt for Claude:
I'm building an AI anime short drama. Genre: [genre].
Premise: [one sentence].

Please write:
1. World description (3 sentences max)
2. Protagonist: name, appearance in 10 words, core trait, power/system
3. Main conflict for the first 10 episodes
4. Episode arc: what changes from Episode 1 to Episode 10?

Keep it short. I need to build this, not read it.
```

**Checkpoint 1:** Can you say the premise in one sentence? → Proceed to Step 2.

-----

### Step 2 — Character Bible + Reference Images

**Tool:** Seedance 2.0 / 即梦 (Jimeng)
**Time:** 30 minutes
**Input:** Character brief from Step 1
**Output:** 8 locked reference images per main character

This is the most important step. Do not skip it.
Every episode that skips character locking requires full retakes.

Fill in the Character Pack template (copy to `data/raw/characters/[name].md`):

```
Name:
Age:
Face shape:
Hair color and style:
Eye color and shape:
Main outfit:
Signature item or accessory:
Personality in 3 words:
DO NOT CHANGE (hard rules):
```

Generate 8 reference images using Seedance/Jimeng:

- Front face (neutral expression)
- Side profile
- Half-body shot
- Full body shot
- Smiling
- Angry or intense
- Surprised
- Signature outfit with prop

Save all 8 images to `data/raw/characters/[name]/`.

**Checkpoint 2:** 8 reference images saved and locked? → Proceed to Step 3.

-----

### PHASE 2 — EPISODE PRODUCTION (Steps 3–7)

Steps 4–7 can run in parallel once Step 3 is approved.

-----

### Step 3 — Episode Outline (First 10 Episodes)

**Tool:** Claude
**Time:** 20 minutes
**Input:** Story Bible from Step 1
**Output:** 10-episode outline with hook and cliffhanger for each

```
Prompt for Claude:
Using this Story Bible: [paste Step 1 output]

Write a 10-episode outline. For each episode provide:
- Episode number and title
- Opening hook (what happens in the first 3 seconds)
- Core conflict for this episode
- Power moment (the main reversal or revelation)
- Cliffhanger (what the audience doesn't know at the end)

Format as a table. Keep each cell under 20 words.
```

**Checkpoint 3:** Does every episode have a hook AND a cliffhanger? → Proceed to Step 4.

-----

### Step 4 — Single Episode Script + Storyboard

**Tool:** GPT
**Time:** 15 minutes per episode
**Input:** Episode outline row from Step 3
**Output:** 200-word script + 8-shot storyboard

```
Prompt for GPT:
Episode [N] outline: [paste the outline row]
Character reference: [describe protagonist from character pack]

Generate:
1. A 200-word voiceover script (English)
   Rules:
   - Hook in first 3 seconds: conflict, humiliation, danger, or identity reversal
   - One power moment every 10 seconds
   - Final 5 seconds: unanswered question or threat
   - Every line under 15 words
   - No world-building, start in the action

2. An 8-shot storyboard table with columns:
   Shot# | Shot Type | Action | Character Expression | Camera Move | Duration

3. 8 image generation prompts for Seedance 2.0
   Each prompt must include:
   - "Use Character Reference A"
   - Forbidden changes (face shape, hair color, outfit color)
   - Shot description, lighting, atmosphere
```

**Checkpoint 4 (PLAN MODE):** Read script out loud. Does it follow hook rules? → Proceed to Steps 5, 6, 7 in parallel.

-----

### Step 5 — Video Generation (Parallel)

**Tool:** Seedance 2.0
**Time:** 60 minutes per episode
**Input:** 8 image prompts from Step 4 + Character Reference images
**Output:** 8–15 video clips (5–10 seconds each)

Always use the **Full Reference Mode** in Seedance.
Always attach character reference images.
Generate in batches of 5 clips.
Delete and regenerate any clip where the character face has drifted.

Save all raw clips to `data/enriched/episode-[N]/clips/`.

-----

### Step 6 — Voiceover Generation (Parallel)

**Tool:** ElevenLab
**Time:** 15 minutes per episode
**Input:** Script from Step 4
**Output:** One `.mp3` voiceover file

Only run this step after Checkpoint 4 is passed.
ElevenLab costs quota. Do not run on unapproved scripts.

Voice settings:

- Style: [YOUR CHOICE — e.g. “dramatic female, slight echo, emotional pauses”]
- Speed: slightly slower than natural speech (overseas audience needs processing time)
- Add breathing and micro-pauses before power moments

Save voiceover to `data/enriched/episode-[N]/voiceover.mp3`.

**Checkpoint 6:** Does voiceover feel emotional, not robotic? → Proceed to Step 7.

-----

### Step 7 — Final Edit

**Tool:** CapCut / 剪映
**Time:** 30 minutes per episode
**Input:** Clips from Step 5 + Voiceover from Step 6
**Output:** Final edited video

Assembly checklist:

- [ ] Sync voiceover to visuals (offset ≤ 0.5 seconds)
- [ ] Add subtitles (large font, high contrast, subtitle every line)
- [ ] Add BGM (genre-appropriate, low enough to not compete with voiceover)
- [ ] Add 2–3 sound effects at power moments
- [ ] Add transitions (0.3 seconds max, flash or ink wash style)
- [ ] Final runtime: 60–90 seconds (Hongguo) or 3–5 min (YouTube)

**Checkpoint 7:** Full playback. Does it feel like a real episode, not a demo? → Proceed to Step 8.

-----

### PHASE 3 — PUBLISH & MEASURE (Steps 8–9)

-----

### Step 8 — Thumbnail + Title A/B Test (Parallel with Step 7)

**Tool:** Canva + GPT
**Time:** 20 minutes per episode
**Input:** Best frame from video + episode title
**Output:** 2 thumbnail versions (A and B) + 3 title options

```
Prompt for GPT:
Episode [N] is about: [one sentence summary]
Genre: [genre]
Platform: Hongguo / YouTube

Generate:
1. 3 title options for Hongguo (Chinese, suspense-hook style, ≤15 characters)
2. 3 title options for YouTube (English, curiosity-gap style, add [MULTI SUB])
3. 2 thumbnail concepts: describe the image, text overlay, and color mood for each
```

Save thumbnails to `data/enriched/episode-[N]/thumbnails/`.

-----

### Step 9 — Publish + Data Collection

**Time:** 10 minutes to publish, 72 hours to collect

Publishing checklist:

- [ ] Upload to Hongguo first (primary platform)
- [ ] Add tags: #AIAnime #AIAnimes #[genre] #[series name]
- [ ] Set 24-hour and 72-hour data collection reminders
- [ ] Upload to YouTube (horizontal version + [MULTI SUB] in title)
- [ ] Post clip to X with caption

Log the publish in your database:

```sql
INSERT INTO publishes (episode_id, platform, publish_date, thumbnail_ver, title_used)
VALUES ([id], 'hongguo', '[date]', 'A', '[title]');
```

**72-Hour Review:**
Collect completion rate, click rate, views, and saves.
Log to `metrics_72h` table.

**Go / No-Go Rule:**

- Completion rate ≥ 30% AND no production errors → scale to Episodes 2–3
- Completion rate < 30% → diagnose before producing more

-----

## When to Use Plan Mode

Use Plan Mode for:

- Your first prompt in every session
- Any step that costs money or quota (ElevenLab, Seedance at scale)
- Checkpoint 4 (before video generation)
- Whenever sample output looks wrong

Switch out of Plan Mode only when approving one small, concrete next step.

-----

## Files in This Project

```
ai-anime-workshop/
├── README.md               ← You are here
├── CLAUDE.md               ← Durable rules (read every session)
├── scratchpad.md           ← Your thinking, context, research
├── TODO.md                 ← Current state and next action
├── schema.sql              ← Database structure
├── .skills/
│   ├── write-narrative.md  ← Repeatable script-writing instructions
│   ├── storyboard.md       ← Repeatable storyboard instructions
│   └── weekly-report.md    ← Repeatable reporting instructions
└── data/
    ├── raw/
    │   ├── characters/     ← Character packs and reference images
    │   └── themes/         ← Story briefs and world-building notes
    ├── enriched/
    │   └── episode-N/      ← Scripts, clips, voiceover per episode
    └── computed/
        ├── videos/         ← Final edited episodes
        └── metrics.db      ← SQLite database (schema.sql)
```

-----

## First Session Checklist

Open this repo in Claude Code. Then:

- [ ] Read CLAUDE.md
- [ ] Open scratchpad.md and answer the five questions
- [ ] Write your Sad Story and Happy Story
- [ ] Put your data file or theme notes in `data/raw/`
- [ ] Complete Step 0 (genre decision)
- [ ] Complete Step 1 (Story Bible)
- [ ] Complete Step 2 (Character reference images)

That’s enough for the workshop. Then you’re building, not planning.
