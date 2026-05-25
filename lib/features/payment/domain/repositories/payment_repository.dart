import 'package:fooood/features/payment/domain/entities/payment_request.dart';

abstract class PaymentRepository {
  Future<String> processPayment(PaymentRequest request);
}
