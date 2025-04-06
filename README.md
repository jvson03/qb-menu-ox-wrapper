## qb-menu-ox-wrapper

This resource provides full `qb-menu` compatibility while seamlessly converting menus to use `ox_lib` context menus. It requires no changes to existing scripts — just start this resource and your menus will automatically render through `ox_lib`.

### ✅ Features
- Full support for legacy `qb-menu` exports (`openMenu`, `closeMenu`)
- Automatically converts `params = { event, args }` into `ox_lib`-style callbacks
- Preserves headers, icons, and subtext
- Works with any QBCore script expecting `qb-menu`
- Provides `qb-menu` without replacing it (via `provide`)

### 📦 Usage

1. Drop into your `resources` folder (can be named anything)
2. Add to your `server.cfg` before any resources using `qb-menu`
3. Done — zero code edits required
