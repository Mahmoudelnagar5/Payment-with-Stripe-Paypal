import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'Features/checkout/presentation/views/my_cart_view.dart';
import 'core/utils/api_keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;

  runApp(
    DevicePreview(enabled: false, builder: (context) => const CheckoutApp()),
  );
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// PaymentIntentModel create payment intent(amount , currency , customerId)
// keySecret createEphemeralKey(customerId)
// initPaymentSheet (merchantDisplayName , intentClientSecret , ephemeralKeySecret)
// presentPaymentSheet()
