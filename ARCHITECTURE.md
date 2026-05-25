# Food Delivery App

This is a professionally structured Flutter food delivery application featuring a clean architecture, GetX state management and routing, modern Material 3 UI, integrated payment checkout, and map-based delivery location selection.

## ✨ Features

- **Clean Architecture:** Feature-based modular structure with data, domain, and presentation layers
- **GetX Navigation:** Type-safe routing with named routes and automatic dependency injection
- **Home Feed:** Browse food items, filter by category, view ratings and pricing
- **Shopping Cart:** Add/remove items, manage quantities, automatic total calculation
- **Delivery Map:** Click-to-select delivery location, real-time distance & fee calculation using Haversine formula
- **Checkout Flow:** Order summary, multiple payment methods (Card/Cash/Wallet), mocked transaction processing
- **Modern UI:** Material 3 design, responsive layouts, smooth animations

## 🏗️ Architecture

```
lib/
├── app/                          # App config & routing
│   ├── app.dart                 # Root widget
│   ├── bindings/                # Dependency injection setup
│   └── routes/                  # Route definitions
├── core/                         # Shared utilities
│   └── theme/                   # Theme configuration
└── features/                    # Feature modules
    ├── dashboard/               # Main tab layout
    ├── home/                    # Food listing & filtering
    ├── cart/                    # Shopping cart management
    ├── map/                     # Delivery location selection
    ├── payment/                 # Checkout & payment processing
    └── profile/                 # User profile stub
```

Each feature follows layered architecture:
- **data/**: Datasources and repository implementations
- **domain/**: Entities, repositories, and use-cases (business logic)
- **presentation/**: Controllers and UI pages

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.1.4+
- Dart 3.1.4+

### Installation

```bash
# Clone & setup
git clone https://github.com/your-username/food_delivery.git
cd food_delivery

# Install dependencies
flutter pub get

# Run
flutter run
```

### Testing

```bash
flutter test
```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| get | 4.6.6+ | Navigation, state management, dependency injection |
| flutter_map | 7.0.2+ | OpenStreetMap-based map widget |
| latlong2 | 0.9.1+ | Geographic coordinates & distance calculations |

## 🛠️ Configuration for Backend Integration

The app is pre-structured for API integration:

1. **Food Items** (`features/home/data/datasources/food_local_data_source.dart`):
   - Replace mock list with API call to `GET /foods`

2. **Payment Processing** (`features/payment/data/datasources/payment_remote_data_source.dart`):
   - Integrate with payment gateway (Stripe, PayPal, etc.)
   - Replace `processPayment()` mock with actual API call

3. **User/Orders** (`features/profile/presentation/pages/profile_page.dart`):
   - Add authentication integration
   - Connect to order history endpoint

## 📝 Environment Setup

Create `.env` file (add to `.gitignore`):
```
API_BASE_URL=https://your-api.com
PAYMENT_API_KEY=your_key_here
MAP_API_TOKEN=optional_if_using_mapbox
```

## 🐛 Known Limitations

- Map uses free OpenStreetMap tiles (no API key needed)
- Payment processing is mocked; real gateway integration required
- User authentication not yet implemented
- No offline data caching

## 🤝 Contributing

1. Create feature branch: `git checkout -b feature/your-feature`
2. Commit changes: `git commit -am 'Add feature'`
3. Push to branch: `git push origin feature/your-feature`
4. Open Pull Request

## 📄 License

This project is licensed under the MIT License—see the LICENSE file for details.

## 👤 Author

Created as a clean, production-ready foundation for food delivery apps.
