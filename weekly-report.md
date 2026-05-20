# Skill: Weekly Performance Report

Use this skill every Monday to review last week’s episodes and plan this week.

-----

## Input Required

Pull from the database:

```sql
SELECT e.title_en, e.genre, p.platform, p.publish_date,
       m.views, m.completion_rate, m.click_rate, m.saves, m.revenue_estimate
FROM episodes e
JOIN publishes p ON e.id = p.episode_id
JOIN metrics_72h m ON p.id = m.publish_id
WHERE p.publish_date >= date('now', '-7 days')
ORDER BY m.completion_rate DESC;
```

-----

## Report Structure

### 1. Numbers First (3 sentences max)

- Total views across all platforms last week
- Best completion rate and which episode/platform achieved it
- Estimated revenue

### 2. What Worked (2–3 bullets)

Specific episodes, genres, or platform behaviors that exceeded baseline.

### 3. What Didn’t Work (2–3 bullets)

Episodes that underperformed. Identify the likely cause (hook? thumbnail? platform? genre?).

### 4. One Key Insight

The single most actionable thing the data tells you.
Example: “YouTube completion rate is 40% higher on episodes with English voiceover vs auto-subtitles.”

### 5. Next Week Decision

Based on the insight — what will you do differently?

- Genre to prioritize
- Platform to double down on
- Production change to test

-----

## Output Format

Plain text. No more than one page.
This is for you to read in 5 minutes and make a decision.
Not a document to share. Not a presentation. Just a decision tool.