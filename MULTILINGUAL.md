# Multilingual Configuration

This Hugo site is configured to support both Portuguese (pt-PT) and English (en-GB), with Portuguese as the default language.

## Configuration

The multilingual setup is defined in `hugo.toml`:

- **Default language**: Portuguese (`pt`)
- **Available languages**: Portuguese (`pt-PT`) and English (`en-GB`)
- Each language has its own menu configuration with translated menu items

## Content Structure

Content files can be translated by adding the language code to the filename:

- **Portuguese (default)**: `content/_index.md`
- **English**: `content/_index.en.md`

When creating translated content:
1. Keep the same filename structure
2. Add `.en` before the file extension for English versions
3. Use `.pt` if you need to explicitly specify Portuguese (though it's optional as it's the default)

## Translation Files

Translation strings are defined in the `i18n/` directory:

- `i18n/pt-PT.toml` - Portuguese translations
- `i18n/en-GB.toml` - English translations

These files contain common UI strings like:
- Navigation elements
- Date formats
- Section titles (Events, Residencies, etc.)
- System messages (Draft labels, Nothing found, etc.)

Available translation keys:
- `readMore`, `posted`, `on`, `by`, `tags`, `categories`
- `recent`, `older`, `newer`, `previous`, `next`
- `home`, `about`, `residencies`, `events`
- `upcomingEvents`, `pastEvents`, `futureResidencies`, `pastResidencies`
- `upcoming`, `past`
- `builtWith`, `draft`, `tableOfContents`
- `allTags`, `allArticles`, `entriesTagged`, `nothingFound`

## Language Switcher

The language switcher appears in the navigation menu when a page has a translation available. It's implemented in:

- `themes/sardanisca/layouts/partials/head.html` - Contains the switcher logic and language-aware menu links
- `themes/sardanisca/assets/css/extra.css` - Contains the styling

The switcher only shows up if the current page is translated (has an equivalent in another language).

**Important:** Menu links use `relLangURL` to ensure they stay in the current language. This means when viewing the English version of the site, clicking menu items will keep you in English, and vice versa for Portuguese.

## Translated Content

All content has been fully translated:

### Pages
- **Homepage**: `content/_index.md` + `content/_index.en.md`
- **About**: `content/sobre/index.md` + `content/sobre/index.en.md`
- **Events**: `content/eventos/_index.md` + `content/eventos/_index.en.md`
- **Residencies**: `content/residencias/_index.md` + `content/residencias/_index.en.md`

### Residency Projects
- **Lodo**: `content/residencias/lodo/index.md` + `content/residencias/lodo/index.en.md`
- **Tempo da lã | fase 1**: `content/residencias/tempo-da-la-1/index.md` + `content/residencias/tempo-da-la-1/index.en.md`
- **Tempo da lã | fase 2**: `content/residencias/tempo-da-la-2/index.md` + `content/residencias/tempo-da-la-2/index.en.md`

### Templates
All templates have been updated to use the i18n system instead of hardcoded Portuguese text:
- `themes/sardanisca/layouts/_default/list.html`
- `themes/sardanisca/layouts/_default/single.html`
- `themes/sardanisca/layouts/_default/term.html`
- `themes/sardanisca/layouts/_default/terms.html`
- `themes/sardanisca/layouts/eventos/list.html`
- `themes/sardanisca/layouts/residencias/list.html`
- `themes/sardanisca/layouts/page/single.html`
- `themes/sardanisca/layouts/partials/footer.html`
- `themes/sardanisca/layouts/partials/date-interval.html`
- `themes/sardanisca/layouts/partials/post-list.html`

## Adding New Translations

To translate additional pages or content:

1. Find the Portuguese content file (e.g., `content/eventos/new-event.md`)
2. Create an English version with `.en` in the filename (e.g., `content/eventos/new-event.en.md`)
3. Translate the content while keeping the same front matter structure (title, date, etc.)
4. The language switcher will automatically appear on both versions

For new UI strings:
1. Add the translation key to both `i18n/pt-PT.toml` and `i18n/en-GB.toml`
2. Use it in templates with `{{ i18n "keyName" }}`

## Menu Configuration

Each language has its own menu configuration in `hugo.toml`:

**Portuguese menu:**
- Sobre (About)
- Residências (Residencies)
- Eventos (Events)

**English menu:**
- About
- Residencies
- Events

When adding new menu items, make sure to add them to both language configurations in `hugo.toml`.

## URLs

Hugo generates language-prefixed URLs for non-default languages:
- Portuguese: `https://sardanisca.org/` (no prefix, default)
- English: `https://sardanisca.org/en/` (with `/en/` prefix)

Examples:
- PT: `https://sardanisca.org/sobre/`
- EN: `https://sardanisca.org/en/sobre/`

## Build Statistics

The site currently generates:
- **16 pages** in Portuguese
- **15 pages** in English

All content is fully translated and the site is 100% bilingual.