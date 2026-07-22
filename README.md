# DokanTrack Flutter App

A Flutter implementation of the supplied Grocery Buy & Sell Tracker mobile designs.

## Included Screens

- Onboarding, login, signup, and verification
- Home dashboard with quick totals and recent records
- New sale, sale saved, and sales history
- Products list, add product, add stock, and product detail
- Due customers, due detail, and collect due
- MFS transactions, new MFS transaction, monthly summary, and settings

## Structure

- `lib/app`: app setup and named routes
- `lib/core/theme`: shared colors and Material theme
- `lib/core/widgets`: reusable tracker UI components
- `lib/features/auth`: authentication screens
- `lib/features/onboarding`: first-run introduction screen
- `lib/features/tracker`: data models, demo data, and app screens

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```

The current implementation uses local demo data and is ready for API or local database integration.
