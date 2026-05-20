# Runner Integration — AI Anime Production Workflow

# Optimization Map + Questions for Justin/Charlie

-----

## What Runner Actually Does (From Docs)

Runner connects Gmail, Calendar, Slack, Notion, Drive, Sheets, Linear, HubSpot,
browser automation, and custom MCP servers.

Core capabilities relevant to this project:

- **Workflows:** Multi-step tasks that chain actions across connected apps
- **Automations:** Scheduled recurring workflows (e.g. “every morning at 8am”)
- **Heartbeat (Beta):** Background monitoring — nudges you when something needs attention
- **Memory:** Tell it your preferences once, it applies them every time
- **Browser automation:** When there’s no API, Runner opens the browser and does it
- **Concurrent tasks:** Runs multiple things in parallel

-----

## Where Runner Fits in the 10-Step Pipeline

Runner is NOT a video production tool.
Runner is the OPERATIONS LAYER around the production pipeline.

```
PRODUCTION PIPELINE (Claude Code handles)          RUNNER HANDLES
─────────────────────────────────────────          ─────────────────────────────
Step 0  Genre research                    ←→       Pull trending data from Sheets
Step 1  Story Bible (Claude)
Step 2  Character lock (Seedance)
Step 3  Episode outline (Claude)
Step 4  Script + storyboard (GPT)         ←→       Auto-save outputs to Drive
Step 5  Video generation (Seedance)
Step 6  Voiceover (ElevenLab)
Step 7  Edit (CapCut)
Step 8  Thumbnail + title (Canva)         ←→       A/B title test tracker in Sheets
Step 9  Publish + measure                 ←→       ★ THIS IS WHERE RUNNER SHINES ★
```

-----

## The 5 Concrete Ways to Use Runner

-----

### 1. DAILY CONTENT BRIEFING (Automation — runs every morning)

Set this automation once. It runs every morning before you start producing.

**Runner prompt to save as automation:**

```
Every morning at 8:30am, give me my AI anime production briefing:

1. Check my Hongguo/Douyin performance spreadsheet in Google Sheets.
   Tell me: which episode had the highest completion rate in the last 7 days?
   Which had the lowest? What's the trend?

2. Check my YouTube Studio data (if connected).
   Tell me: top performing episode this week by Watch Time.

3. Check my Gmail for any platform notifications, copyright flags,
   or policy emails from Hongguo, Douyin, or YouTube.

4. Tell me: what should I produce today based on this data?
   One decision. One sentence.
```

**What this replaces:** 30–45 minutes of manually checking three platforms every morning.

-----

### 2. POST-PUBLISH DATA COLLECTION (Workflow — triggered after each publish)

After you publish an episode, trigger this workflow:

**Runner prompt:**

```
Episode [N] was just published on [platform].

In 24 hours:
1. Check my performance spreadsheet in Google Sheets.
   Log: views, completion rate, click rate, saves for this episode.
2. Compare to my last 5 episodes on the same platform.
   Flag if completion rate dropped below 30%.
3. If completion rate < 30%, send me a Gmail draft with the diagnosis:
   - Was the hook too slow?
   - Did the thumbnail underperform vs average CTR?
   - Did the cliffhanger hold?
4. Update the weekly_summary tab in Sheets.
```

**What this replaces:** Manual data collection and interpretation after every episode.

-----

### 3. WEEKLY PERFORMANCE REPORT (Automation — every Monday 9am)

**Runner prompt to save as automation:**

```
Every Monday at 9am, generate my weekly AI anime report:

1. Pull last week's episode data from Google Sheets (views, completion rate, revenue_est).
2. Rank episodes by completion rate across all platforms.
3. Identify: best genre this week, best platform, best posting time.
4. Draft a 1-page summary in Google Docs titled "Week of [date] — AI Anime Report".
5. Send me a Gmail with the link to the doc and the one key insight I should act on.

Keep it under 300 words. I need to read it in 5 minutes and make one decision.
```

**What this replaces:** 2–3 hours of manual reporting every Monday.

-----

### 4. PLATFORM TREND MONITORING — HEARTBEAT (Background, always on)

Use Runner’s **Heartbeat** feature to monitor without asking.

**Tell Runner:**

```
Watch these things in the background and notify me immediately if any happen:

1. Any email from Hongguo, Douyin, YouTube, or X about my account,
   content policy, copyright, or monetization status.

2. Any email with subject containing "AI anime", "AI漫剧", "漫剧",
   "short drama", or "platform policy".

3. If my Hongguo performance spreadsheet shows a single episode
   dropping below 20% completion rate (flag = urgent).

4. If I haven't published for more than 3 days
   (nudge = "You haven't posted in 3 days. What's blocking you?").
```

**What this replaces:** Constant manual platform-checking anxiety.

-----

### 5. WORKSPACE SETUP — SEPARATE AI ANIME PROJECT

Use Runner’s **Workspaces** to keep the AI anime project isolated.

**Recommended workspace structure:**

|Workspace   |Connected Apps                                                                   |Purpose                           |
|------------|---------------------------------------------------------------------------------|----------------------------------|
|**AI Anime**|Gmail (project), Google Sheets (metrics), Google Drive (assets), Notion (scripts)|All production + distribution work|
|**Personal**|Personal Gmail, Calendar                                                         |Everything else                   |

**Why this matters:**
Runner’s memory and automations are workspace-scoped.
Your morning anime briefing won’t mix with personal emails.
Your performance data stays isolated from other projects.

-----

## Workflow Runner CAN’T Do (Be Honest with Charlie)

Runner does NOT currently integrate with:

- Seedance 2.0 / Jimeng (ByteDance tool, no public API)
- ElevenLab (would need custom MCP)
- CapCut / 剪映 (no API)
- Hongguo/Douyin analytics backend (no public API)
- YouTube Studio API (would need OAuth connection)

This means Runner can handle the **operations layer** (email, docs, scheduling, reporting)
but cannot directly trigger the **production tools**.

The honest summary:
**Runner = your chief of staff for the business of content creation.**
**Claude Code = your production system for the content itself.**

-----

## Questions for Justin / Charlie

These are ordered from most to least important for your use case.

-----

### Core Capability Questions

**Q1 (Most important):**
“My production pipeline outputs files to Google Drive after each episode —
scripts, voiceover files, storyboards, final video.
Can Runner watch a Drive folder and automatically trigger a workflow
when a new file appears? Or does it only work on demand?”

**Q2:**
“I track all my episode performance in a Google Sheet.
Can Runner read that sheet, compare rows, and tell me which genre
is performing best — without me asking every time?
Is there a Heartbeat rule I can set up for threshold alerts?”

**Q3:**
“I publish to Hongguo (Chinese platform) and YouTube.
Neither has a direct Runner integration.
What’s the best workaround — browser automation?
Can Runner log into Hongguo via browser and pull my stats?”

**Q4:**
“ElevenLab and Seedance 2.0 don’t have Runner connectors.
Can I connect them via custom MCP server?
How hard is that to set up for a non-engineer?”

-----

### Workflow + Automation Questions

**Q5:**
“I want a ‘post-publish checklist’ that runs automatically
every time I upload a new episode.
Can I trigger a Runner automation from a Google Drive upload event,
or does it only run on a time schedule?”

**Q6:**
“Runner’s docs mention it remembers preferences across sessions.
If I tell it ‘my target completion rate threshold is 30%’,
will it apply that context to every future performance report
without me repeating it?”

**Q7:**
“I’m a solo creator right now.
If I eventually add a co-producer or editor,
can they share the same Runner workspace and automations?
How does multi-user collaboration work?”

-----

### Product Direction Questions (For the Founder)

**Q8:**
“Runner’s current use cases are all email/calendar/Slack.
Are you seeing any creators or media teams use it for
content production operations? Or is that a new use case for you?”

**Q9:**
“I’m running a dual-market strategy — Chinese platforms and YouTube.
That means two different tool stacks, two languages, two analytics systems.
Is Runner designed to handle that kind of fragmented setup,
or is it optimized for single-ecosystem users?”

**Q10 (The best last question):**
“I have a CLAUDE.md file that defines all the rules for my AI anime project —
character consistency rules, platform specs, hook structure.
Claude Code reads it every session.
Is there a way to feed that context file into Runner’s memory
so it understands my project the same way Claude Code does?
Could Runner and Claude Code share persistent context?”

-----

## Runner Setup Instructions (Do This Today)

1. Download Runner from runner.now
1. Create a new Workspace named “AI Anime”
1. Connect: Gmail + Google Sheets + Google Drive + Google Docs
1. Set up Automation #1: Daily Content Briefing (8:30am)
1. Tell Runner your preferences once:
   
   ```
   Remember these for all future tasks in this workspace:
   - I produce AI anime short dramas
   - Target platforms: Hongguo (Chinese), YouTube (English), X
   - Success metric: episode completion rate ≥ 30%
   - Genre focus: apocalypse + female lead
   - I'm a solo creator — keep recommendations executable by one person
   - Production cadence: 3 episodes per week target
   ```
1. Run: “Give me my morning briefing for my AI anime project.”