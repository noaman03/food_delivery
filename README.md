<img width="1466" height="3101" alt="Screenshot_20260526_014235" src="https://github.com/user-attachments/assets/242207a7-34c1-46f8-b73a-00a7ac4ad9dc" /># Food Delivery App (Clean Architecture + GetX)

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
## app pictures

<img width="1466" height="3101" alt="Screenshot_20260526_014235" src="https://github.com/user-attachments/assets/60cbea65-1832-48a4-b0ba-ea2fc00e26bc" />
<img width="1466" height="3101" alt="Screenshot_20260526_014227" src="https://github.com/user-attachments/assets/37996733-1a67-44d3-ab64-af38a62b7a6e" />
<img width="1466" height="3101" alt="Screenshot_20260526_014215" src="https://github.com/user-attachments/assets/b62b74dc-deb7-4cde-8320-c53dc97e38a6" />
<img width="1466" height="3101" alt="Screenshot_20260526_014215" src="https://github.com/user-attachments/assets/50ec7688-f706-4131-9e8d-1fc1ea3efb6b" />
<img width="1466" height="3101" alt="Screenshot_20260526_014240" src="https://github.com/user-attachments/assets/3088cdad-a44d-4881-b992-a85a3ca7dd64" />
<img width="1466" height="3101" alt="Screenshot_20260526_014258" src="https://github.com/user-attachments/assets/bce0bee3-3377-416d-87ac-26eac18ec909" />
<img width="1466" height="3101" alt="Screenshot_20260526_014240" src="https://github.com/user-attachments/assets/8cfdc125-1404-4a26-9f77-3e4fd397c928" />
<img width="1466" height="3101" alt="Screenshot_20260526_014227" src="https://github.com/user-attachments/assets/f4749808-0685-45eb-a2e2-eb9a85d87d33" />
<img width="1466" height="3101" alt="Screenshot_20260526_014252" src="https://github.com/user-attachments/assets/f8f973c8-9587-4a74-ad08-ed7f9287d605" />
