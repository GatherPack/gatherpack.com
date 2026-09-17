# GatherPack Marketing Site — Competitive Audit & Action Plan

**Prepared:** September 2026
**Subject site:** https://gatherpack.com
**Competitor analyzed:** https://softwareconvene.org and https://teamconvene.org (SoftwareConvene LLC's robotics/team-club product — the closest direct competitor to GatherPack)

**Purpose:** This doc is meant to be handed to a coding/design agent as a work order. It documents current-state findings, names the competitive gaps, and lays out a prioritized backlog. Each finding includes *what*, *why it matters*, and *suggested direction* — implementation details are intentionally left open for the agent to propose.

---

## 1. Context

GatherPack is an open-source (self-hostable) platform for managing "people-powered groups" — originally built for a FIRST Robotics team, now generalized for teams, clubs, churches, sports leagues, and all manner of other community-focused organizations. It's a real product with years of production use behind it, currently in an immediately post-beta-testing rollout stage.

TeamConvene is a SaaS competitor targeting the same audience (robotics teams & clubs), part of a four-product family (ClassConvene, TeamConvene, BizConvene, OrgConvene) under SoftwareConvene LLC, founded 2026, invite-only beta launching August 2026. No self-host option; no visible customers yet.

**Strategic read:** GatherPack's real advantages are (1) production track record, (2) open-source/self-host optionality, (3) an authentic origin story, (4) narrower focus on one audience instead of four. GatherPack's site currently *undersells* all four of these. The competitor's site outpaces GatherPack mainly on **information architecture, narrative pacing, and interactive proof** — not on substance. The goal of this work is to close the craft gap while amplifying the substance advantage, not to imitate the competitor's voice.

---

## 2. Current-State Findings (GatherPack site)

### 2.1 Structure & narrative flow
- **Finding:** The page is a fairly flat stack of sections (hero → logos → story → features → community blurb → footer) with little narrative build. Compare to competitor's scroll pattern: hero → live interactive demo → problem framing → feature deep-dives with visual "in the current build" vs "coming this fall" staging → structured signup.
- **Why it matters:** Flat structure makes the strongest asset (the origin story) read as "About page content" rather than a persuasive arc.
- **Direction:** Restructure into a deliberate scroll narrative. Suggested order: hero (proof-forward) → the problem (scattered spreadsheets/sticky notes, kept from existing copy) → proof of production use (teams, years running) → feature tour → openness/self-host pillar → roadmap (reframed, see 2.4) → CTA.

### 2.2 Proof is present but buried
- **Finding:** Real customer logos (Westside Robotics, Golden Gate Robotics) exist and link out, and the origin story mentions "over the past decade" — but there's no stat, timeline, or prominent framing making the track record obvious in the first screen.
- **Why it matters:** This is GatherPack's single biggest asset vs. a competitor that has zero live customers and an "invite-only beta" positioning. It should be unmissable within the first viewport.
- **Direction:** Add a proof strip near the top — e.g. years running, number of organizations/members managed if available, or at minimum explicit language like "In production since [year]" / "Trusted by teams managing [X] members." Pull logos up higher if feasible.

### 2.3 No interactive or visual product preview
- **Finding:** The current site has zero screenshots, product tour, or interactive element. It's text-and-logos only.
- **Why it matters:** Competitor offers a no-login, click-around read-only demo ("Tour a live team"). That's a strong trust/curiosity mechanism GatherPack has no equivalent for. Even without matching that exactly, having *zero* visual of the product itself is a gap on its own — pre-competitor even.
- **Direction:** At minimum, add real product screenshots per feature section. Stretch goal: a lightweight guided/interactive preview or short screen-capture walkthrough (doesn't need to be a full sandboxed demo environment to start).

### 2.4 "In development" features read as disclaimers, not roadmap
- **Finding:** Unfinished features (Messaging, Notifications, Payment Processing, Actions) are marked with a single trailing asterisk and a small-print footnote: "* Some of these features are still in development and will be available soon!"
- **Why it matters:** This frames incompleteness as an apology. Competitor handles the identical situation (lots of "in the August build" / "this fall" items) as an exciting, confidently-labeled roadmap with its own visual section.
- **Direction:** Split features into "Available now" and "On the roadmap" (or similar) as distinct, intentional visual sections rather than a footnote asterisk. Keep tone confident — a roadmap signals active development, not a gap.

### 2.5 Open-source / self-host positioning is undersold
- **Finding:** Self-hosting is mentioned once, mid-page, in a single sentence ("If you've got technically-inclined people in your organization, you can run GatherPack for free on your own servers").
- **Why it matters:** Competitor offers no self-host or open-source option at all — full SaaS lock-in through their own login system. This is a clean, differentiated pillar GatherPack should own loudly, especially for the segment of the audience (technical volunteers, robotics teams by nature) who will care about it.
- **Direction:** Promote self-host/open-source to a top-level pillar (alongside things like flexibility, community-built nature) — its own section or a prominent callout, not a buried sentence. Make the free/self-host vs. paid-hosted choice clear and easy to find, ideally near pricing/CTA.

### 2.6 Visual design system is inconsistent / "semi-slapped-together" (site owner's own characterization)
- **Finding:** No consistent card/section rhythm; feature sections vary in depth of treatment without a clear pattern; feels like sections were added over time without a unifying pass.
- **Why it matters:** This is the main place the competitor site genuinely reads as more polished, despite being (per site owner's read) AI-generated and somewhat generic underneath. Visual consistency is a relatively low-cost, high-visible-impact fix.
- **Direction:** Establish a consistent section/card pattern (icon or screenshot + heading + 1-2 sentence description + optional tag chips) and apply it uniformly across the Tools & Features section. Keep GatherPack's warmer, more "artisanal/community" visual language (this is a stated brand goal) — don't adopt the competitor's emoji-icon/chip-list AI-generated aesthetic wholesale; differentiate on craft *and* warmth.

### 2.7 Weak/generic CTAs
- **Finding:** Primary CTAs are "Contact Us to Get Started" (brings up an embedded Tally form) and "Schedule a Demo." 
- **Why it matters:** Competitor's beta signup form asks qualifying questions (program type, state, school-based or not) which both filters leads and signals a real, structured onboarding process is happening behind the scenes.
- **Direction:** Consider a deeper interest form with a couple of light qualifying questions (org type, size, technical capacity/self-host interest) to both improve lead quality and signal process maturity.

### 2.8 No pricing information
- **Finding:** No pricing is shown anywhere on the page for the hosted/supported option.
- **Why it matters:** Competitor also shows no pricing (just "fair pricing" messaging), so this isn't a competitive deficit — but given GatherPack's "affordable hosting" claim, even a lightweight pricing-philosophy section (not necessarily a full price table) could reinforce the openness/no-lock-in positioning versus a SaaS competitor that's opaque about cost.
- **Direction:** Low priority. Optional: a short "how pricing works" blurb (free self-host / affordable hosted tiers) rather than a full pricing page, to underline transparency without committing to a public price table yet.

### 2.9 Origin story is strong copy, weak presentation
- **Finding:** The "GatherPack Story" section has genuinely good, specific, human detail (sticky notes, spreadsheets, a volunteer web developer, students helping rebuild it) — but it's presented as three dense paragraphs of prose.
- **Why it matters:** This is the site's best differentiating content and it's the least visually supported. Competitor's "About" section is thinner on substance but better paced.
- **Direction:** Break into a lightweight visual sequence (e.g., 3-4 step timeline: the problem → the first fix → outgrowing it → GatherPack today) rather than a prose block. Preserve the specific, human details — don't genericize the copy, just improve the scaffolding around it.

### 2.10 Single-URL architecture is a hard SEO/GEO ceiling
- **Finding:** The crawlable site is effectively one URL (`source/index.html.erb:1-4` supplies the only `title`/`description`; `source/first-teams.html.erb:1` has no front-matter and inherits the generic fallback `GatherPack` from `source/layouts/layout.erb:35`). `source/sitemap.xml.erb:3` enumerates only files matching `/html/i` — today that's 2 documents (index + first-teams), with first-teams orphaned (no nav, no internal link, no footer link, no reference from index). There is no dedicated URL for any feature, use case, persona, pricing/self-host choice, story, or FAQ — all of which are long-tail query surfaces.
- **Why it matters:** Classic SEO and GEO both reward topical depth via distinct, internally-linked pages. One page cannot rank for "open source club management software" *and* "FIRST robotics team management" *and* "self-hosted church management" *and* "volunteer time tracking software" with distinct intent. LLMs likewise prefer to cite a precise page (`/features/events`, `/use-cases/first-robotics`) over a `#hash` offset inside a single 300-line page. Current IA leaves ~90% of high-intent queries with no target to land on or cite.
- **Direction:** Expand from 1.5 pages to a deliberate hub-and-spoke IA (see §6). Keep the reimagined homepage as the hub, but spin each major topic into its own indexable document with unique `title`/`description`/`og:*`/`canonical` and `h1`. Wire them together with site-wide nav, footer clusters, and in-body contextual links. At minimum, do not launch the redesign as a single-page app.

### 2.11 On-page metadata is thin and partly broken
- **Finding:** Verified in `source/layouts/layout.erb:20-35` and `source/index.html.erb:2-4`:
  - Title is reasonable (`GatherPack: Group Management Software for Teams, Clubs & Nonprofits`) but only exists on one page. first-teams page renders `<title>GatherPack</title>` (stale content-visible in `build/index.html` shows the previous build even used a different, now-lost title — build dir is May 2024, source has diverged).
  - Description is a single sentence; no per-page variance; no `og:description`, no `og:image:width/height/alt`, no `og:locale`, no `twitter:title`/`twitter:image`/`twitter:image:alt`.
  - `og:image` defaults to `https://gatherpack.com/images/logo.png` (`source/layouts/layout.erb:24`) — a small mark, not the `fb-cover.png`/`x-cover.png`/`logo-cover.svg` assets already in `source/images/` that would perform better in link unfurls. No `twitter:card` beyond `summary` (should be `summary_large_image` when a cover is present).
  - No `<meta name="robots">`, no `theme-color` sync with `site.webmanifest`, manifest itself is empty (`source/site.webmanifest:1` — `name`/`short_name` are `""`).
  - Heading outline is flat: one `h1` (logoline), then every content block is `h2` inside `.card-header` with nested `h3`/`h4` features, but all features share a single `h2` (`Everything Your Organization Needs, in One Place` at `source/index.html.erb:43`). Crawlers and answer engines cannot tell where "Event Management" vs "Finance Tracking" begins as a distinct entity.
- **Why it matters:** Metadata is the cheapest SEO/GEO lever and directly controls CTR in SERPs, link unfurls, and how LLMs disambiguate the entity. Weak/uniqueness failures also create duplicate-title risk as soon as new pages exist.
- **Direction:** Create a shared front-matter contract and layout partial that enforces per-page: unique `title` (≤60ch, primary keyword front-loaded), unique `description` (120–155ch, includes secondary keyword + value prop), `og:description` (=description), `og:image` (1200×630 cover per section when possible), `twitter:card`/`twitter:image`, and `article:published_time`/`modified_time` where relevant. Fix hierarchy: each feature/use-case page gets its own `h1`; homepage feature grid keeps `h2` per feature group, not one `h2` wrapping five unrelated features. Fill `site.webmanifest` (`name`, `short_name`, `description`, `theme_color` matching SCSS `$greige-darkest`).

### 2.12 Zero structured data (JSON-LD) — the biggest GEO miss
- **Finding:** `source/layouts/layout.erb:1-64` emits no `<script type="application/ld+json">` at all. Grep of the repo confirms no `schema.org` references. That means no `SoftwareApplication`, no `Organization`, no `FAQPage`, no `BreadcrumbList`, no `AboutPage`, no `Product` pricing/offer hints.
- **Why it matters:** Structured data is how Google builds rich results *and* how GEO pipelines (Google AI Overviews, Bing Copilot, Perplexity, ChatGPT browsing) ground answers. Without it, GatherPack is invisible for "what is GatherPack pricing," "is GatherPack open source," and FAQ-style queries even if the prose answers them. Competitor also has none — this is a clean chance to out-structure them rather than out-spend them.
- **Direction:** Add JSON-LD as a layout partial with per-page overrides:
  - Site-wide `Organization` (name, url, logo `source/images/logo.svg`, founding date, sameAs links from `source/_social.erb:1-19`, contactPoint).
  - Site-wide `SoftwareApplication` (name, applicationCategory `BusinessApplication`, operatingSystem `Web`, offers: free/self-host + paid hosted via Sledgehammer, featureList from feature pages, screenshot array once screenshots exist — reuse `ss-calendar.png`/`ss-directory.png` as seed).
  - Per-page `BreadcrumbList` and, where appropriate, `FAQPage` (FAQ page), `AboutPage` (story), `CollectionPage` (features hub). Validate with Google Rich Results Test + Schema.org validator before launch.

### 2.13 No FAQ / Q&A surface for AI citation
- **Finding:** The site answers many high-value questions in prose but never in a scannable Q&A form that answer engines prefer to lift verbatim: "Is GatherPack free?" / "Can I self-host?" / "How is GatherPack different from TeamConvene?" / "Does it support dues/payments?" / "Who is it for?" The closest is a dense paragraph in `source/index.html.erb:281-284` (self-host sentence) and the feature blurbs.
- **Why it matters:** GEO studies consistently show FAQ sections with `FAQPage` schema are disproportionately cited in AI Overviews and chatbot answers. They also capture "People Also Ask" boxes. This is low-effort, high-citation-yield content that directly serves both SEO and GEO.
- **Direction:** Create a dedicated `/faq` page (8–12 pairs, grouped: General, Self-Hosting & Hosting, Features & Roadmap, Teams & Use Cases) plus 2–3 FAQ pairs embedded at the bottom of each major page (features, use cases, self-host/hosting). Keep answers 40–60 words, plain language, and include a one-sentence TL;DR + optional "Learn more →" link. Mark up with `FAQPage` JSON-LD and visible HTML (no JS-only reveal that blocks crawlers; use `<details>` or plain headings if accordion is used).

### 2.14 No definition / TL;DR block for entity extraction
- **Finding:** The hero at `source/index.html.erb:10-21` is warm but not extractable: no single sentence of the form "GatherPack is [category] that [does X] for [audience] — [key differentiator]." The `lead` line (`source/index.html.erb:8`) is keyword-stuffed but generic; the `card-hero` that follows is two paragraphs without a concise definition.
- **Why it matters:** LLMs and AI Overviews lift a 1–2 sentence definition for "What is GatherPack?" If one isn't provided, the model synthesizes one (often poorly) or quotes the competitor's crisper definition instead.
- **Direction:** Add an explicit, visually distinct definition callout directly under the hero `h1` (e.g., styled `.card-hero` variant or aside): "GatherPack is free, open-source group management software for teams, clubs, churches and nonprofits — manage members, events, finances and communications in one place. Self-host free or use affordable managed hosting via Sledgehammer Infosystems." Keep it verbatim-reusable across `meta description`, `og:description`, and `SoftwareApplication.description` for consistency. This one paragraph should survive unchanged on homepage, About, and llms.txt summary.

### 2.15 No use-case / persona landing pages — keyword clustering is uncaptured
- **Finding:** `source/index.html.erb:242-254` ("Built for Organizations Like Yours") lists four personas in a single `<ul>` (youth activities, nonprofits, churches, any people-powered group) with no dedicated page, no keyword-optimized `h1`, and no tailored proof/copy per persona. Yet these map directly to high-volume, low-competition long-tails: `FIRST robotics team management software`, `youth club management software`, `church volunteer management software`, `nonprofit membership management open source`, `sports league management self-hosted`, etc. `source/first-teams.html.erb:1-162` *is* a FIRST-specific deep dive but is orphaned and not linked from the homepage.
- **Why it matters:** Use-case pages are the classic SEO moat for horizontal products — each page can own a keyword cluster, include tailored screenshots/testimonials, and earn backlinks from that community. The competitor targets "robotics teams & clubs" only; GatherPack can flank them by owning the broader set while still beating them on the robotics niche with real production proof (Westside/Golden Gate) that the competitor cannot claim.
- **Direction:** Create 4–6 use-case pages under `/use-cases/` (suggested: `first-robotics`, `youth-clubs`, `churches`, `nonprofits`, `sports-leagues`; start with at least `first-robotics` and `nonprofits` as flagships). Each page: unique `h1` with primary keyword, definition block, 3–4 tailored feature callouts, one testimonial/logo, one screenshot, FAQ pair, CTA. Cross-link from homepage persona list and from feature pages ("How nonprofits use Finance Tracking →").

### 2.16 No feature deep-dives — content depth is collapsed into one card
- **Finding:** All five feature pillars (Member, Event, Finance, Announcements/Messaging, Automation) are collapsed into one giant card under a single `h2` at `source/index.html.erb:41-240`. Each has `h3`+`h4`+icon but ~1 sentence per sub-feature, no screenshot, no dedicated URL, no internal anchor stability (no `id` attributes). The two existing screenshots (`source/images/ss-calendar.png`, `ss-directory.png`) are not referenced anywhere on index.
- **Why it matters:** Collapsing depth hurts both crawlability (no URL to rank for "volunteer time tracking software" or "club bookkeeping app") and GEO chunking (answer engines prefer to cite a focused 300-word page over a 1,200-word mega-section). Screenshots also improve dwell time and image search surface.
- **Direction:** Create a `/features/` hub plus one page per pillar (`/features/members`, `/features/events`, `/features/finance`, `/features/communication`, `/features/automation`). Hub reuses the consistent card pattern from §2.6 but each card links out to its deep dive. Each deep-dive page: `h1` = "[Feature] for [Audience]" (keyword-aware), 3–5 sub-feature blocks with consistent icon/screenshot+heading+1–2 sentence pattern, one real screenshot (provide via Q in §5), one FAQ, one CTA. Preserve the `Coming Soon` badges but move them into the §2.4 roadmap treatment (split "Available now" vs "On the roadmap") so deep dives don't read as disclaimers.

### 2.17 No open-source / self-host pillar page — the core differentiator has no home
- **Finding:** As noted in §2.5, self-host is a single sentence at `source/index.html.erb:282-284`. There is no `/open-source` or `/self-hosting` page, no GitHub link prominence beyond the beta CTA (`source/_beta_cta.erb:10`), no license mention, no contributor/tech-stack info, no self-host vs hosted comparison. The GitHub org (`https://github.com/GatherPack`) is linked but not otherwise surfaced for crawlers or LLMs.
- **Why it matters:** "open source [category] software" and "self-hosted [category] alternative" are durable, high-intent queries with weak competition and strong alignment with GatherPack's moat vs SaaS-only competitor. They are also the queries LLMs route to when users ask "is there a self-hosted alternative to TeamConvene?" Today there is no page to be that answer. Open-source pages also earn natural backlinks and GitHub stars → domain authority.
- **Direction:** Create `/open-source` (or `/self-hosting`) as a top-level page linked from main nav and footer pillar. Include: 1-sentence definition (open source under [LICENSE.txt] — surface the actual license), why self-host vs managed (control/privacy/cost), what self-hosting entails (tech requirements, quick-start link to GitHub/README), comparison table (Self-host Free vs Managed Hosted via Sledgehammer — price philosophy, support, updates, payments integration), GitHub stats/callout, and CTA both ways. Add `SoftwareApplication.isAccessibleForFree: true` and `offers` JSON-LD reflecting both options.

### 2.18 No pricing/hosting transparency page — leaves money-intent queries unanswered
- **Finding:** §2.8 notes no pricing. In source, the only pricing hint is at `source/first-teams.html.erb:147-156` ("significantly discounted hosting fee for FIRST teams… still working out pricing… at cost, more or less") and the self-host sentence on index. There is no `/pricing` or `/hosting` page to rank for "GatherPack pricing/hosting cost" — a query users and LLMs will inevitably ask before contacting.
- **Why it matters:** Even without committing to a public price table, a pricing-philosophy page captures intent, reduces sales friction, and gives LLMs a citable source instead of hallucinating a number. It also reinforces the transparency/open positioning vs opaque SaaS competitor.
- **Direction:** Create `/hosting` (or `/pricing`) with philosophy copy, the self-host vs managed table from §2.17, FIRST-teams discount callout (reuse Westside/Golden Gate as proof), and a CTA to the qualifying form from §2.7. If not ready to publish numbers, use ranges or "starting at / at-cost for FIRST teams" language and a clear "Contact for current hosted tiers" CTA — still indexable. Add `Offer`/`AggregateOffer` JSON-LD once numbers are final.

### 2.19 No freshness / content hub — site looks static to crawlers
- **Finding:** No blog, changelog, roadmap, or docs hub. No `article:published_time`, no visible `last updated` stamps, no RSS/Atom feed. `source/sitemap.xml.erb:6` emits `lastmod` from `File.mtime` but with only two pages and a stale `build/` (May 2024) vs source divergence, freshness signals are weak and potentially misleading.
- **Why it matters:** Freshness is a soft ranking factor and a strong GEO trust signal (LLMs prefer recently-updated sources). A changelog/roadmap as a living page gives crawlers a reason to revisit weekly and gives prospects confidence the product is actively developed — directly supporting the §2.4 roadmap reframe.
- **Direction:** Create `/roadmap` (or `/changelog`) as a living, dated list (Available now / Next / Later) reusing the "Available now vs On the roadmap" split from §2.4 but with dates/changelog entries. Also create `/blog` or `/updates` as a lightweight Middleman blog (even 1–2 seed posts: "GatherPack story, extended" + "Roadmap: what's shipping fall 2026") to establish the content hub and RSS feed. Ensure `sitemap.xml` emits accurate `lastmod` per Git history or front-matter, not just filesystem mtime (which is brittle on deploy).

### 2.20 Missing GEO/LLM affordances (llms.txt, markdown, crawl hygiene)
- **Finding:** No `llms.txt` (or `ai.txt`), no `/docs` markdown mirror, no `/.well-known/` hints, no crawl guidance for AI bots beyond the permissive `source/robots.txt:1-4` (`Allow: /` + `Sitemap`). No explicit bot-allow for `GPTBot`, `ClaudeBot`, `PerplexityBot`, `Google-Extended`, `anthropic-ai`, etc. No clean markdown/HTML variant of the core content that LLMs prefer to ingest over styled HTML.
- **Why it matters:** GEO is increasingly mediated by explicit LLM affordances: `llms.txt` is rapidly becoming the `robots.txt` equivalent for answer engines, and markdown sources are preferred for grounding. Without them, GatherPack delegates its AI representation entirely to whatever the crawler infers from styled Bootstrap HTML.
- **Direction:** Add at minimum:
  - `/llms.txt` (and optionally `/llms-full.txt`) at site root — concise, structured, human+LLM-readable: one-paragraph definition, bullet feature list, self-host vs hosted distinction, links to key pages (features, use-cases, open-source, hosting, FAQ, GitHub, Discord), and contact.
  - Keep semantic HTML clean (landmark elements: `<main>`, `<nav>`, `<footer>`, `<article>`; proper heading hierarchy; no content hidden behind JS-only modals — the Tally form in `source/_contact_modal.erb:8` is iframe-only; provide a fallback `/contact` page with the same form and a plain HTML alternative for crawlers).
  - Update `robots.txt` to explicitly allow major AI crawlers and point to `llms.txt` via comment, and ensure `sitemap.xml` is accurate post-expansion.

### 2.21 Weak E-E-A-T and entity signals
- **Finding:** `source/layouts/layout.erb:12-15` declares `author`/`publisher` as `Sledgehammer Infosystems` with no `Person`/`Organization` JSON-LD, no About page, no byline on the origin story (`source/index.html.erb:256-269`), no visible founding/production dates structured for extraction (the "decade" claim is prose-only), no address/contact structured data, no testimonial with `Review` markup despite real customers (Westside, Golden Gate).
- **Why it matters:** E-E-A-T (Experience, Expertise, Authoritativeness, Trust) is how both Google and LLMs decide which source to cite when two sites make similar claims. GatherPack's production story is its strongest E-E-A-T asset but is currently uncited, unstructured prose — i.e., not machine-verifiable.
- **Direction:** Create `/about` (timeline version of the story per §2.9) with dated milestones, named author (Brad Thompson with link to `https://brad-thompson.com` already in `source/index.html.erb:262`), organization publisher (Sledgehammer), and real customer logos with outbound links + optional `Review`/`Testimonial` JSON-LD. Surface founding/production dates, number of orgs/members (once available per §5 Q1), and link to GitHub as proof of open-source activity. Add `Person` + `Organization` JSON-LD site-wide.

### 2.22 Media, performance, and crawl hygiene gaps
- **Finding:** Spot-checked:
  - Images `ss-calendar.png`/`ss-directory.png`/`fb-cover.png`/`x-cover.png` exist in `source/images/` but are unused on index; `logo.png` is used as `og:image` but is undersized for social cards; no `width`/`height` on `<img>` tags, no `loading="lazy"` on below-fold images.
  - No `alt` audit beyond logos (`source/index.html.erb:31,35` have alt; hero/logo at `source/index.html.erb:6` has alt via `image_tag`).
  - `source/layouts/layout.erb:47-48` loads `plausible.io` + FontAwesome kit + Google Fonts + Bootstrap CDN (`source/layouts/layout.erb:62`) — functional but no `preconnect`/`dns-prefetch` for `plausible.io`/`kit.fontawesome.com`, no `font-display:swap` control beyond Google Fonts default, no image optimization pipeline.
  - No 404 page (`source/404.html.erb` absent), no redirect map for future IA changes, no breadcrumb markup for new hierarchy.
- **Why it matters:** Image search, Core Web Vitals, and crawl efficiency are secondary but compound: unused images are missed ranking opportunities; missing dimensions cause CLS; missing 404/breadcrumb hurts new IA's internal linking.
- **Direction:** As part of the redesign: use existing cover assets for `og:image`/`twitter:image`, add explicit `width`/`height` + `loading="lazy"` below the fold, compress/convert screenshots to WebP with `srcset`, add a branded `404.html.erb` with search/CTA + `noindex`, and add `BreadcrumbList` JSON-LD + visible breadcrumbs on all sub-pages. Audit `alt` text: descriptive for content images, empty for decorative icons. Add `preconnect` for Plausible/FontAwesome if they remain.

---

## 3. What NOT to change

To keep the agent from over-correcting toward the competitor's aesthetic:

- **Don't adopt emoji-as-icons or heavy chip-list patterns** (`X · Y · Z`) — this reads as a competitor/AI-generated visual signature; GatherPack's brand goal is artisanal/organic/community-built, not templated-SaaS.
- **Don't strip out the specific, human origin story details** in favor of generic "founder-led" copy.
- **Don't hide or minimize the open-source/self-host option** to look more like a conventional SaaS product — it's a genuine differentiator, not a weakness to downplay.
- **Don't copy competitor's exact repeated CTA microcopy patterns** ("See it up close →" etc.) — find GatherPack's own consistent-but-warmer CTA voice.

---

## 4. Prioritized Backlog

### 4a. Original backlog — design, copy & narrative (retained)

Ordered by estimated impact-to-effort ratio.

| # | Item | Section ref | Effort (est.) | Impact |
|---|---|---|---|---|
| 1 | Add proof strip near top (years running / scale / "in production since") | 2.2 | Low | High |
| 2 | Reframe "in development" footnote as a proper roadmap section | 2.4 | Low–Med | High |
| 3 | Elevate open-source/self-host to a top-level pillar/section | 2.5 | Low–Med | High |
| 4 | Establish consistent card/section design system for Tools & Features | 2.6 | Medium | High |
| 5 | Restructure page narrative order (proof → problem → story → features → openness → roadmap → CTA) | 2.1 | Medium | High |
| 6 | Convert origin story prose into a visual step/timeline sequence | 2.9 | Medium | Medium |
| 7 | Add real product screenshots per feature | 2.3 | Medium | Medium–High |
| 8 | Structured beta-signup form with light qualifying questions | 2.7 | Medium | Medium |
| 9 | Interactive/guided product preview (stretch) | 2.3 | High | Medium |
| 10 | Lightweight pricing-philosophy blurb | 2.8 | Low | Low |

### 4b. New backlog — SEO/GEO & content depth (added Sep 2026)

Same impact/effort scale; SEO/GEO items are intentionally interleaved with 4a when implementation is sequenced (see §6 sequencing note).

| # | Item | Section ref | Effort (est.) | Impact | Notes |
|---|---|---|---|---|---|
| 11 | Fix per-page metadata contract (title/description/og/twitter/canonical) + heading hierarchy | 2.11 | Low | High | Unblocks all new pages; do first |
| 12 | Add site-wide JSON-LD (Organization + SoftwareApplication) + per-page BreadcrumbList | 2.12 | Low | High | Do alongside 11 |
| 13 | Add explicit definition/TL;DR block to hero (entity extraction) | 2.14 | Low | High | Single paragraph, reused in meta + llms.txt |
| 14 | Create dedicated FAQ page + FAQPage JSON-LD + per-page embedded FAQs | 2.13 | Low–Med | High | Highest GEO citation yield per effort |
| 15 | Expand IA: create /features hub + 5 pillar pages (members/events/finance/communication/automation) | 2.16 | Medium | High | Reuses existing copy + new screenshots; internal linking hub |
| 16 | Create use-case landing pages (/use-cases/first-robotics, /use-cases/nonprofits at minimum) | 2.15 | Medium | High | Start with 2 flagships; add youth-clubs/churches/sports later |
| 17 | Create /open-source (or /self-hosting) pillar page | 2.17 | Low–Med | High | Core differentiator; comparison table self-host vs managed |
| 18 | Create /hosting (or /pricing) philosophy page | 2.18 | Low | High | Even without hard numbers; Offer JSON-LD later |
| 19 | Create /about page (timeline) + E-E-A-T hardening (Person/Organization/Review JSON-LD) | 2.21 | Low–Med | High | Reuses §2.9 story; add dates/names/links |
| 20 | Create /roadmap (living, dated) + optional /blog or /updates hub + RSS | 2.19 | Medium | Medium–High | Freshness + roadmap reframe; 1–2 seed posts to start |
| 21 | Add /llms.txt (+ optional /llms-full.txt) and clean semantic HTML affordances | 2.20 | Low | High (GEO) | Do after hub pages exist so links are real |
| 22 | Update robots.txt (explicit AI bot allow) + fix sitemap.xml (accurate lastmod, priority) + add 404 + breadcrumbs | 2.20, 2.22 | Low | Medium | |
| 23 | Wire site-wide nav + footer topic clusters + contextual cross-links | 2.10 | Medium | High | Nav unblocks orphaned first-teams content (redirect or merge into /use-cases/first-robotics) |
| 24 | Media hygiene: promote cover assets to og:image, add width/height + lazy/lazy, WebP/srcset, alt audit | 2.22 | Low–Med | Medium | Use existing `fb-cover.png`/`x-cover.png` |
| 25 | Fix site.webmanifest + add preconnect/theme-color + performance pass | 2.11, 2.22 | Low | Low–Med | |

**Sequencing suggestion:** 11+12+13 (foundation) → 14+19 (FAQ+About, fast wins that feed JSON-LD) → 23 (nav/footer so new pages are discoverable) → 15+16+17+18 (core IA expansion, can be parallelized) → 20+21+22 (freshness/GEO affordances) → 24+25 (polish) interleaved with original 1–10 design tasks. The visual redesign (§2.6) should be applied uniformly to new pages from the start rather than retrofitted.

---

## 5. Open questions for the site owner & their answers

- Do we have real numbers to put in a proof strip (years running, # orgs, # members managed)?
  * GatherPack's internal-only predecessor ran for 10 years supporting Westside Robotics, we've now been running it for a year & change, have one other team that has fully adopted it, and half a dozen or so that are somewhere between experimenting / exploring with "toy" deployments and seriously considering production implementations. Also on the to-do list is a lightweight, opt-in "register your GatherPack server" / phone-home mechanism that can help collect some of those meaningful numbers.
- Is there appetite for real product screenshots yet, given some features are pre-beta?
  * Yep, and that's something I can provide.
- Any brand/visual assets (color palette, type, existing style choices) the agent should treat as fixed constraints before doing a design pass?
  * Just build off of the font/color stack that currently exists - it's really just slightly customized Bootstrap, there's nothing too fancy here.
- Target scope for this pass: full redesign, or incremental fixes against the current template?
  * This is to be a full redesign & restructuring of the content.

### 5b. New SEO/GEO questions for the owner & their answers

- **Confirmed license for open-source positioning?** `LICENSE.txt` is at repo root — surface the actual SPDX identifier (e.g., MIT/AGPL) on the /open-source page and in JSON-LD. Which license should we cite?
  * GatherPack itself is MIT licensed.
- **Hosting price posture:** For `/hosting`, do you want to publish any numbers/ranges now, or keep it philosophy-only ("free self-host / at-cost for FIRST teams / contact for hosted tiers")? Even a range ("hosted tiers starting at $___/mo") is better for capturing price-intent queries than no page at all.
  * I've been debating pricing a lot... I'm strongly leaning towards just a fixed monthly price for "standard" hosting and then a "custom" tier with a higher fixed monthly cost + the ability to develop your own or pay us to develop custom plugin functionality
- **Use-case prioritization:** We propose starting with `/use-cases/first-robotics` (reusing + redirecting `first-teams.html.erb`) and `/use-cases/nonprofits` as flagships. Do you want `churches`, `youth-clubs`, and `sports-leagues` in v1 as well, or phased in v2?
  * Let's go ahead and draft the additional use-case pages as well
- **Testimonials / quotes:** Can Westside Robotics / Golden Gate Robotics provide a 1–2 sentence quotable endorsement (name + role) we can mark up as `Review` JSON-LD? Even a short "GatherPack has been our operational backbone for X years" quote is high-value for E-E-A-T/GEO.
  * I can work on that - leave some placeholders for now.
- **Blog/updates appetite:** Are you willing to publish even 1–2 posts at launch (e.g., "The GatherPack story, extended" + "Fall 2026 roadmap") and commit to ~1 post/month or roadmap update to sustain freshness signals? If not, we should lean harder on the living `/roadmap` page as the freshness mechanism.
  * Sure, I think that's doable.
- **Contact/lead handling:** The Tally form in `source/_contact_modal.erb:8` is JS-iframe + modal-only (invisible to crawlers). Should we also create a crawlable `/contact` page with the same form + a plain HTML fallback and the new qualifying questions (§2.7)? This doubles as a GEO-citable "how to get started" target.
  * That sounds good to me.
- **Domain for docs/GitHub:** Should `/open-source` deep-link directly to `https://github.com/GatherPack` (as `source/_beta_cta.erb:10` does), to a docs site if one exists, or both? Confirm canonical GitHub URL — `source/_beta_cta.erb:10` uses `github.com/GatherPack` while `source/_social.erb:14` uses `github.com/gatherpack` (case variant; same target but normalize for canonical).
  * GatherPack project itself lives at https://github.com/GatherPack/gatherpack, docs site is also in the works but isn't a thing yet.

---

## 6. Proposed Information Architecture & Additional Pages for SEO/GEO Depth

Goal: flesh the site out from 1.5 URLs to ~13–15 indexable pages without creating thin content. Every page has a distinct query intent, unique title/description, `h1`, and at least one internal link in each direction.

### 6a. Target sitemap (Middleman `source/**/*.html.erb` + static `llms.txt`)

```
# Hub
/                          (homepage — rebuilt narrative, §2.1 + proof strip §2.2 + definition block §2.14)
# Features cluster (/features + 5 pillars, §2.16)
/features                  (hub — card grid linking to each pillar)
/features/members
/features/events
/features/finance
/features/communication
/features/automation

# Audience / use-case cluster (§2.15) — start with 2, expand to 5
/use-cases/first-robotics  (replaces/merges source/first-teams.html.erb — add 301 redirect first-teams → this)
/use-cases/nonprofits
/use-cases/churches        (phase 2)
/use-cases/youth-clubs     (phase 2)
/use-cases/sports-leagues  (phase 2 — optional, or fold into youth-clubs)

# Pillar pages (own the differentiators, §§2.17–2.18)
/open-source  (or /self-hosting — pick one canonical; redirect the other alias)
/hosting      (or /pricing — same alias pattern; self-host vs managed table + FIRST discount)

# Trust & depth (§§2.9, 2.13, 2.21)
/about        (timeline version of "How GatherPack Got Started" + team/publisher info)
/faq          (8–12 pairs + FAQPage JSON-LD; each cluster page embeds 2–3 relevant pairs)
/roadmap      (living Available now / Next / Later; doubles as changelog)
/contact      (crawlable fallback for the Tally form + qualifying questions, §2.7)

# Content hub (§2.19) — lightweight at launch, grows over time
/updates  (or /blog)  + /updates/:post.html  (Middleman blog; RSS/Atom feed)
  seed posts: "The GatherPack Story, Extended" + "Roadmap: What's Shipping Fall 2026"

# GEO affordances (§2.20)
/llms.txt
/llms-full.txt  (optional — fuller markdown dump)
/404.html

# Static / infra (retain + fix)
sitemap.xml (regenerated to include all new URLs; accurate lastmod per front-matter)
robots.txt  (explicit AI bot allows + sitemap + llms.txt comment)
site.webmanifest (filled)
```

**Navigation shape:** Top nav: `Features ▾ | Use Cases ▾ | Open Source | Hosting | About | FAQ | Roadmap | Contact` + primary CTA `Get Started / Schedule a Demo` (persistent). Footer clusters mirror IA plus social/GitHub/Discord (`source/_social.erb:1-19`) and a "Self-host free or get managed hosting →" callout. Breadcrumbs on every sub-page (`Home > Features > Events`). All new pages cross-link contextually (e.g., Events page → "See how FIRST teams use check-in & RSVPs → /use-cases/first-robotics").

**Content reuse map (so this isn't net-new writing from scratch):**
- Homepage feature blocks (`source/index.html.erb:41-240`) → split into `/features/*` pillars + hub cards.
- Persona list (`source/index.html.erb:242-254`) → expanded into `/use-cases/*` pages.
- Story prose (`source/index.html.erb:256-269`) → expanded into `/about` timeline.
- Self-host sentence (`source/index.html.erb:281-284`) + hosting blurb (`source/first-teams.html.erb:147-156`) → merged into `/open-source` + `/hosting` comparison table.
- Feature TODOs footnote → becomes `/roadmap` entries.

### 6b. Keyword clusters to own (SEO + GEO)

Not keyword stuffing — each cluster gets one dedicated page where the primary term appears in `title`, `h1`, first 100 words, and one `h2`. Secondary terms appear naturally in body/FAQ.

| Cluster (intent) | Primary page | Primary term example | Secondary terms |
|---|---|---|---|
| Category head | `/` | group management software | team management software, club management software |
| Open-source / self-host | `/open-source` | open source group management software | self-hosted club management, self-hosted team management, free open source nonprofit software |
| FIRST / robotics niche | `/use-cases/first-robotics` | FIRST robotics team management software | FRC team management, FTC software, robotics club management |
| Nonprofit | `/use-cases/nonprofits` | nonprofit membership management software | volunteer management software, community organization management |
| Churches | `/use-cases/churches` | church management software (free/self-hosted) | church volunteer coordination, congregation management |
| Youth clubs / sports | `/use-cases/youth-clubs` | youth club management software | sports league management software, youth group management |
| Features — members | `/features/members` | member management software | roster management, badge tracking, team hierarchy |
| Features — events | `/features/events` | event management for teams/clubs | RSVP tracking, volunteer shift signup, check-in |
| Features — finance | `/features/finance` | club bookkeeping software | dues collection, donation tracking, payment processing (Stripe) |
| Features — communication | `/features/communication` | team announcement software | email announcements, Slack/Discord messaging |
| Features — automation | `/features/automation` | volunteer hours tracking (time clock) | attendance tracking, kiosk time clock, custom reports |
| Price/hosting | `/hosting` | GatherPack pricing / hosting cost | free self-host vs hosted, FIRST team discount |
| Comparison (phase 2) | `/vs/teamconvene` or `/faq` entry | GatherPack vs TeamConvene | alternative to TeamConvene, open source alternative |

### 6c. Content depth per page (avoid thin pages)

Minimum viable depth to be index-worthy and GEO-citable — enforced as a checklist before any new page ships:

- Unique `title`/`description`/`og:*`/`canonical` + single `h1` matching primary intent.
- 300–600 words of body (can be tight; use consistent card/sub-feature pattern from §2.6 rather than long prose).
- 1 real screenshot or diagram (seed with `ss-calendar.png`/`ss-directory.png`; replace with fresh captures per §5 Q2 as they arrive).
- 1 proof element (logo, testimonial, or stat from §2.2 even if modest — "in production since 2014 (predecessor) / GatherPack since 2024, trusted by 2 orgs + 6 evaluating").
- 2–3 embedded FAQ pairs relevant to the page (also appears on `/faq` canonical).
- CTA row (same 4 CTAs from `source/_beta_cta.erb:1-16` but page-appropriate primary).
- Internal links: ≥2 outbound to sibling pages, ≥1 inbound from hub/homepage.

---

## 7. Technical SEO / GEO Foundations Checklist

Implementation checklist for the coding/design agent — verify against `source/layouts/layout.erb` and related source files. Check off before launch; re-verify with validators.

- [ ] **Front-matter contract:** Every `source/**/*.html.erb` declares `title`, `description`, optional `graph_image`, `published_time`/`modified_time`. Layout at `source/layouts/layout.erb:20-35` enforces fallbacks and emits: `<title>`, `meta description`, `og:title`, `og:description`, `og:url`, `og:image` (1200×630, with `width`/`height`/`alt`), `og:locale`, `og:site_name`, `twitter:card` (`summary_large_image` when cover present), `twitter:title`, `twitter:description`, `twitter:image`, `canonical`, `meta robots` where needed. No duplicate titles.
- [ ] **Heading hygiene:** Exactly one `h1` per page; homepage `h1` is the site definition (not just `.logoline`); feature/use-case pages each have their own `h1`; no skipped levels (`h2` → `h4` without `h3`); every section has an `id` for anchor linking.
- [ ] **Semantic landmarks:** Wrap content in `<main>`, add `<nav>` (site nav), `<footer>` clusters, `<article>` for posts/roadmap entries, `<time datetime="">` for dates. Remove content-hidden-behind-JS-only patterns (Tally modal `source/_contact_modal.erb:8` retains modal UX but `/contact` provides crawlable fallback).
- [ ] **JSON-LD partial:** New `source/_json_ld.erb` (or similar) included in `source/layouts/layout.erb:1-64` `<head>`:
  - Site-wide `Organization` + `SoftwareApplication` on every page (with `sameAs` from `source/_social.erb:1-19`, `offers`, `featureList`, `screenshot`).
  - Per-page `BreadcrumbList` on all sub-pages.
  - `FAQPage` on `/faq` + embedded FAQ JSON-LD on pages that include FAQ pairs (or single FAQPage per page — pick one pattern and be consistent).
  - `AboutPage` on `/about`, `CollectionPage` on `/features`, `BlogPosting` on update posts.
  - Validate: Google Rich Results Test + `https://validator.schema.org/` + `https://search.google.com/test/rich-results`.
- [ ] **Sitemap & robots:** `source/sitemap.xml.erb:1-9` expanded to include new pages, uses front-matter `modified_time` or Git log date for `lastmod` (not just `File.mtime` which is deploy-brittle), includes `<priority>`/`<changefreq>` sensibly (1.0 for `/`, 0.8 for hubs, 0.6 for leaves). `source/robots.txt:1-4` updated to:
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
  # ... plus anthropic-ai, CCBot, etc.
  Sitemap: https://gatherpack.com/sitemap.xml
  # llms.txt: https://gatherpack.com/llms.txt
  ```
- [ ] **llms.txt:** New `source/llms.txt.erb` (copied to `build/llms.txt` as static text) containing: site definition (from §2.14), feature bullets, self-host vs hosted table summary, audience list, links to all hub pages + GitHub + Discord, contact, and a "last updated" date. Keep it under ~1,500 tokens, plain markdown, no HTML. Optionally add `source/llms-full.txt.erb` with fuller content dump.
- [ ] **Manifest & PWA hygiene:** Fill `source/site.webmanifest:1` (`name: "GatherPack"`, `short_name: "GatherPack"`, `description` (= site description), `theme_color`/`background_color` from SCSS `#6d6753`/`#403a22`, `icons` already present, `display: "standalone"` retained).
- [ ] **404 & redirects:** New `source/404.html.erb` (branded, with nav/search/CTA, `noindex`). Add redirect map for IA changes: `first-teams.html` → `/use-cases/first-robotics` (Middleman `proxy` or Netlify `_redirects`/equivalent; document in `config.rb:1-2`).
- [ ] **Images & performance:** Promote `source/images/fb-cover.png`/`x-cover.png`/`logo-cover.svg` to `og:image` candidates (1200×630); add `width`/`height` + `loading="lazy"` (below fold) on all content images; convert screenshots to WebP with fallback; `srcset` for responsive; compress `45-degree-fabric-dark.png` background; audit `alt` (descriptive for content, empty for decorative `fa-*` icons). Ensure Google Fonts uses `display=swap` (already via API param) and add `preconnect` for `plausible.io`/`kit.fontawesome.com` if retained.
- [ ] **Internal linking pass:** Every new page linked from nav + footer + at least one contextual body link; homepage persona list (`source/index.html.erb:242-254`) becomes linked cards; features hub links to pillars and vice versa; use-cases cross-link to relevant features. No orphan pages (audit via `sitemap.xml` vs crawl).
- [ ] **Analytics & verification:** Keep Plausible (`source/layouts/layout.erb:47`) with tagged events; add Search Console + Bing Webmaster Tools verification meta if not already via DNS; ensure `canonical` is absolute (`https://gatherpack.com<%= current_page.url %>` already in `source/layouts/layout.erb:27` — keep).
- [ ] **Pre-launch validators:** `middleman build` clean; `htmlproofer` or `lychee` for broken links; Lighthouse (Performance/SEO/A11y ≥90 target); Rich Results Test; `robots.txt` tester; `sitemap.xml` valid XML; `llms.txt` reachable at both `/llms.txt` and `/llms-full.txt` (if added).