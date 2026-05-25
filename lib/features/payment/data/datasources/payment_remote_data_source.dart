import 'dart:math';

import 'package:fooood/features/payment/domain/entities/payment_method.dart';
import 'package:fooood/features/payment/domain/entities/payment_request.dart';

class PaymentRemoteDataSource {
  Future<String> processPayment(PaymentRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final random = Random();
    final code = 100000 + random.nextInt(899999);
    final methodLabel = switch (request.method) {
      PaymentMethod.card => 'Card',
      PaymentMethod.cash => 'Cash',
      PaymentMethod.wallet => 'Wallet',
    };
    return '$methodLabel payment approved. TXN-$code';
  }
}

