# GatherPack Marketing Site — Phased Implementation Plan

**Source audit:** `AUDIT.md` (Sep 2026)
**Site stack:** Bridgetown (Ruby) — `src/index.erb`, `src/_layouts/default.erb:1-65`, `src/_partials/*`
**Note on paths:** Audit references `source/**/*.html.erb` (Middleman). This repo uses `src/**/*.erb` (Bridgetown). Map `source/` → `src/`, `source/layouts/layout.erb` → `src/_layouts/default.erb`, `source/_*.erb` → `src/_partials/_*.erb`. All file refs below use the *actual* `src/` paths.

---

## 0. How to use this plan

- Phases are **sequential**; tasks within a phase can be parallelized where noted.
- Each task lists `Audit §`, `Backlog #`, `Effort/Impact`, files touched, and done-criteria.
- Cross-cutting constraint: **What NOT to change** (`AUDIT.md:§3`) — no emoji-as-icons / chip-list AI aesthetic, preserve human origin-story specifics, keep open-source/self-host as a loud pillar, use GatherPack's own warmer CTA voice.
- Owner inputs flagged with `◐ Needs owner` — don't block phase; use placeholders.
- Apply the humainzer skill liberally when working on actual site content
- Run `bin/bridgetown build` (or `bundle exec bridgetown build`) and validate after each phase. See Phase 6 validators.

### Sequencing summary (from `AUDIT.md:4b` suggestion)

```
Phase 0  Inventory & scaffolding
  ↓
Phase 1  Foundations — metadata contract + layout + design system + nav skeleton (11,12,13,25)
  ↓
Phase 2  Homepage narrative rebuild — proof, story, roadmap, pillars (1-6, 2.9, 2.14, 2.2, 2.4)
  ↓
Phase 3  Core IA expansion — /features/* + /use-cases/* + /open-source + /hosting (15,16,17,18,23)
  ↓
Phase 4  Trust & depth — /about + /faq + /contact + /roadmap + /updates (14,19,20, 2.7)
  ↓
Phase 5  GEO/crawl affordances — JSON-LD per-page, llms.txt, robots, sitemap, 404, breadcrumbs (21,22, 2.12,2.22)
  ↓
Phase 6  Polish & launch QA — media hygiene, performance, a11y, CTAs, content depth audit (7,8,10,24,25 + §7 checklist)
```

### Target IA (from `AUDIT.md:§6a` — ~16 indexable pages)

```
/                          homepage (rebuilt)
/features                  hub
/features/members
/features/events
/features/finance
/features/communication
/features/automation
/use-cases/first-robotics  (301 from /first-teams)
/use-cases/nonprofits
/use-cases/churches
/use-cases/youth-clubs
/use-cases/sports-leagues
/open-source               (alias /self-hosting → canonical)
/hosting                   (alias /pricing → canonical; $50 std / $100 custom per §5b)
/about                     timeline
/faq
/roadmap
/contact                   crawlable fallback for Tally modal
/updates  + /updates/:post (seed 2 posts) + feed.xml
/llms.txt  (/llms-full.txt optional)
/404.html
sitemap.xml, robots.txt, site.webmanifest (fixed)
```

---

## Phase 0 — Inventory & Prep (Effort: Low | Unblocks everything)

**Goal:** Baseline the repo before touching content. Do not skip.

- [x] **0.1 Audit current build output** — *done 2026-09-17 on `phase-0/scaffolding`*
  - `Audit §2.10,2.11` | Ran `bundle exec bridgetown build` — output fresh 2026-09-17T10:06, **not stale** (Middleman `build/` → Bridgetown `output/`; `build/` does not exist, `.gitignore` covers both). `stat` src 2026-09-14 vs output 2026-09-17 confirms no divergence.
  - Recorded URLs pre-scaffold: `/`, `/first-teams`, `/sitemap.xml`, `/robots.txt`, `/site.webmanifest`; post-scaffold 22 URLs in `output/sitemap.xml` (see 0.4). `src/first-teams.erb:1-3` has no front-matter title (orphaned per `AUDIT.md:2.10`) but Bridgetown **infers** `title: "First Teams"` from filename (verified via `site.collections['pages'].resources` — `/first-teams/ => title="First Teams"`), so fallback `GatherPack:35` is not hit, still generic/not keyword-optimized. Metadata audit recorded (missing `og:description`, `og:locale`, `og:image:width/height/alt`, `twitter:image` etc.). See `PHASE0_INVENTORY.md` §0.1.

- [x] **0.2 Catalog reusable copy/assets** — *done — see `PHASE0_INVENTORY.md` §0.2*
  - Mapped reuse per `AUDIT.md:§6` content reuse table:
    - `src/index.erb:41-240` feature blocks → `/features/*` pillars + hub cards
    - `src/index.erb:242-254` persona list → `/use-cases/*`
    - `src/index.erb:256-269` story prose → `/about` timeline
    - `src/index.erb:281-284` self-host sentence + `src/first-teams.erb:150-158` hosting blurb → `/open-source` + `/hosting` comparison table
    - Feature `Coming Soon` badges in `src/index.erb:178,188,221,230` → `/roadmap` entries
  - Inventoried images: `src/images/ss-calendar.png` (827×827, 48K, unused), `ss-directory.png` (826×826, 52K, unused), `fb-cover.png` (820×312, 225K, unused), `x-cover.png` (1500×500, 500K, unused), `logo-cover.svg` (11K, unused), `logo.svg`/`logo.png` (used; logo.png 287×287 undersized), `westsideRoboticsMark.png` (299×298, used), `5924.webp` (763×601, used), `45-degree-fabric-dark.png` (315×315, 80K background).

- [x] **0.3 Confirm owner inputs & placeholders** — *done — placeholders recorded `PHASE0_INVENTORY.md` §0.3*
  - `◐ Needs owner` Collect/placeholder:
    - Proof-strip numbers: per `AUDIT.md:§5` — "10 years predecessor + 1+ year GatherPack, 2 orgs + ~6 evaluating" — no hard member count yet (phone-home `TODO`). Use conservative phrasing until numbers solid.
    - License: MIT (`AUDIT.md:§5b`, `LICENSE.txt:1`) — cite on `/open-source` + JSON-LD.
    - Hosting prices: `$50/mo standard`, `$100/mo custom + plugins`, FIRST discount not shown (`AUDIT.md:§5b`).
    - Use-case priority: all 5 (`first-robotics`, `nonprofits`, `churches`, `youth-clubs`, `sports-leagues`) in v1 (`AUDIT.md:§5b`).
    - Testimonials: placeholders for Westside / Golden Gate (`AUDIT.md:§5b` Q).
    - Screenshots: owner will provide per `AUDIT.md:§5` Q2 — seed with existing `ss-*.png`, swap later.
    - GitHub canonical: `https://github.com/GatherPack/gatherpack` (`AUDIT.md:§5b` Q), normalize `src/_partials/_social.erb:14` (`github.com/gatherpack`) vs `src/_partials/_beta_cta.erb:10` (`github.com/GatherPack` — missing `/gatherpack` suffix).

- [x] **0.4 Create branch & scaffolding** — *done — branch `phase-0/scaffolding`, `bundle exec bridgetown build` clean*
  - Created `src/features/`, `src/use-cases/`, `src/updates/` dirs, `src/_partials/_json_ld.erb`, `src/_partials/_nav.erb`, `src/_partials/_footer.erb`, `src/_partials/_breadcrumbs.erb`, `src/404.erb` (permalink `/404.html`), `src/llms.txt.erb` (permalink `/llms.txt`, `layout: none`), placeholders: `src/features.erb`, `src/features/members|events|finance|communication|automation.erb`, `src/use-cases/first-robotics|nonprofits|churches|youth-clubs|sports-leagues.erb`, `src/open-source.erb`, `src/hosting.erb`, `src/about.erb`, `src/faq.erb`, `src/roadmap.erb`, `src/contact.erb`, `src/updates.erb`. No content yet — all have `title`/`description`/`layout: default` + `<h1>` per contract. Build clean (22 URLs in sitemap, was 2).

---

## Phase 1 — Foundations: Metadata, Layout, Design System, Nav Skeleton

**Goal:** Fix the cheapest high-impact SEO/GEO levers first (`AUDIT.md:4b` — 11+12+13 foundation). Everything after depends on this.

- [x] **1.1 Per-page front-matter contract + layout enforcement** `§2.11` `Backlog #11` `Low/High` — *done 2026-09-17*
  - Files: `src/_layouts/default.erb:20-35`, every `src/**/*.erb`
  - Current: `src/_layouts/default.erb:21-35` emits one title/description, `og:image` defaults to `logo.png:24`, no `og:description`, `og:locale`, `twitter:image`, article times, or `width/height/alt`. `src/index.erb:2-4` is only page with title/description; `src/first-teams.erb:1-3` falls back to bare `GatherPack:35`.
  - Do:
    - Define contract: every page declares `title` (≤60ch, keyword front-loaded), `description` (120–155ch), optional `graph_image`, `published_time`/`modified_time`.
    - Update `src/_layouts/default.erb:20-35` to emit: `<title>`, `meta description`, `og:title`, `og:description` (=description), `og:url` (`absolute_url resource.relative_url:23`), `og:image` (1200×630 cover; `width`/`height`/`alt`), `og:locale`, `og:site_name`, `twitter:card` (`summary_large_image` when cover present), `twitter:title`, `twitter:description`, `twitter:image`, `twitter:image:alt`, `canonical:27`, `meta robots` where needed. No duplicate titles.
    - Fix heading hygiene later but reserve `h1` per page (see 1.4).
  - Done when: `bin/bridgetown build` output has unique title/description/og/twitter/canonical per page; validator shows no duplicates.

- [x] **1.2 Site-wide JSON-LD partial** `§2.12` `Backlog #12` `Low/High` — *done 2026-09-17*
  - Files: new `src/_partials/_json_ld.erb`, include in `src/_layouts/default.erb:1-64` `<head>`
  - Add:
    - Site-wide `Organization` (name GatherPack, url `https://gatherpack.com`, logo `src/images/logo.svg`, founding date, `sameAs` from `src/_partials/_social.erb:1-19`, `contactPoint`).
    - Site-wide `SoftwareApplication` (name, `applicationCategory: BusinessApplication`, `operatingSystem: Web`, `offers` free/MIT self-host + paid hosted via Sledgehammer, `featureList` from feature pages, `screenshot` array seeded with `ss-calendar.png`/`ss-directory.png`).
    - Per-page `BreadcrumbList` (all sub-pages), plus page-type schemas (see Phase 5 for per-page extensions).
  - Validate: Google Rich Results Test + `validator.schema.org`.
  - Done when: every page emits valid JSON-LD; no `schema.org` grep misses.

- [x] **1.3 Definition / TL;DR block for entity extraction** `§2.14` `Backlog #13` `Low/High` — *done 2026-09-17*
  - Files: `src/index.erb:7-22`
  - Current hero (`src/index.erb:7-21`) is warm but not extractable (no 1-sentence "GatherPack is ...").
  - Do: Add visually distinct definition callout directly under `h1`:
    > "GatherPack is free, open-source group management software for teams, clubs, churches and nonprofits — manage members, events, finances and communications in one place. Self-host free or use affordable managed hosting via Sledgehammer Infosystems."
  - Reuse verbatim in `meta description` (`src/index.erb:3`), `og:description`, `SoftwareApplication.description` (1.2), and `llms.txt` (Phase 5). Must survive unchanged on homepage, About, and llms.txt.
  - Rather than duplicating this content in all of these places, define it somewhere that can be referenced anywhere when needed.
  - Done when: definition is crawlable plain HTML (not JS), styled as `.card-hero` variant/aside.

- [x] **1.4 Establish consistent card/section design system** `§2.6` `Backlog #4` `Medium/High` — *done 2026-09-17*
  - Files: `src/index.erb:41-240`, `frontend/styles/*` (or `src/_components` if present), `esbuild.config.js`
  - Current: `AUDIT.md:2.6` — no consistent rhythm; feature sections vary without pattern; owner says "semi-slapped-together."
  - Do:
    - Define single card pattern: `icon or screenshot + heading + 1–2 sentence desc` and apply uniformly to Tools & Features (and later hub pages).
    - Keep artisanal/community warmth per `AUDIT.md:§3` — **do not** adopt competitor's emoji-icon/chip-list (`X · Y · Z`) aesthetic.
    - Pattern must support both homepage cards and deep-dive pages (see Phase 3).
  - Done when: style guide snippet or Storybook/README shows pattern; homepage feature blocks refactored to use it.

- [x] **1.5 Site-wide nav + footer topic clusters** `§2.10` `Backlog #23` `Medium/High` — *done 2026-09-17*
  - Files: `src/_layouts/default.erb:52-63`, new `src/_partials/_nav.erb`, `src/_partials/_footer.erb`, `src/_partials/_breadcrumbs.erb`
  - Current: no site nav; `src/first-teams.erb` orphaned (no nav/footer/internal link) per `AUDIT.md:2.10`; footer is single line `src/_layouts/default.erb:57-60`.
  - Do:
    - Top nav: `Features ▾ | Use Cases ▾ | Open Source | Hosting | About | FAQ | Roadmap | Contact` + primary CTA `Get Started / Schedule a Demo` (persistent). Use `<nav>` landmark (`AUDIT.md:§7`).
    - Footer clusters mirroring IA + social/GitHub/Discord (`src/_partials/_social.erb:1-19`) + "Self-host free or get managed hosting →" callout.
    - Visible breadcrumbs on every sub-page (`Home > Features > Events`) + `BreadcrumbList` JSON-LD.
    - Ensure every new page has ≥1 inbound from nav/footer and ≥1 from body (no orphans; audit via sitemap vs crawl).
  - Done when: `first-teams` orphan resolved (redirect or merge, see Phase 3); nav/footer render on all pages.

- [x] **1.6 Manifest & PWA hygiene** `§2.11,2.22` `Backlog #25` `Low/Low-Med` — *done 2026-09-17*
  - Files: `src/site.webmanifest:1`, `src/_layouts/default.erb:44-47`
  - Current: `src/site.webmanifest:1` has empty `name`/`short_name`; `theme_color` is `#ffffff` mismatched to SCSS.
  - Do: Fill `name: "GatherPack"`, `short_name: "GatherPack"`, `description` (= site description), `theme_color`/`background_color` from SCSS (e.g. `#6d6753`/`#403a22`), keep `icons`/`display: standalone`. Sync `theme-color` meta with manifest. Add `preconnect`/`dns-prefetch` for `plausible.io`/`kit.fontawesome.com` if retained (`src/_layouts/default.erb:48-49`), ensure Google Fonts `display=swap`.
  - Done when: Lighthouse PWA/manifest valid; no empty fields.

---

## Phase 2 — Homepage Narrative Rebuild (Full Redesign)

**Goal:** Close the craft gap — restructure from flat stack to persuasive arc, surface proof, fix roadmap framing, add visual proof. Interleaves `Backlog #1-7` with foundations from Phase 1.

- [x] **2.1 Restructure page narrative order** `§2.1` `Backlog #5` `Medium/High`
  - File: `src/index.erb:1-293`
  - Current flat stack: hero → logos → features → community blurb → footer (`AUDIT.md:2.1`).
  - New order: hero (proof-forward + definition from 1.3) → the problem (scattered spreadsheets/sticky notes, keep existing copy `src/index.erb:13-14`) → proof of production use (see 2.2) → feature tour (consistent cards from 1.4) → openness/self-host pillar (see 2.3) → roadmap (reframed, see 2.4) → CTA (see 2.7).
  - Preserve specific human details in story; don't genericize.

- [x] **2.2 Proof strip near top** `§2.2` `Backlog #1` `Low/High`
  - Files: `src/index.erb:26-40` (current "Trusted by" card at `src/index.erb:26-40`)
  - Current: logos exist but buried; "over the past decade" prose-only (`src/index.erb:264`).
  - Do: Add proof strip in first viewport — e.g. "In production since 2014 (predecessor) / GatherPack since 2024 · Trusted by Westside Robotics & Golden Gate Robotics · 2 orgs live + 6 evaluating" (use conservative numbers until `◐ Needs owner` phone-home data). Pull logos up higher (first viewport or immediately below hero). Add `width`/`height` + `alt` (`AUDIT.md:2.22`).
  - Done when: proof visible without scrolling on desktop; logos link out (`src/index.erb:33,36`).

- [x] **2.3 Elevate open-source / self-host to top-level pillar** `§2.5` `Backlog #3` `Low-Med/High`
  - Files: `src/index.erb:272-286` (currently buried single sentence `src/index.erb:283-284`)
  - Do: Promote to own section/callout on homepage (not a sentence) — near pricing/CTA. Summarize choice: Self-host Free (MIT, `LICENSE.txt`) vs Managed Hosted via Sledgehammer (`$50`/`$100` per §5b). Link to `/open-source` + `/hosting` (Phase 3). Differentiate loudly vs SaaS-only competitor.
  - Done when: self-host decision is findable within 2 scrolls of CTA.

- [x] **2.4 Reframe "in development" as roadmap section** `§2.4` `Backlog #2` `Low-Med/High`
  - Files: `src/index.erb:178,188,221,230` badges + footnote `AUDIT.md:2.4`
  - Current: trailing `*` + small-print footnote — reads as apology.
  - Do: Split into distinct visual sections: "Available now" vs "On the roadmap" (confident, intentional). Move "Messaging, Notifications, Actions, Hooks" badges into roadmap treatment; don't hide gaps, frame as active development. Reuse same split on `/features/*` deep dives and `/roadmap` (Phase 4).
  - Done when: no asterisk footnote; roadmap styling consistent with 1.4 card pattern.

- [x] **2.5 Convert origin story to visual timeline** `§2.9` `Backlog #6` `Medium/Medium`
  - Files: `src/index.erb:257-269` (dense 3-paragraph prose)
  - Do: Break into 3–4 step timeline: the problem → the first fix → outgrowing it → GatherPack today. Preserve human specifics (sticky notes, spreadsheets, volunteer dev `src/index.erb:263`, students rebuilding). Link to `/about` (Phase 4) for extended version. Keep warm copy, improve scaffolding.
  - Done when: timeline renders with dates/steps; prose not genericized.

- [x] **2.6 Add product screenshots per feature** `§2.3` `Backlog #7` `Medium/Med-High`
  - Files: `src/index.erb:41-240`, `src/images/ss-calendar.png`, `ss-directory.png`
  - Current: zero visual preview; screenshots exist but unused (`AUDIT.md:2.22`).
  - Do: At minimum, add real screenshots per feature section (use `ss-calendar.png`/`ss-directory.png` as seeds; `◐ Needs owner` fresh captures per §5 Q2). Stretch: lightweight guided preview / short screen-capture walkthrough (does not need full sandboxed demo). Ensure `width`/`height` + `loading="lazy"` below fold + `alt`.
  - Done when: each feature pillar has ≥1 screenshot/diagram.

- [x] **2.7 Lightweight pricing-philosophy blurb** `§2.8` `Backlog #10` `Low/Low` (optional, low priority)
  - Files: `src/index.erb` (new section near CTA)
  - Current: no pricing anywhere (`AUDIT.md:2.8`); competitor also opaque.
  - Do: Short blurb (not full price table if not ready): "Free self-host (MIT) / Affordable hosted tiers via Sledgehammer — standard $50/mo, custom $100/mo + plugins; FIRST teams discounted — contact for current tiers." Link to `/hosting`. Reinforces transparency vs opaque SaaS.
  - Done when: pricing intent query has a citable homepage anchor + dedicated page (Phase 3).

- [x] **2.8 Heading & semantic hygiene on homepage** `§2.11` `Backlog #11` (cont.)
  - Files: `src/index.erb:7,27,43` etc., `src/_layouts/default.erb`
  - Do: Exactly one `h1` per page (homepage `h1` is definition, not just `.logoline:7`). Feature grid keeps `h2` per feature group, then `h3`/`h4` without skipped levels. Every section has `id` for anchor linking. Wrap in `<main>`, add `<article>` where appropriate, no JS-only content (see Phase 4 for Tally fallback).
  - Done when: heading outline passes validator; no single `h2` wrapping 5 unrelated features (`src/index.erb:43` old pattern).

---

## Phase 3 — Core IA Expansion: Features, Use Cases, Pillars

**Goal:** Expand from ~2 URLs to hub-and-spoke (`AUDIT.md:§6`). Each page owns a keyword cluster (`AUDIT.md:§6b`). Content depth checklist enforced per `AUDIT.md:§6c`.

> **Content depth per new page (ship gate):** unique `title`/`description`/`og:*`/`canonical` + single `h1` matching primary intent · 300–600 words (tight, card pattern) · 1 screenshot/diagram · 1 proof element (logo/testimonial/stat) · 2–3 embedded FAQs (also on `/faq`) · CTA row (same 4 CTAs from `src/_partials/_beta_cta.erb:1-16`) · ≥2 outbound sibling links + ≥1 inbound from hub/homepage.

- [x] **3.1 Features hub + 5 pillar pages** `§2.16` `Backlog #15` `Medium/High`
  - New: `src/features.erb` (hub), `src/features/members.erb`, `src/features/events.erb`, `src/features/finance.erb`, `src/features/communication.erb`, `src/features/automation.erb`
  - Source: split `src/index.erb:41-240` + `src/first-teams.erb:13-148` details.
  - Hub: consistent card grid (1.4 pattern) linking to each pillar; each card has screenshot thumb.
  - Pillars:
    - `/features/members` — member mgmt, roster, badges, teams/managers/hierarchy (`src/index.erb:48-84`, `src/first-teams.erb:18-41`)
    - `/features/events` — RSVP/shifts/check-in, time tracking, calendar (`src/index.erb:90-119`, `src/first-teams.erb:68-93`); note Google Calendar integration `TODO` at `src/index.erb:97`
    - `/features/finance` — bookkeeping, receipts, payment processing via Stripe (`src/index.erb:124-152`, `src/first-teams.erb:119-148`); track Zeffy/PayPal/Venmo/bank-pull as roadmap items
    - `/features/communication` — announcements, email summaries, multi-channel messaging (`src/index.erb:157-195`, `src/first-teams.erb:43-66`)
    - `/features/automation` — reports, actions, hooks (`src/index.erb:200-238`)
  - Each: `h1` = "[Feature] for Teams & Clubs" (keyword-aware per `AUDIT.md:§6b`), 3–5 sub-feature blocks with icon/screenshot+heading+1–2 sentences, `Coming Soon` moved to roadmap split (see 2.4), FAQ pair, CTA.
  - Done when: hub links to pillars and vice versa; internal cross-links to relevant use-cases (e.g. Events → `/use-cases/first-robotics` check-in).

- [x] **3.2 Use-case landing pages** `§2.15` `Backlog #16` `Medium/High`
  - New: `src/use-cases/first-robotics.erb`, `src/use-cases/nonprofits.erb`, `src/use-cases/churches.erb`, `src/use-cases/youth-clubs.erb`, `src/use-cases/sports-leagues.erb`
  - Start with at least `first-robotics` + `nonprofits` as flagships; draft remaining 3 in v1 per `AUDIT.md:§5b`.
  - `first-robotics`: **merge + replace** `src/first-teams.erb:1-165` — add unique `title`/`description`/`h1` with primary term `FIRST robotics team management software` (`AUDIT.md:§6b`), definition block, 3–4 tailored feature callouts (calendar, time clock kiosk `src/first-teams.erb:100-118`, finances), Westside/Golden Gate logos, screenshot, FAQ, CTA. Add 301 redirect `first-teams` → `/use-cases/first-robotics` (Bridgetown `permalink` or Netlify `_redirects`; document in `config/*`).
  - Other use-cases: same template, keyword per `AUDIT.md:§6b` table (nonprofits `nonprofit membership management software`, churches `church management software`, youth-clubs `youth club management software`, sports-leagues `sports league management software`). Each tailored proof + feature tie-ins + cross-link to `/features/*`.
  - Wire from: homepage persona list `src/index.erb:242-254` becomes linked cards; nav `Use Cases ▾`.

- [x] **3.3 Open-source / self-hosting pillar** `§2.17` `Backlog #17` `Low-Med/High`
  - New: `src/open-source.erb` (canonical; alias `/self-hosting` → redirect)
  - Include: 1-sentence definition (MIT per `LICENSE.txt` — surface SPDX identifier), why self-host vs managed (control/privacy/cost), what self-hosting entails (tech requirements, quick-start link to `https://github.com/GatherPack/gatherpack`), comparison table Self-host Free vs Managed Hosted via Sledgehammer (price philosophy $50/$100, support, updates, payments integration), GitHub stats/callout, CTAs both ways. Normalize GitHub URL to `https://github.com/GatherPack/gatherpack` (`AUDIT.md:§5b`).
  - Keyword: `open source group management software` + `self-hosted club management` (`AUDIT.md:§6b`).
  - Add JSON-LD `SoftwareApplication.isAccessibleForFree: true` + `offers`.

- [x] **3.4 Hosting / pricing philosophy page** `§2.18` `Backlog #18` `Low/High`
  - New: `src/hosting.erb` (canonical; alias `/pricing` → redirect)
  - Include: philosophy copy, self-host vs managed table (shared with 3.3 or cross-linked), FIRST-teams discount callout (reuse Westside/Golden Gate proof; note discount not itemized per §5b), tiers `Standard $50/mo` / `Custom $100/mo + plugin dev`. Clear "Contact for current hosted tiers" CTA (links to `/contact` qualifying form). Even without hard numbers, still indexable for "GatherPack pricing/hosting cost" intent.
  - Add `Offer`/`AggregateOffer` JSON-LD once numbers final (can ship philosophy-only first).
  - Keyword: `GatherPack pricing / hosting cost` (`AUDIT.md:§6b`).

- [x] **3.5 Update homepage cross-links** `§2.10` (cont.)
  - After 3.1–3.4: homepage feature grid + persona list + open-source blurb + pricing blurb all link contextually to new pages. Verify no orphan pages (sitemap vs crawl).

---

## Phase 4 — Trust & Depth: FAQ, About, Contact, Roadmap, Updates

**Goal:** Capture GEO citation surface + E-E-A-T (`AUDIT.md:§2.13,2.19,2.21`) and fix lead capture (`§2.7`).

- [x] **4.1 Dedicated FAQ + embedded FAQs** `§2.13` `Backlog #14` `Low-Med/High` — *highest GEO yield per effort* — *done 2026-09-17*
  - New: `src/faq.erb`
  - 8–12 pairs grouped: General, Self-Hosting & Hosting, Features & Roadmap, Teams & Use Cases. Seed Qs:
    - Is GatherPack free? Can I self-host? How is GatherPack different from TeamConvene? Does it support dues/payments? Who is it for? (per `AUDIT.md:2.13`)
    - Include `first-robotics` vs TeamConvene comparison as FAQ entry or phase-2 `/vs/teamconvene` placeholder (`AUDIT.md:§6b`).
  - Keep answers 40–60 words, plain language, TL;DR + "Learn more →" link.
  - Embed 2–3 relevant FAQ pairs at bottom of each major page (features, use-cases, self-host, hosting). Markup with `FAQPage` JSON-LD + visible HTML (use `<details>` or plain headings; no JS-only reveal that blocks crawlers).
  - Validate: Rich Results Test for `FAQPage`.

- [x] **4.2 About page (timeline) + E-E-A-T hardening** `§2.21` `Backlog #19` `Low-Med/High` — *done 2026-09-17*
  - New: `src/about.erb`
  - Expand `src/index.erb:257-269` story into dated timeline (per §2.9 direction). Include: named author Brad Thompson (`https://brad-thompson.com` at `src/index.erb:262`), publisher `Sledgehammer Infosystems` (`src/_layouts/default.erb:12-14`), founding/production dates (predecessor ~2014, GatherPack ~2024), customer logos with outbound links (`src/index.erb:33,36`), optional `Review`/`Testimonial` JSON-LD placeholders (`◐ Needs owner` quotes), GitHub activity link.
  - Add `Person` + `Organization` JSON-LD site-wide (extend 1.2), `AboutPage` schema on `/about`, `<time datetime="">` for milestones.
  - Keyword: entity disambiguation for "what is GatherPack" — reuse definition block.

- [x] **4.3 Crawlable contact page + qualifying form** `§2.7,2.20` `Backlog #8` `Medium/Medium` — *done 2026-09-17*
  - New: `src/contact.erb`
  - Current: `src/_partials/_contact_modal.erb:1-12` is modal+iframe-only (Tally `https://tally.so/embed/wQAPeG`), invisible to crawlers (`AUDIT.md:2.20`).
  - Do: Retain modal UX but add `/contact` as crawlable fallback with same Tally form + plain HTML alternative for crawlers. Add light qualifying questions per `AUDIT.md:2.7`: org type, size, technical capacity/self-host interest (improves lead quality + signals process maturity vs competitor's structured beta form `AUDIT.md:2.7`). Ensure form works without JS.
  - Link from all CTAs + nav; GEO-citable "how to get started" target.

- [x] **4.4 Roadmap (living, dated) + changelog** `§2.19` `Backlog #20` `Medium/Med-High` — *done 2026-09-17*
  - New: `src/roadmap.erb` (and optionally `src/changelog.erb` or unified)
  - Living list: `Available now / Next / Later` reusing roadmap split from 2.4. Seed with "Coming Soon" items (Messaging, Notifications, Actions, Hooks, calendar integration `src/index.erb:97`, bank-pull, Zeffy/PayPal/Venmo, org charts `src/first-teams.erb:34`). Add dates + changelog entries; visible `last updated` stamps + `<time datetime="">` + `article:published_time`/`modified_time` for freshness signals. Gives crawlers weekly revisit reason + prospect confidence.
  - Ensure `sitemap.xml` emits accurate `lastmod` per Git/front-matter, not just `File.mtime` (see Phase 5).

- [x] **4.5 Blog / updates hub + RSS** `§2.19` `Backlog #20` (cont.) `Medium/Med-High` — *done 2026-09-17*
  - New: `src/updates.erb` (or `/blog`) + `src/updates/:post.erb` (Bridgetown blog/posts collection), `feed.xml` (RSS/Atom)
  - Seed 2 posts: "The GatherPack Story, Extended" + "Roadmap: What's Shipping Fall 2026" (`AUDIT.md:§6a`). Commit to ~1 post/month or roadmap update for freshness (`AUDIT.md:§5b`).
  - Add `BlogPosting` JSON-LD per post, `CollectionPage` for hub.

---

## Phase 5 — GEO/LLM Affordances & Crawl Hygiene

**Goal:** Make GatherPack citable by answer engines, not just rankable (`AUDIT.md:§2.20,2.12,2.22`).

- [x] Per-page JSON-LD extensions** `§2.12` `Backlog #12` (cont.) `Low/High`
  - Extend `src/_partials/_json_ld.erb` (1.2):
    - `BreadcrumbList` on all sub-pages
    - `FAQPage` on `/faq` + embedded FAQ JSON-LD on pages with FAQ pairs (pick one consistent pattern)
    - `AboutPage` on `/about`, `CollectionPage` on `/features`, `BlogPosting` on update posts
    - `Review`/`Testimonial` once quotes available (`◐ Needs owner`)
  - Validate all with Rich Results Test + `validator.schema.org` before launch.

- [x] llms.txt (+ optional llms-full.txt)** `§2.20` `Backlog #21` `Low/High (GEO)`
  - New: `src/llms.txt.erb` (copies to `output/llms.txt` as static text), optional `src/llms-full.txt.erb`
  - Content (concise, markdown, no HTML, ~1,500 tokens): definition paragraph (from 1.3), bullet feature list, self-host vs hosted distinction + comparison summary, audience list, links to all hub pages + `https://github.com/GatherPack/gatherpack` + Discord `https://discord.gg/r3fmNDVn3N` + contact, `last updated` date. Must be reachable at `/llms.txt` (and `/llms-full.txt` if added). Add comment pointer in `robots.txt`.
  - Do after hub pages exist so links are real.

- [x] robots.txt — explicit AI bot allows** `§2.20` `Backlog #22` `Low/Medium`
  - File: `src/robots.txt:1-4`
  - Current: generic `Allow: /` + `Sitemap` only.
  - Update to:
    ```
    User-agent: *
    Allow: /
    User-agent: GPTBot
    Allow: /
    User-agent: ClaudeBot
    Allow: /
    User-agent: PerplexityBot
    Allow: /
    User-agent: Google-Extended
    Allow: /
    # plus anthropic-ai, CCBot, etc.
    Sitemap: https://gatherpack.com/sitemap.xml
    # llms.txt: https://gatherpack.com/llms.txt
    ```
  - Done when: no AI crawler blocked; `robots.txt` tester passes.

- [x] sitemap.xml — accurate, complete** `§2.19,2.20` `Backlog #22` (cont.) `Low/Medium`
  - File: `src/sitemap.xml.erb` (or `src/sitemap.xml` — check Bridgetown sitemap plugin)
  - Current: enumerates only files matching `/html/i` — 2 docs, orphaned `first-teams` (`AUDIT.md:2.10`).
  - Do: Include all new URLs, use front-matter `modified_time` or Git log date for `lastmod` (not `File.mtime` which is deploy-brittle), add `<priority>`/`<changefreq>` (1.0 for `/`, 0.8 for hubs, 0.6 for leaves). Regenerate on each build.
  - Done when: sitemap valid XML, all pages present, `lastmod` sensible.

- [x] 404 + redirects + breadcrumbs** `§2.22` `Backlog #22` (cont.) `Low/Medium`
  - New: `src/404.erb` — branded, with nav/search/CTA, `noindex` (`AUDIT.md:§7`).
  - Redirects: `first-teams` → `/use-cases/first-robotics` (301), alias `/self-hosting` → `/open-source`, alias `/pricing` → `/hosting`. Use Bridgetown `permalink`/`_redirects` (Netlify) or `bridgetown` config; document.
  - Breadcrumbs: visible on sub-pages + `BreadcrumbList` JSON-LD (from 5.1).
  - Semantic landmarks: ensure `<main>`, `<nav>`, `<footer>` clusters, `<article>` for posts/roadmap entries, no content hidden behind JS-only modals (see 4.3 fallback).

---

## Phase 6 — Media, Performance & Launch QA

**Goal:** Image/Perf hygiene + final validators. Can run in parallel with Phases 3–5 once foundations land.

- [ ] **6.1 Media hygiene** `§2.22` `Backlog #24` `Low-Med/Medium` (Updated default layout for og:image)
  - Promote `src/images/fb-cover.png` / `x-cover.png` / `logo-cover.svg` to `og:image`/`twitter:image` candidates (1200×630). Current `og:image` is `logo.png:24` undersized.
  - Add explicit `width`/`height` + `loading="lazy"` below fold on all content images; convert screenshots to WebP with fallback + `srcset` responsive; compress `45-degree-fabric-dark.png` background; audit `alt` (descriptive for content, empty for decorative `fa-*` icons). Check `src/index.erb:6,31,35` existing `alt`.

- [ ] **6.2 Performance pass** `§2.22` (In Progress)
  - Audit `src/_layouts/default.erb:37-63` externals: `plausible.io:48`, FontAwesome kit `kit.fontawesome.com:49`, Google Fonts `fonts.googleapis.com:42`, Bootstrap CDN `cdn.jsdelivr.net:63`. Keep but add `preconnect`/`dns-prefetch`, ensure `font-display:swap` (Google Fonts API param). Consider image optimization pipeline (WebP/srcset), CSS/JS minify via `esbuild.config.js`.

- [ ] **6.3 Interactive / guided preview (stretch)** `§2.3` `Backlog #9` `High/Medium`
  - Only if time after 6.1–6.2: lightweight preview — short screen-capture walkthrough or click-around read-only demo (competitor's "Tour a live team" equivalent per `AUDIT.md:2.3`). Does not need full sandboxed demo to start. Defer to v2 if needed; screenshots (2.6) are MVP.

- [ ] **6.4 Structured beta-signup hardening (follow-up to 4.3)** `§2.7`
  - Verify qualifying questions (org type, size, self-host interest) flow into Tally/CRM correctly; test lead routing; signal process maturity.

- [ ] **6.5 Pre-launch validators** `AUDIT.md:§7` — **gate for launch**
  - [ ] `bin/bridgetown build` clean, no duplicate titles/descriptions
  - [ ] `htmlproofer` or `lychee` — no broken links; no orphan pages (sitemap vs crawl)
  - [ ] Lighthouse — Performance/SEO/A11y ≥90
  - [ ] Google Rich Results Test + `validator.schema.org` — all JSON-LD valid
  - [ ] `robots.txt` tester + `sitemap.xml` valid XML + `llms.txt` reachable at both `/llms.txt` and `/llms-full.txt` (if added)
  - [ ] Manual unfurl test — `og:image`/`twitter:card` render correctly (use 1200×630 covers)
  - [ ] Heading outline — one `h1` per page, no skipped levels, every section has `id`
  - [ ] `site.webmanifest` valid, `theme-color` synced
  - [ ] Analytics — Plausible (`src/_layouts/default.erb:48`) tagged events still firing
  - [ ] Search Console + Bing Webmaster Tools verification (DNS or meta) if not already

---

## Appendix A — Backlog → Phase mapping (all 25 items)

| Backlog # | Item | Audit § | Phase | Effort | Impact |
|---|---|---|---|---|---|
| 1 | Proof strip near top | 2.2 | 2.2 | Low | High |
| 2 | Roadmap reframe (asterisk → section) | 2.4 | 2.4 | Low–Med | High |
| 3 | Elevate open-source/self-host pillar | 2.5 | 2.3 | Low–Med | High |
| 4 | Consistent card/section design system | 2.6 | 1.4 | Medium | High |
| 5 | Restructure narrative order | 2.1 | 2.1 | Medium | High |
| 6 | Origin story → timeline | 2.9 | 2.5 | Medium | Medium |
| 7 | Product screenshots per feature | 2.3 | 2.6 | Medium | Med–High |
| 8 | Qualifying signup form | 2.7 | 4.3 | Medium | Medium |
| 9 | Interactive/guided preview (stretch) | 2.3 | 6.3 | High | Medium |
| 10 | Pricing-philosophy blurb | 2.8 | 2.7 | Low | Low |
| 11 | Per-page metadata contract + heading hygiene | 2.11 | 1.1 | Low | High |
| 12 | Site-wide JSON-LD (Org + SoftwareApp) | 2.12 | 1.2 + 5.1 | Low | High |
| 13 | Definition/TL;DR block | 2.14 | 1.3 | Low | High |
| 14 | FAQ page + FAQPage JSON-LD + embedded FAQs | 2.13 | 4.1 | Low–Med | High |
| 15 | /features hub + 5 pillars | 2.16 | 3.1 | Medium | High |
| 16 | Use-case pages (5) | 2.15 | 3.2 | Medium | High |
| 17 | /open-source pillar + comparison table | 2.17 | 3.3 | Low–Med | High |
| 18 | /hosting (pricing) philosophy page | 2.18 | 3.4 | Low | High |
| 19 | /about timeline + E-E-A-T (Person/Org/Review) | 2.21 | 4.2 | Low–Med | High |
| 20 | /roadmap (living) + /updates hub + RSS | 2.19 | 4.4+4.5 | Medium | Med–High |
| 21 | /llms.txt (+ llms-full) + semantic HTML | 2.20 | 5.2 | Low | High (GEO) |
| 22 | robots.txt + sitemap + 404 + breadcrumbs | 2.20,2.22 | 5.3+5.4+5.5 | Low | Medium |
| 23 | Site-wide nav + footer + contextual cross-links | 2.10 | 1.5 + 3.5 | Medium | High |
| 24 | Media hygiene (og:image, lazy, WebP, alt) | 2.22 | 6.1 | Low–Med | Medium |
| 25 | Manifest + preconnect/theme-color/perf | 2.11,2.22 | 1.6 + 6.2 | Low | Low–Med |

---

## Appendix B — Keyword clusters → primary page (from `AUDIT.md:§6b`)

One primary term per page in `title`, `h1`, first 100 words, and one `h2`. Secondary terms naturally in body/FAQ.

| Cluster | Page | Primary term | Secondary |
|---|---|---|---|
| Category head | `/` | group management software | team/club management software |
| Open-source/self-host | `/open-source` | open source group management software | self-hosted club/team, free open source nonprofit |
| FIRST/robotics | `/use-cases/first-robotics` | FIRST robotics team management software | FRC/FTC, robotics club |
| Nonprofit | `/use-cases/nonprofits` | nonprofit membership management software | volunteer mgmt, community org |
| Churches | `/use-cases/churches` | church management software | volunteer coordination, congregation |
| Youth/sports | `/use-cases/youth-clubs`, `sports-leagues` | youth club management software | sports league mgmt, youth group |
| Members | `/features/members` | member management software | roster, badge, hierarchy |
| Events | `/features/events` | event management for teams/clubs | RSVP, volunteer shifts, check-in |
| Finance | `/features/finance` | club bookkeeping software | dues, donations, Stripe |
| Communication | `/features/communication` | team announcement software | email, Slack/Discord |
| Automation | `/features/automation` | volunteer hours tracking | time clock, attendance, reports |
| Pricing/hosting | `/hosting` | GatherPack pricing / hosting cost | free self-host vs hosted, FIRST discount |
| Comparison (phase 2) | `/faq` entry or `/vs/teamconvene` | GatherPack vs TeamConvene | alternative to TeamConvene |

---

## Appendix C — Open questions & placeholders (from `AUDIT.md:§5`)

Track here; don't block phases — ship with placeholders.

- [ ] **Proof numbers** (`AUDIT.md:§5` Q1) — predecessor 10y / GatherPack 1y+, 2 orgs live + 6 evaluating; await phone-home numbers.
- [ ] **Screenshots** (`§5` Q2) — owner will provide; seed with `ss-calendar.png`/`ss-directory.png`.
- [ ] **Brand constraints** (`§5` Q3) — build off existing Bootstrap font/color stack; no new palette.
- [ ] **Scope** (`§5` Q4) — full redesign & restructuring (not incremental).
- [ ] **License** (`§5b`) — MIT per `LICENSE.txt`.
- [ ] **Hosting prices** (`§5b`) — `$50 std`, `$100 custom + plugins`, FIRST discount hidden.
- [ ] **Use-case prioritization** (`§5b`) — all 5 in v1.
- [ ] **Testimonials** (`§5b`) — placeholders for Westside/Golden Gate `Review` JSON-LD.
- [ ] **Blog commitment** (`§5b`) — 1–2 seed posts, ~1 post/month or roadmap update.
- [ ] **Contact page** (`§5b`) — yes, crawlable `/contact` with qualifying questions.
- [ ] **GitHub/docs** (`§5b`) — canonical `https://github.com/GatherPack/gatherpack`; docs site TBD.

---

## Appendix D — Technical foundations checklist (from `AUDIT.md:§7`)

Copy-paste gate before launch; check off after Phase 5–6.

- [ ] Front-matter contract enforced; no duplicate titles
- [ ] Heading hygiene (one `h1`, no skipped levels, `id` per section)
- [ ] Semantic landmarks (`<main>`, `<nav>`, `<footer>`, `<article>`, `<time datetime="">`)
- [ ] JSON-LD partial (`Organization` + `SoftwareApplication` + `BreadcrumbList` + `FAQPage`/`AboutPage`/`CollectionPage`/`BlogPosting`) — validated
- [ ] Sitemap & robots updated (lastmod via front-matter/Git, not `File.mtime`; explicit AI bot allows)
- [ ] llms.txt (+ llms-full) reachable
- [ ] Manifest filled + `theme_color` sync
- [ ] 404 + redirect map
- [ ] Images & performance (og 1200×630, width/height, lazy, WebP/srcset, 45-degree-fabric-dark.png compressed, alt audit)
- [ ] Internal linking pass — no orphans
- [ ] Analytics & verification (Plausible, SC/BWT)
- [ ] Pre-launch validators (build clean, htmlproofer/lychee, Lighthouse ≥90, Rich Results, robots/sitemap/llms.txt)

---

*Generated from `AUDIT.md` (363 lines, 25 backlog items, §§2.1–2.22, §§6–7) on 2026-09-17. Update this file as phases complete — keep checkboxes live.*
