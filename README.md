# Loire Valley Wedding Week Planner

A self-contained, single-file web app for planning a week-long wedding event. Built for our trip to the Loire Valley, June 9–15, 2026.

## Features

- **Week-at-a-glance calendar** with color-coded time-block events
- **Smart meal suggestions** — opening the editor on a morning slot pre-loads breakfast items, lunch at midday, etc.
- **Per-event headcount** with auto-scaling food quantities (set 80 people, every quantity recalculates)
- **Costco Paris food library** (~55 items) with estimated EUR pricing — beverages, bakery, dairy, meat & deli, produce, snacks, pantry, supplies
- **Aggregated shopping list** that sums every item across every event, rounds up to package counts, and shows a running total
- **Inline price overrides** and checkboxes for shopping in person
- **PNG and PDF export** for printing the calendar or shopping list
- **localStorage persistence** — your data stays in your browser

## Usage

Just open the live site. Click any empty time slot to create an event, or click an existing event to edit/delete it.

## Local development

Open `index.html` in any modern browser. There's no build step — everything is one HTML file with embedded CSS and JS.

> Note: localStorage doesn't work when opening via a `data:` URL (some preview tools do this). Serving the file over `http://` or `https://` — including from disk via `python3 -m http.server` — works fine.
