import 'package:fooood/features/payment/domain/entities/payment_method.dart';

class PaymentRequest {
  const PaymentRequest({
    required this.subtotal,
    required this.deliveryFee,
    required this.method,
    required this.deliveryAddress,
  });

  final double subtotal;
  final double deliveryFee;
  final PaymentMethod method;
  final String deliveryAddress;

  double get total => subtotal + deliveryFee;
}

