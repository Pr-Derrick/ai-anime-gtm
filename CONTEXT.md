# CONTEXT.md — AI Short Film Project
# Master Context: Workshop Infrastructure + Content Strategy

> One-line summary: Solo creator building an AI short film system for WeChat Video (视频号),
> Hongguo, YouTube, and X — using Claude Code for production and Runner for operations.

---

## Who I Am

- Name: Derrick / 司徒Burger
- Location: Canada (Toronto)
- Background: AI PM builder, 3 startups, Clearco / Agora experience
- WeChat Video account: 司徒Burger｜AI行动实验室 (~1035 followers)
- Goal: Build an AI short film production system that outputs 3 episodes/week solo

---

## The Core Insight (Do Not Forget This)

> The problem is not missing AI tools.
> The problem is missing a stable content model, account positioning, and consistent publishing rhythm.

Do not build complex automation before the content model is proven.
First: 3 published episodes. Then: automation.

---

## Account Positioning

**Primary account identity:**
司徒Burger｜AI行动实验室

**One-line positioning:**
用 AI 短片讲决策、行动和普通人的翻盘。

**Bio (use one of these):**
```
用 AI 短片讲决策、行动和普通人的翻盘。
不卖焦虑，只编译下一步。
加拿大｜AI PM Builder
```

**What this account is NOT:**
- Not a generic AI news channel
- Not a pure tool tutorial channel
- Not a dropshipping/affiliate channel (yet)
- Not trying to copy other creators' templates wholesale

---

## The Two Content Tracks

### Track 1: WeChat Video / 视频号 (Personal Brand)
**Format:** 20–45 second vertical short films
**Language:** Chinese
**Style:** Cold, real, slightly ironic — never motivational-poster energy
**Core theme:** AI × Decision-making × Ordinary person action system

Content columns:
| Column | Format | Example |
|---|---|---|
| AI决策寓言 | 30s story short film | "他花了3个月优化计划，却从没发出一条私信。" |
| 普通人行动系统 | Voiceover / text video | "焦虑时不要做人生规划，先做10分钟任务。" |
| AI工具变现实验 | Screen recording / workflow | "我如何用GPT + 剪映做一条AI短片。" |

### Track 2: Hongguo / YouTube / X (AI Anime Drama)
**Format:** 60–90s vertical (Hongguo) / 3–5min horizontal (YouTube)
**Language:** Mandarin for Hongguo · English for YouTube
**Style:** Fast-paced, emotionally heightened, binge-worthy
**Core theme:** AI anime short drama — apocalypse / cultivation / reincarnation genres

---

## Production Pipeline

### For WeChat Video / 视频号 (Short Film Track)

```
0. Topic selection + viral hook judgment
↓
1. GPT: Generate 30-second script draft
↓
2. Claude: Script doctor — logic, emotion, hook check
↓
3. Storyboard / shot breakdown
↓
4. Canva / AI video tools: Generate visual assets
↓
5. ElevenLabs: Generate voiceover
↓
6. CapCut / 剪映: Final edit + subtitles
↓
7. Canva: Thumbnail + title
↓
8. Publish
↓
9. Data review: completion rate / saves / comments / follows
↓
10. Feed back into topic library
```

### For AI Anime Drama (Hongguo / YouTube Track)
See README.md for the full 10-step pipeline.

---

## Tool Roles (No Overlap)

| Tool | Role |
|---|---|
| Claude | Story structure, script doctor, logic review, episode outlines |
| GPT | First draft scripts, storyboards, image prompts, production breakdown |
| ElevenLab | Voiceover only — after script approved |
| Seedance 2.0 | Video generation (anime track), character consistency |
| Canva | Thumbnails, character cards, visual templates |
| CapCut / 剪映 | Final edit, subtitles, BGM, transitions |
| Make / n8n | Automation glue — connects tools after V1 is proven |
| Runner | Operations layer — daily briefing, data collection, weekly report |

**Automation boundary:**
| Automate now | Keep human |
|---|---|
| Script generation from topic | Which script version to use |
| Storyboard breakdown | Final aesthetic judgment |
| Image prompts | Editing rhythm and emotion |
| Title and thumbnail candidates | Whether to publish |
| ElevenLab voiceover | Comment response decisions |
| Google Drive folder creation | Account positioning changes |

---

## The Hook Rules (Non-Negotiable for Both Tracks)

1. **0–3 seconds:** Conflict, humiliation, danger, secret, or identity reversal. Immediately.
2. **Every 10 seconds:** A new reversal, power moment, or revelation.
3. **Final 5 seconds:** Cliffhanger or unanswered question.

No world-building in Episode 1. Start in the middle of the conflict.

**For WeChat Video specifically:**
- Hook formula: pain point → conflict → reversal → one-line gold ending
- First 7 topics: already written (see below)

---

## First 7 Topics (WeChat Video Track)

1. 你不是缺计划，你是在逃避行动。
2. AI 没有给我建议，它只问了我一个残酷问题。
3. 为什么聪明人更容易卡住？
4. 不要高效地写废代码。
5. 如果你今天只做一件事，做哪件？
6. 信息越多，决策越差。
7. 真正的自律不是狠，是降低启动成本。

**First episode script is ready.** See SCRIPT-EP1.md.

---

## Phased Plan

| Phase | Goal | Success Criteria |
|---|---|---|
| V0 Now | Publish first episode | 30s script + thumbnail done |
| V1 Week 1–2 | Publish 3 episodes | Know which content gets saves/comments |
| V2 Month 1 | 2–3 stable columns, 20 episodes | One content type clearly outperforms |
| V3 Later | Monetization, consulting, Alter AI conversion | Account has trust and traffic entry point |

**Rule: Do not build automation before V1 is proven.**

---

## What NOT to Do

- Do not build full RPA before first episode is published
- Do not start as a pure affiliate/dropshipping account
- Do not change positioning every day
- Do not copy group templates wholesale — adapt to your main line
- Do not chase cinematic quality early — black text on black background works fine
- Do not use Notion/spreadsheets as a substitute for publishing

---

## Reverse Constraints (from ChatGPT analysis)

The 流量赢行 VIP group is useful as a **topic and format reference library**.
Do not treat it as the main strategy. The group teaches traffic; use traffic to serve your main line:
AI action system + Alter AI + personal brand.

---

## Platform Notes

**WeChat Video 视频号:**
- Algorithm: Social recommendation + private domain amplification
- Best content: Series/sequel format (user watches Ep1, system auto-plays Ep2)
- Organic reach: Emotional resonance → friend shares → group spread
- KPI: Saves + comments > likes

**Hongguo / Douyin:**
- Algorithm: Pure performance — completion rate is everything
- 3-second death rule: no hook = no distribution
- KPI: Completion rate ≥ 30%

**YouTube:**
- Strategy: Bundle 50–100 short episodes into 1–7 hour compilations
- Add [MULTI SUB] for Latin America + Southeast Asia
- KPI: Average Watch Time (AVD)
- Note: Anime-style content exempt from AI labeling requirements
