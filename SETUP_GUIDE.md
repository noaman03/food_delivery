# SETUP_GUIDE.md

## Local Development Setup

### 1. Prerequisites
```bash
flutter --version   # Ensure 3.1.4+
dart --version      # Ensure 3.1.4+
```

### 2. Clone & Install
```bash
git clone https://github.com/your-username/food_delivery.git
cd food_delivery
flutter pub get
```

### 3. Run
```bash
flutter run
```

### 4. Verify Build
```bash
flutter analyze          # Check for lint issues
flutter test             # Run widget tests
```

---

## Project Navigation

### Main Screens
- **Dashboard** (`/`) — Tab shell with 3 sections
- **Home** — Food browsing with category filter
- **Map** — Delivery location selector (OpenStreetMap)
- **Profile** — User info stub
- **Cart** (`/cart`) — Shopping cart management
- **Payment** (`/payment`) — Checkout flow

### Key Files to Know

| File | Purpose |
|------|---------|
| `lib/main.dart` | App entry & setup |
| `lib/app/app.dart` | Root GetMaterialApp |
| `lib/app/bindings/initial_binding.dart` | Dependency injection |
| `lib/app/routes/app_routes.dart` | Route path constants |
| `lib/features/*/presentation/controllers/*.dart` | State management |
| `lib/features/*/domain/usecases/*.dart` | Business logic |
| `lib/features/*/data/datasources/*.dart` | Data fetching |

---

## Common Tasks

### Add a New Feature
1. Create folder: `lib/features/my_feature/`
2. Add layers: `domain/`, `data/`, `presentation/`
3. Create controller, page, entities, repositories
4. Add to `InitialBinding`
5. Register routes in `app_pages.dart`

### Modify Theme
Edit: `lib/core/theme/app_theme.dart`
- Colors, fonts, typography

### Connect API Endpoint
1. Locate datasource file (e.g., `food_local_data_source.dart`)
2. Replace mock data with HTTP call
3. Handle errors and loading states in controller

### Add Payment Gateway
Edit: `lib/features/payment/data/datasources/payment_remote_data_source.dart`
- Replace mock processing with real gateway (Stripe, PayPal)
- Handle success/failure callbacks

### Deploy to Play Store
```bash
flutter build apk --split-per-abi    # APK for all architectures
flutter build appbundle              # Bundle for Play Store
```

---

## Troubleshooting

### Import Errors
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Hot Reload Not Working
```bash
flutter clean
flutter pub get
flutter run
```

### Map Tiles Not Loading
- Check internet connection
- OpenStreetMap tiles are free, no API key needed
- If blocked by firewall, use alternative tile provider (see `map_page.dart`)

### Payment Mocking Not Working
- Ensure `PaymentRemoteDataSource` delay finishes
- Check controller's `isLoading` state

---

## Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

---

## Performance Optimization

1. **Image Caching**
   - Use `Image.network()` with `cacheHeight`, `cacheWidth`

2. **List Performance**
   - Use `ListView.builder` instead of `ListView`

3. **State Management**
   - Keep Rx observables granular (don't make entire models Rx)

4. **Bundle Size**
   - Run `flutter build apk --analyze-size`

---

## Git Workflow

```bash
# Create feature branch
git checkout -b feature/amazing-feature

# Make changes & commit
git add .
git commit -m "feat: add amazing feature"

# Push & open PR
git push origin feature/amazing-feature
```

---

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [Clean Architecture](https://resocoder.com/flutter-clean-architecture)
- [Material 3 Guidance](https://m3.material.io/)
