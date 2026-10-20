# راهنمای ساخت و تحویل

## بیلد خودکار (پیشنهادی)
پوش به `main` → GitHub Actions → Release با zip ویندوز.

ریپو باید **public** باشد تا Actions رایگان بماند (محدودیت billing اکانت).

## بیلد محلی
نیاز به Visual Studio Build Tools با workload **Desktop development with C++**:

```bash
flutter pub get
flutter analyze
flutter test
flutter build windows --release
```

خروجی:
`build/windows/x64/runner/Release/pardakhti.exe`

## نصب برای مشتری
کل پوشه `Release` را zip کنید (نه فقط exe). کنار exe باید `data/` و DLLها باشند.

گزینه‌های بسته‌بندی بعدی: Inno Setup یا MSIX.
