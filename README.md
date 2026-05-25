# Food Delivery App (Clean Architecture + GetX)

A modernized Flutter food delivery UI with feature-based clean architecture, GetX navigation/state, a complete cart/payment flow, and map-based delivery logic.

## What was upgraded

1. **Architecture:** moved to layered feature modules (`data`, `domain`, `presentation`) with use-cases and repositories.
2. **Navigation:** switched to **GetX** (`GetMaterialApp`, named routes, bindings, controllers).
3. **UI refresh:** modern Material 3 dashboard, category chips, food cards, cart summary, and profile shell.
4. **Payment window:** checkout screen with payment method selection, order summary, and mocked transaction processing.
5. **Map window logic:** OpenStreetMap-based map (`flutter_map`), tap-to-select delivery location, distance and dynamic fee calculation.

## Project structure

```text
lib/
  app/
    app.dart
    bindings/
    routes/
  core/
    theme/
  features/
    dashboard/
    home/
    cart/
    map/
    payment/
    profile/
```

## Run locally

```bash
flutter pub get
flutter run
```

## Notes before GitHub upload

1. Update app name (`fooood`) if needed.
2. Replace fake payment datasource with real gateway integration.
3. Connect food/cart/orders to backend APIs.
