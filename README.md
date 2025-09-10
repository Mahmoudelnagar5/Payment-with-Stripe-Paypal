# 🛒 Checkout Payment UI

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://dart.dev/)
[![Stripe](https://img.shields.io/badge/Stripe-626CD9?style=flat&logo=stripe&logoColor=white)](https://stripe.com/)
[![PayPal](https://img.shields.io/badge/PayPal-00457C?style=flat&logo=paypal&logoColor=white)](https://paypal.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern, secure, and user-friendly Flutter application for handling checkout and payment processing integrations with Stripe and PayPal.

## 📋 Table of Contents

- [🚀 Features](#features)
- [🛠️ Technologies Used](#technologies-used)
- [🏗️ Architecture](#architecture)
- [📦 Installation](#installation)
- [⚙️ Configuration](#configuration)
- [📱 Usage](#usage)
- [📁 Project Structure](#project-structure)
- [🧪 Testing](#testing)
- [🤝 Contributing](#contributing)
- [📄 License](#license)

## 🚀 Features

- 💳 **Multi-Payment Gateway Support**: Seamless integration with Stripe and PayPal
- 🎨 **Modern UI/UX**: Beautiful, responsive design with intuitive user experience
- 🔐 **Secure Payment Processing**: Industry-standard security practices
- 📱 **Cross-Platform**: Works on iOS, Android, Web, Windows, macOS, and Linux
- 💼 **Business Logic**: Clean BLoC pattern architecture for maintainable code
- 🎯 **Custom Payment Components**: Reusable credit card widgets and payment method items
- 🌙 **Dark Mode Support**: Built-in dark theme for Stripe payment sheets
- 📊 **State Management**: Robust state management with Flutter BLoC
- 🔧 **Easy Configuration**: Simple API key setup for payment gateways
- ✅ **Payment Confirmation**: Comprehensive thank you and confirmation screens

## 🛠️ Technologies Used

### Core Framework
- **Flutter** ^3.9.0 - UI framework
- **Dart** ^3.9.0 - Programming language

### Payment Integrations
- **flutter_stripe** ^12.0.2 - Stripe payment integration
- **flutter_paypal_payment** ^1.0.8 - PayPal payment processing
- **flutter_credit_card** ^4.1.0 - Credit card UI components

### Architecture & State Management
- **flutter_bloc** ^9.1.1 - State management pattern
- **dartz** ^0.10.1 - Functional programming utilities

### HTTP & Network
- **dio** ^5.9.0 - HTTP client for API communications

### UI & Design
- **flutter_svg** ^2.2.1 - SVG image support
- **font_awesome_flutter** ^10.10.0 - Icon library
- **cupertino_icons** ^1.0.8 - iOS-style icons
- **device_preview** ^1.3.1 - Multi-device preview during development

### Development
- **flutter_lints** ^5.0.0 - Linting rules
- **flutter_test** ^flutter-test+0.0.0 - Unit testing framework

## 🏗️ Architecture

This project follows Clean Architecture principles combined with the BLoC pattern:

```
lib/
├── core/                    # Core layer (entities, use cases, utilities)
│   ├── errors/             # Error handling
│   ├── utils/              # Utility classes and services
│   │   ├── api_keys.dart   # API key management
│   │   ├── api_service.dart # HTTP service layer
│   │   ├── stripe_service.dart # Stripe payment service
│   │   └── styles.dart     # App styling constants
│   ├── widgets/            # Shared UI components
│   └── functions/          # Core business logic functions
├── Features/               # Feature-based organization
│   └── checkout/           # Checkout feature module
│       ├── data/           # Data layer
│       │   ├── models/     # Data models
│       │   │   ├── amount_model/
│       │   │   ├── ephemeral_key_model/
│       │   │   ├── init_payment_sheet_input_model.dart
│       │   │   ├── payment_intent_model/
│       │   │   └── payment_intent_input_model.dart
│       │   └── repos/      # Repository implementations
│       ├── presentation/   # Presentation layer
│       │   ├── manager/    # BLoC state management
│       │   │   └── cubit/
│       │   │       ├── payment_cubit.dart
│       │   │       └── payment_state.dart
│       │   └── views/      # UI screens
└── main.dart               # Application entry point
```

**Architecture Flow:**
1. **UI Layer** → Triggers payment events
2. **BLoC Layer** → Manages state and business logic
3. **Repository Layer** → Handles data operations
4. **Service Layer** → External API communications (Stripe, PayPal)
5. **Model Layer** → Data structures and DTOs

## 📦 Installation

### Prerequisites

- **Flutter** (3.9.0 or higher) - [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Dart** (3.9.0 or higher) - Included with Flutter
- **Android Studio** / **Xcode** / **VS Code** for development

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/checkout_payment_ui.git
   cd checkout_payment_ui
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

**For Android:**
- Ensure Android SDK API level 21 or higher
- Configure your Android device/emulator

**For iOS:**
- Xcode 12 or later required
- Run `pod install` in the ios directory if needed

**For Web:**
- Chrome browser for development
- Run `flutter run -d chrome`

## ⚙️ Configuration

### API Keys Setup

⚠️ **Important**: Never commit real API keys to version control. Use environment variables or secure configuration management.

#### Stripe Configuration

1. Create a `.env` file in the project root:
   ```env
   STRIPE_PUBLISHABLE_KEY=pk_test_your_publishable_key_here
   STRIPE_SECRET_KEY=sk_test_your_secret_key_here
   ```

2. Update `lib/core/utils/api_keys.dart`:
   ```dart
   class ApiKeys {
     static const String publishableKey = String.fromEnvironment(
       'STRIPE_PUBLISHABLE_KEY',
       defaultValue: 'pk_test_your_publishable_key_here',
     );

     static const String secretKey = String.fromEnvironment(
       'STRIPE_SECRET_KEY',
       defaultValue: 'sk_test_your_secret_key_here',
     );
   }
   ```

3. Update pubspec.yaml to handle environment variables:
   ```yaml
   dependencies:
     flutter_dotenv: ^5.1.0

   flutter:
     assets:
       - .env
   ```

#### PayPal Configuration

Update the PayPal keys in `lib/core/utils/api_keys.dart`:

```dart
class ApiKeys {
  // ... existing keys

  static const String paypalClientId = String.fromEnvironment(
    'PAYPAL_CLIENT_ID',
    defaultValue: 'your_paypal_client_id_here',
  );

  static const String paypalSecretKey = String.fromEnvironment(
    'PAYPAL_SECRET_KEY',
    defaultValue: 'your_paypal_secret_key_here',
  );
}
```

### Environment Variables Setup

Add to your `.env` file:
```env
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_SECRET_KEY=your_paypal_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_key
STRIPE_SECRET_KEY=sk_test_your_key
```

## 📱 Usage

### Basic Payment Flow

The app follows a standard e-commerce checkout flow:

1. **My Cart View** (`MyCartView`): Display cart items, pricing, and checkout button
2. **Payment Details View** (`PaymentDetails`): Collect payment information
3. **Thank You View** (`ThankYouView`): Show payment confirmation

### Payment Integration

#### Stripe Payment Flow

```dart
// Example: Creating a payment intent
final stripeService = StripeService();
final paymentIntent = await stripeService.createPaymentIntent(
  PaymentIntentInputModel(
    amount: '1000', // Amount in cents
    currency: 'usd',
    customerId: 'cus_xxx',
  ),
);

// Initialize payment sheet
await stripeService.initPaymentSheet(
  initPaymentSheetInputModel: InitPaymentSheetInputModel(
    clientSecret: paymentIntent.clientSecret!,
    customerId: 'cus_xxx',
    ephemeralKeySecret: ephemeralKey.secret!,
  ),
);

// Present payment sheet
await stripeService.displayPaymentSheet();
```

#### Screen Navigation

```dart
// Navigate to payment details
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const PaymentDetails()),
);

// Navigate to thank you page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ThankYouView()),
);
```

### Screenshots

| My Cart Screen | Payment Details | Thank You Page |
|---|---|---|
| ![My Cart](screenshots/cart_screen.png) | ![Payment Details](screenshots/payment_screen.png) | ![Thank You](screenshots/thank_you_screen.png) |

*Add screenshots to `screenshots/` directory to display them properly*

## 📁 Project Structure

```
checkout_payment_ui/
├── android/                 # Android platform code
├── ios/                    # iOS platform code
├── linux/                  # Linux platform code
├── macos/                  # macOS platform code
├── web/                    # Web platform code
├── windows/                # Windows platform code
├── lib/                    # Flutter application code
│   ├── core/              # Shared core functionality
│   │   ├── errors/        # Error handling (failures.dart)
│   │   ├── utils/         # Utilities and services
│   │   └── widgets/       # Reusable UI components
│   ├── Features/          # Feature modules
│   │   └── checkout/      # Checkout payment feature
│   │       ├── data/      # Data layer (repositories, models)
│   │       ├── presentation/ # Presentation layer (UI, BLoC)
│   │       │   ├── manager/# State management (Cubit, State)
│   │       │   └── views/ # UI screens and widgets
│   │       └── domain/    # Business logic (use cases, entities)
│   └── main.dart          # App entry point
├── assets/                 # Static assets
│   └── images/            # SVG icons and images
├── test/                  # Unit and widget tests
├── pubspec.yaml           # Flutter dependencies and configuration
├── analysis_options.yaml  # Dart/Flutter analysis configuration
└── README.md             # Project documentation
```

## 🧪 Testing

Run tests using Flutter's built-in testing framework:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/payment_cubit_test.dart
```

The project includes tests for:
- Payment cubit state management
- API service layer functionality
- UI widget interactions
- Payment flow validation

## 🤝 Contributing

We welcome contributions! Please follow these steps:

### Development Workflow

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Add tests for new functionality**
5. **Ensure all tests pass**
   ```bash
   flutter test
   ```
6. **Format your code**
   ```bash
   flutter format .
   ```
7. **Analyze code quality**
   ```bash
   flutter analyze
   ```
8. **Update documentation if needed**
9. **Commit your changes**
   ```bash
   git commit -m "feat: add your feature description"
   ```
10. **Push to your fork**
    ```bash
     git push origin feature/your-feature-name
    ```
11. **Create a Pull Request**

### Code Standards

- Follow [Dart's effective Dart guidelines](https://dart.dev/effective-dart)
- Use meaningful variable and function names
- Add documentation comments for public APIs
- Keep functions small and focused
- Follow the established BLoC pattern structure

### Commit Convention

This project uses [Conventional Commits](https://conventionalcommits.org/):

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation updates
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

### Issues and Feature Requests

- Use GitHub Issues to report bugs
- Clearly describe the issue and include steps to reproduce
- Provide screenshots for UI-related issues
- Suggest improvements with detailed descriptions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Third-Party Licenses

This application uses the following third-party services:

- **Stripe Payment Processing** - Subject to Stripe's Terms of Service
- **PayPal Payment Processing** - Subject to PayPal's Terms of Service

---

**Built with ❤️ using Flutter**

⭐ Star this repo if you found it helpful!

For questions or support, please open an issue or contact the maintainers.
