# معماری و ساختار پوشه‌ها

```
lib/
  main.dart                 # ورود، window_manager
  app.dart                  # MaterialApp.router + RTL + Riverpod
  router/app_router.dart
  core/
    config/                 # AppConfig
    theme/                  # رنگ، تایپو، فاصله، تم، motion
    l10n/                   # AppStrings
    utils/                  # پول، ارقام فارسی
    ui/                     # کتابخانه کامپوننت داخلی
      buttons, inputs, data, feedback, layout, badges,
      navigation, tabs, stepper, skeleton
    database/               # (مرحله ۲) drift
  features/
    shell/presentation/
    showcase/presentation/pages/   # فقط مرحله ۱
    employees/   # مرحله ۳
    payroll/     # مرحله ۴–۶
    reports/     # مرحله ۷
    settings/    # مرحله ۲ و ۸
    auth/        # مرحله ۸
assets/
  fonts/Vazirmatn-*.ttf
  images/
  logo/
docs/
  ASSUMPTIONS.md
  ERD.md
  ARCHITECTURE.md
  PACKAGES.md
```

## لایه‌ها (از مرحله ۲ به بعد)
- `data`: drift tables, DAOs, repositories
- `domain`: entities, PayrollEngine (خالص), validators
- `presentation`: صفحات، providers

## Design System (خلاصه)
| Token | مقدار |
|-------|--------|
| Primary | `#3F3FBF` |
| Accent | `#2A9D8F` |
| Radius کارت | ۱۶ |
| Grid | ۸px |
| فونت | Vazirmatn 400/500/700 |
| Motion | ۱۵۰–۳۰۰ms easeOutCubic |
| Sidebar | راست، ۲۶۰ / ۷۲ |
| Min window | ۱۲۰۰×۷۵۰ |
