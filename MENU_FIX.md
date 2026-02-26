# Menu Language Fix

## Problem

When viewing the English version of the site, clicking on menu items (About, Residencies, Events) would navigate to the Portuguese version of those pages instead of staying in English.

## Root Cause

The menu links in the header template were using `.URL` directly, which doesn't automatically add the language prefix for non-default languages. This meant all menu links pointed to Portuguese pages regardless of which language version you were viewing.

## Solution

### Step 1: Use Hugo's `relLangURL` function

Updated the menu rendering in `themes/sardanisca/layouts/partials/head.html` to use Hugo's `relLangURL` function:

```go
{{ range .Site.Menus.main }}
<a href="{{ .URL | relLangURL }}">{{ .Name }}</a>
{{ end }}
```

The `relLangURL` function automatically adds the appropriate language prefix for non-default languages.

### Step 2: Remove `relativeURLs = true` setting

Removed `relativeURLs = true` from `hugo.toml` to generate clean, root-relative paths instead of complex relative paths like `../../en/sobre/`.

## Result

Menu links now use simple, clean root-relative paths:

### Portuguese (default)
- `/sobre/` (About)
- `/residencias/` (Residencies)
- `/eventos/` (Events)

### English
- `/en/sobre/` (About)
- `/en/residencias/` (Residencies)
- `/en/eventos/` (Events)

These paths are:
- **Consistent**: The same path works from any page depth
- **Clean**: Simple, readable URLs without complex relative navigation
- **Language-aware**: Automatically include `/en/` prefix for English pages

## Testing

After this fix, you can:
1. Visit `http://localhost:1313/en/` (English homepage)
2. Click on any menu item (About, Residencies, Events)
3. You will remain in the English version of the site

The same behavior works for Portuguese - menu navigation stays within the Portuguese version.

## Technical Notes

- The `relLangURL` function is Hugo's built-in way to create language-aware URLs
- Root-relative paths (starting with `/`) are cleaner and more maintainable than complex relative paths
- For the default language (Portuguese), paths have no language prefix
- For other languages (English), the language code is included in the path (e.g., `/en/`)
- This approach works consistently regardless of page depth in the site structure