# CLAUDE.md — AI Anime Drama Project

This file contains durable instructions and decisions for this project.
Read this at the start of every session. Do not override these rules without explicit approval.

-----

## Project Goal

Produce AI anime short drama content for three platforms:

- **Hongguo / Douyin** (primary, Chinese market)
- **YouTube** (secondary, international market)
- **X / Twitter** (clip distribution and audience building)

Target: From theme input to published video draft in under 2 hours per episode.

-----

## You Are the Builder. I Am the Judge.

- Do not make creative decisions without asking first.
- Do not generate voiceover or video assets until the Story has been reviewed and saved.
- Do not run expensive steps (ElevenLab, VideoScribe) without explicit approval.
- When in doubt, stop and ask. Do not guess.

-----

## Tool Roles — No Overlap

|Tool            |Role                                                             |Do NOT use for                 |
|----------------|-----------------------------------------------------------------|-------------------------------|
|**Claude**      |Story structure, character arcs, plot density, episode outlines  |Storyboards, image prompts     |
|**GPT**         |Storyboards, shot lists, image prompts, production task breakdown|Long-form narrative            |
|**ElevenLab**   |Voiceover only — after script is locked                          |Anything before script approval|
|**Seedance 2.0**|Video generation, character consistency                          |Final editing                  |
|**Canva**       |Thumbnails, character cards, visual templates                    |Video production               |
|**CapCut / 剪映** |Final edit, subtitles, BGM, transitions                          |Story or script work           |

**VideoScribe is removed from the main pipeline.** It is a whiteboard animation tool, not suitable for anime drama.

-----

## Content Specifications

- **Episode length:** 60–90 seconds (Hongguo vertical) / 3–5 minutes (YouTube horizontal)
- **Aspect ratio:** 9:16 for Hongguo/Douyin · 16:9 for YouTube
- **Narrative length:** 200–300 words (English) per episode
- **Voiceover language:** English for YouTube · Mandarin for Hongguo
- **Style:** [FILL IN — e.g. post-apocalyptic / cultivation / palace drama / cyberpunk]
- **Tone:** Fast-paced, emotionally heightened, binge-worthy

-----

## The Hook Rules (Non-Negotiable)

Every episode must follow this structure:

1. **0–3 seconds:** Conflict, humiliation, danger, secret, or identity reversal — one of these, immediately.
1. **Every 10 seconds:** A new power moment, reversal, or revelation.
1. **Final 5 seconds:** Cliffhanger or unanswered question that pulls to the next episode.

No world-building in Episode 1. Start in the middle of the conflict.

-----

## Character Consistency Rules

Before generating any video, every main character must have a **Character Pack**:

```
Name:
Age:
Face shape:
Hair:
Eyes:
Outfit:
Signature item:
Personality keywords:
DO NOT CHANGE:
```

Each character needs **8 reference images** locked before production begins:

1. Front face
1. Side profile
1. Half-body
1. Full body
1. Smiling
1. Angry
1. Surprised
1. Signature outfit + prop

**When generating video:** Always reference the character image pack.
Never describe a character in text alone. Always attach the reference image.

Bad prompt: “A cool female lead walks into the ruins.”
Good prompt: “Using Character Reference A. Same face, same black hair, same white robe, same jade pendant. Shot: medium, female lead steps through collapsed gate, slow push-in, cold light, tense atmosphere. Forbidden: change face shape, change hair color, add accessories not in reference.”

-----

## Data Layers

|Layer       |Contents                                               |Location        |
|------------|-------------------------------------------------------|----------------|
|**Raw**     |Story theme, character brief, reference images         |`data/raw/`     |
|**Enriched**|Narrative script, voiceover file, storyboard, shot list|`data/enriched/`|
|**Computed**|Final video, platform drafts, performance metrics      |`data/computed/`|

Never mix layers. Never overwrite raw data.

-----

## Platform Output Rules

|Platform|Format                 |Title Style                    |Cadence        |
|--------|-----------------------|-------------------------------|---------------|
|Hongguo |9:16 vertical          |Suspense-hook Chinese title    |1 episode/day  |
|YouTube |16:9 horizontal        |English + keyword + [MULTI SUB]|3 episodes/week|
|X       |Square or vertical clip|Short punchy line + hashtags   |1 clip/day     |

**YouTube long-form strategy:** Bundle 50–100 episodes into 1–7 hour “Full Season” compilations. This maximizes Watch Time and algorithm reach in Latin America and Southeast Asia.

-----

## Plan Mode Rules

Use Plan Mode BEFORE:

- First prompt of every new episode
- Any schema change
- Before running ElevenLab (voiceover generation costs quota)
- Before running Seedance at full scale
- When sample output looks wrong
- First episode of a new character or new genre

Switch out of Plan Mode only after approving a small, concrete change.

-----

## Mandatory Review Checkpoints

|Step                       |Checkpoint                                         |Who approves|
|---------------------------|---------------------------------------------------|------------|
|After Step 6 (Story Saved) |Read narrative out loud. Does it follow hook rules?|Me          |
|After Step 9 (Sequence)    |Watch storyboard sequence. Is character consistent?|Me          |
|After Step 10 (Video draft)|Full playback before publishing                    |Me          |

**No checkpoint = no next step.**

-----

## Security Rules

- Never paste API keys into any Markdown file or chat message.
- Store all API keys as environment variables.
- Never commit `.env` files.
- Remove any real personal data before using sample files.
- Do not use copyrighted characters, real celebrity likenesses, or platform-restricted content.

-----

## Failure Modes — What Would Make Output Embarrassing or Unusable

1. Character face changes between episodes (audience drops immediately)
1. Voiceover sounds robotic with no emotional pauses (completion rate collapses)
1. First 3 seconds have no conflict (algorithm won’t distribute)
1. Episode ends without a cliffhanger (no next-episode pull)
1. Content flagged for copyright or policy violation (taken down)
1. Audio and video out of sync by more than 0.5 seconds

-----

## Current Style Reference

**Genre:** [FILL IN]
**Comparable titles:** [FILL IN — e.g. “similar energy to 斩仙台 but female-led” or “post-apocalyptic LitRPG for YouTube”]
**Visual keywords:** [FILL IN — e.g. “dark fantasy, cool tones, dramatic lighting, anime eyes”]
**Forbidden visuals:** [FILL IN — e.g. “no gore, no real-world landmarks, no celebrity likenesses”]