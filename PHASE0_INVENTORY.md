# Phase 0 — Inventory & Prep — Completion Report

**Date:** 2026-09-17
**Branch:** `phase-0/scaffolding`
**Build:** `bundle exec bridgetown build` clean (Bridgetown 2.2.2, <0.1s)

## 0.1 Audit current build output

### Stale build check (AUDIT §2.11)
- **Previous claim:** `build/` (Middleman) was May 2024 and diverged from source.
- **Current status:** Repo now uses Bridgetown with `output/` as destination. `output/` timestamp 2026-09-17T10:06:51-04:00 matches last build — **not stale**. `build/` directory does not exist (`.gitignore` ignores `build` + `output`). Confirm with `stat`: `src/index.erb` 2026-09-14, `output/index.html` 2026-09-17 (fresh after build). No divergence.

### Current URLs in `output/` (after scaffold)
Pre-scaffold: `/`, `/first-teams/`, `/sitemap.xml`, `/robots.txt`, `/site.webmanifest`
Post-scaffold (+18 new): `/features/`, `/features/members/`, `/features/events/`, `/features/finance/`, `/features/communication/`, `/features/automation/`, `/use-cases/first-robotics/`, `/use-cases/nonprofits/`, `/use-cases/churches/`, `/use-cases/youth-clubs/`, `/use-cases/sports-leagues/`, `/open-source/`, `/hosting/`, `/about/`, `/faq/`, `/roadmap/`, `/contact/`, `/updates/`, `/llms.txt`, `/404.html`

- Sitemap: `output/sitemap.xml` now 22 URLs (was 2) — plugin auto-enumerates all pages, uses `https://gatherpack.com` from `config/initializers.rb:18`.
- Note: `404` and `llms.txt` currently in sitemap — will be excluded in Phase 5.4 with front-matter `sitemap: false` or plugin filter.
- Orphan check: `src/first-teams.erb` no longer orphaned in nav? Still linked only via scaffold; will be 301 → `/use-cases/first-robotics` in Phase 3.2.

### Front-matter / title audit
- `src/index.erb:1-5` has `title` + `description` (only page with description before scaffold).
- `src/first-teams.erb:1-3` has **no** `title`/`description` — Bridgetown **infers** `title: "First Teams"` from filename (`first-teams.erb` → humanized). Confirmed via `site.collections['pages'].resources` debug: `/first-teams/ => title="First Teams"`. Layout fallback `data.title ? data.title : "GatherPack"` not hit because inferred title exists. **AUDIT §2.10 claim partially inaccurate for Bridgetown** — not bare `GatherPack`, but still generic / not keyword-optimized.
- Scaffold pages now all have explicit `title` (≤60ch) + `description` (120–155ch) per Phase 1.1 contract.

### Metadata audit (src/_layouts/default.erb:20-35)
- Emits: `<title>`, `og:title`, `og:site_name`, `og:url`, `og:image` (logo.png 287×287, undersized), `og:type`, `twitter:card=summary`, `twitter:site`, `canonical`, `description` (conditional), `twitter:description`.
- Missing (to fix Phase 1.1): `og:description`, `og:locale`, `og:image:width/height/alt`, `twitter:title`, `twitter:image`, `twitter:image:alt`, `og:image 1200×630`, `twitter:card summary_large_image`, `article:published_time`, `meta robots`.

### Sitemap audit
- Before scaffold: `src/sitemap.xml.erb` referenced in AUDIT no longer exists — replaced by `bridgetown-sitemap` plugin (Gemfile `bridgetown-sitemap ~>3.0`, `config/initializers.rb:21 init :"bridgetown-sitemap"`).
- Now auto-generated with correct `loc=https://gatherpack.com/...` (not localhost in dev after Ursula fix) and `lastmod=File.mtime` (brittle — will fix Phase 5.4 to use front-matter `modified_time`/Git).

### Manifest audit (src/site.webmanifest:1)
- Still empty: `{"name":"","short_name":"", ... "theme_color":"#ffffff"}` — fix Phase 1.6.

## 0.2 Catalog reusable copy / assets

### Copy reuse map
| Source | Lines | → Target IA | Notes |
|---|---|---|---|
| feature blocks | `src/index.erb:41-240` 5 pillars, 5×h3 + 13×h4 | `/features/*` hub + pillars + deep dives | Keep card pattern 1.4, split Coming Soon |
| persona list | `src/index.erb:242-254` 4 `<li>` | `/use-cases/*` 5 pages | Youth, nonprofits, churches, any group → + sports-leagues |
| story prose | `src/index.erb:257-269` 2×p | `/about` timeline | Preserve sticky notes, decade, Brad Thompson, students |
| self-host sentence | `src/index.erb:281-284` 1 para | `/open-source` + `/hosting` table | MIT per LICENSE.txt |
| hosting blurb | `src/first-teams.erb:150-158` hero | same | FIRST at-cost language, sledgehammer |
| Coming Soon badges | `src/index.erb:178,188,221,230` | `/roadmap` entries | Messaging, Notifications, Actions, Hooks |
| first-teams deep dive | `src/first-teams.erb:13-148` org/comm/events/time/finance | `/features/*` + `/use-cases/first-robotics` | Org charts, kiosk, Stripe etc. |
| calendar TODO | `src/index.erb:97` | roadmap Last column | Google Calendar integration |
| Zeffy/PayPal/Venmo, bank-pull | `src/first-teams.erb:140-141` | roadmap | |

### Image inventory (src/images/)
| File | Size | Dimensions | Status |
|---|---|---|---|
| `ss-calendar.png` | 48K | 827×827 | **unused** on index (AUDIT 2.22) — seed for /features/events |
| `ss-directory.png` | 52K | 826×826 | **unused** — seed for /features/members |
| `fb-cover.png` | 225K | 820×312 | **unused** — candidate og:image but wrong aspect (need 1200×630) |
| `x-cover.png` | 500K | 1500×500 | **unused** — too wide, crop to 1200×630 |
| `logo-cover.svg` | 11K | SVG | **unused** — cover variant |
| `logo.svg` | 7.8K | SVG | **used** hero + og fallback |
| `logo.png` | 15K | 287×287 | **used** as `og:image:24` — undersized for 1200×630 |
| `logo-word.svg/.png` | 8.9K /30K | — | unused |
| `westsideRoboticsMark.png` | 19K | 299×298 | **used** src/index.erb:33 — keep |
| `5924.webp` | 8.8K | 763×601 | **used** src/index.erb:36 |
| `45-degree-fabric-dark.png` | 80K | 315×315 | **used** body background `frontend/styles/index.scss:71` — compress |

All with missing `width`/`height` + `loading="lazy"` + no WebP/srcset — fix Phase 6.1.

## 0.3 Owner inputs & placeholders

| Item | Status | Placeholder |
|---|---|---|
| Proof-strip numbers | placeholder | “10 years predecessor (2014) + 1+ year GatherPack, 2 orgs live + ~6 evaluating” — conservative phrasing per AUDIT §5 Q1 |
| License | confirmed | MIT `LICENSE.txt:1` — cite on /open-source + JSON-LD `license: https://github.com/GatherPack/gatherpack/blob/main/LICENSE` |
| Hosting prices | placeholder | `$50/mo Standard`, `$100/mo Custom + plugins`, FIRST discount not shown (AUDIT §5b) |
| Use-case priority | confirmed | all 5 in v1: first-robotics, nonprofits, churches, youth-clubs, sports-leagues |
| Testimonials | placeholder | Westside/Golden Gate quotes TBD — leave `Review` JSON-LD placeholders |
| Screenshots | placeholder | seed with `ss-*.png`, owner will provide fresh captures (AUDIT §5 Q2) |
| GitHub canonical | fix needed | normalize to `https://github.com/GatherPack/gatherpack` (AUDIT §5b Q) — currently `_social:14` uses `github.com/gatherpack` (lowercase) vs `_beta_cta:10` uses `github.com/GatherPack` (no repo suffix) |

## 0.4 Scaffolding created

```
src/features.erb                    hub (links to 5 pillars)
src/features/members.erb            pillar
src/features/events.erb             pillar
src/features/finance.erb            pillar
src/features/communication.erb      pillar
src/features/automation.erb         pillar
src/use-cases/first-robotics.erb    merges first-teams (301 TBD Phase 3.2)
src/use-cases/nonprofits.erb
src/use-cases/churches.erb
src/use-cases/youth-clubs.erb
src/use-cases/sports-leagues.erb
src/open-source.erb                 canonical (/self-hosting → redirect TBD)
src/hosting.erb                     canonical (/pricing → redirect TBD)
src/about.erb                       timeline placeholder
src/faq.erb                         8–12 pairs placeholder
src/roadmap.erb                     living list placeholder
src/contact.erb                     crawlable fallback placeholder
src/updates.erb                     hub + src/updates/ dir
src/404.erb                         permalink: /404.html, branded
src/llms.txt.erb                    permalink: /llms.txt, layout: none
src/_partials/_json_ld.erb          Organization placeholder
src/_partials/_nav.erb              nav placeholder
src/_partials/_footer.erb           footer clusters placeholder
src/_partials/_breadcrumbs.erb      breadcrumbs placeholder
```

- All scaffold pages have `title`/`description`/`layout: default` + `<h1>` per Phase 1.1 contract (no duplicate titles).
- Build: `bundle exec bridgetown build` clean, 22 URLs in `sitemap.xml` (was 2), `output/llms.txt` reachable.

## Next: Phase 1 Foundations
- 1.1 metadata contract + layout enforcement
- 1.2 JSON-LD partial
- 1.5 nav/footer/breadcrumbs
- 1.6 manifest hygiene
