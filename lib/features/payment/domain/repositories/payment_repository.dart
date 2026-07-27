import 'package:food_delivery_app/features/payment/domain/entities/payment_request.dart';

abstract class PaymentRepository {
  Future<String> processPayment(PaymentRequest request);
}
