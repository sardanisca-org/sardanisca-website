# Menu Language Fix

## Problem

When viewing the English version of the site, clicking on menu items (About, Residencies, Events) would navigate to the Portuguese version of those pages instead of staying in English.

## Root Cause

The menu links in the header template were using `.URL` directly, which doesn't automatically add the language prefix for non-default languages. This meant all menu links pointed to Portuguese pages regardless of which language version you were viewing.

## Solution

Updated the menu rendering in `themes/sardanisca/layouts/partials/head.html` to use Hugo's `relLangURL` function:

```go
{{ range .Site.Menus.main }}
<a href="{{ .URL | relLangURL }}">{{ .Name }}</a>
{{ end }}
```

The `relLangURL` function takes a path and converts it to a language-aware URL by:
1. Adding the appropriate language prefix for non-default languages (e.g., `/en/` for English)
2. Respecting the `relativeURLs = true` configuration by generating relative paths
3. Maintaining the correct path structure regardless of page depth

## Result

Menu links now work correctly in both languages:

### Portuguese (default)
- From `/` (homepage): links to `./sobre/`, `./residencias/`, `./eventos/`
- From `/sobre/`: links to `../sobre/`, `../residencias/`, `../eventos/`

### English
- From `/en/` (homepage): links to `../en/sobre/`, `../en/residencias/`, `../en/eventos/`
- From `/en/sobre/`: links to `../../en/sobre/`, `../../en/residencias/`, `../../en/eventos/`

All paths correctly maintain the language context, so clicking menu items keeps you in the same language.

## Testing

After this fix, you can:
1. Visit `http://localhost:1313/en/` (English homepage)
2. Click on any menu item (About, Residencies, Events)
3. You will remain in the English version of the site

The same behavior works for Portuguese - menu navigation stays within the Portuguese version.

## Technical Notes

- The `relLangURL` function is Hugo's built-in way to create language-aware URLs
- It respects the site's `relativeURLs` configuration setting
- For the default language (Portuguese), it generates paths without a language prefix
- For other languages (English), it includes the language code in the path (e.g., `/en/`)
- The relative path structure (`../`, `../../`) adjusts based on the current page's depth in the site structure