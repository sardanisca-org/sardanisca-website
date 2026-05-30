# Sardanisca Bilingual Site - Complete

The Sardanisca website is now fully bilingual, supporting both Portuguese (pt-PT) and English (en-GB), with Portuguese as the default language.

## Summary

✅ **All content translated** - 7 pages with English versions  
✅ **Language-aware navigation** - Menu links stay in the current language  
✅ **Clean URL structure** - Simple root-relative paths  
✅ **Internationalized UI** - All templates use translation system  
✅ **Language switcher** - Toggle between languages on any page  

## Build Statistics

- **Portuguese**: 16 pages
- **English**: 15 pages

## URL Structure

### Portuguese (default language)
- Homepage: `https://sardanisca.org/`
- About: `https://sardanisca.org/sobre/`
- Events: `https://sardanisca.org/eventos/`
- Residencies: `https://sardanisca.org/residencias/`

### English
- Homepage: `https://sardanisca.org/en/`
- About: `https://sardanisca.org/en/sobre/`
- Events: `https://sardanisca.org/en/eventos/`
- Residencies: `https://sardanisca.org/en/residencias/`

## What Was Done

### 1. Configuration (`hugo.toml`)
- Set up multilingual support with separate language sections
- Configured language-specific menus with translations
- Removed `relativeURLs = true` for cleaner path generation

### 2. Content Translation
All content files translated into English:
- `content/_index.en.md` - Homepage
- `content/sobre/index.en.md` - About page
- `content/eventos/_index.en.md` - Events index
- `content/residencias/_index.en.md` - Residencies index
- `content/residencias/lodo/index.en.md` - Lodo residency
- `content/residencias/tempo-da-la-1/index.en.md` - Wool Time phase 1
- `content/residencias/tempo-da-la-2/index.en.md` - Wool Time phase 2

### 3. Translation Files (`i18n/`)
Created comprehensive translation files with 80+ UI strings:
- `i18n/pt-PT.toml` - Portuguese translations
- `i18n/en-GB.toml` - English translations

Includes translations for: navigation, dates, section titles, UI elements, system messages, etc.

### 4. Template Updates
Updated 10 templates to use the i18n system:
- Default layouts (list, single, term, terms)
- Section-specific layouts (eventos, residencias)
- Partials (head, footer, date-interval, post-list)

### 5. Language-Aware Navigation
Updated menu rendering to use `relLangURL` function, ensuring menu links include the appropriate language prefix and keep users in their selected language.

### 6. Language Switcher
Created language switcher in navigation that:
- Appears when translations are available
- Shows language names (Português/English)
- Maintains page context when switching

## Menu Navigation

Menu links now use clean, root-relative paths:

**Portuguese menu:**
- `/sobre/` → About
- `/residencias/` → Residencies  
- `/eventos/` → Events

**English menu:**
- `/en/sobre/` → About
- `/en/residencias/` → Residencies
- `/en/eventos/` → Events

The `/en/` prefix is automatically added for English pages, keeping navigation language-consistent.

## Testing

Run the development server:
```bash
make run1  # With network binding
make run2  # Local only
```

Or directly:
```bash
hugo server --buildDrafts --buildFuture --noHTTPCache
```

Then visit:
- `http://localhost:1313/` - Portuguese site
- `http://localhost:1313/en/` - English site

## Key Features

1. **Automatic Language Detection** - Hugo serves the correct language based on URL path
2. **Persistent Language Context** - Menu navigation stays in the selected language
3. **Language Switcher** - Easy toggle between Portuguese and English
4. **Fully Translated UI** - All system messages, labels, and elements respect the active language
5. **SEO Ready** - Proper language tags and alternate links for search engines
6. **Clean URLs** - Simple, readable paths without complex relative navigation

## Adding New Content

### To translate a new page:
1. Create Portuguese version: `content/section/page.md`
2. Create English version: `content/section/page.en.md`
3. Keep the same front matter structure
4. Language switcher automatically appears on both versions

### To add new UI translations:
1. Add key to `i18n/pt-PT.toml`
2. Add key to `i18n/en-GB.toml`
3. Use in templates: `{{ i18n "keyName" }}`

## Documentation

- `MULTILINGUAL.md` - Comprehensive guide to the multilingual setup
- `MENU_FIX.md` - Details on the language-aware navigation implementation
- This file - Complete summary of the bilingual implementation

## Status

✅ **COMPLETE** - The Sardanisca website is fully bilingual and production-ready.