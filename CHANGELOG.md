# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-05-16

### Added
- Initial clean architecture refactor from legacy codebase
- Feature-based modular structure (home, cart, map, payment, profile, dashboard)
- GetX navigation and state management
- Material 3 UI theme
- Food item browsing with category filtering
- Shopping cart with add/remove/quantity management
- Delivery map with click-to-select location
- Real-time distance calculation using Haversine formula
- Dynamic delivery fee calculation
- Checkout flow with payment method selection
- Mocked payment processing
- Comprehensive widget tests
- Project documentation (README, ARCHITECTURE.md)

### Changed
- Migrated from flat `lib/` structure to layered architecture
- Replaced basic navigation with GetX named routes
- Updated theme to Material 3
- Improved code organization and testability

### Fixed
- Theme configuration compatibility with Flutter 3.1.4+
