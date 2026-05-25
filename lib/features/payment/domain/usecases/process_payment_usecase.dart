import 'package:fooood/features/payment/domain/entities/payment_request.dart';
import 'package:fooood/features/payment/domain/repositories/payment_repository.dart';

class ProcessPaymentUseCase {
  ProcessPaymentUseCase(this._repository);

  final PaymentRepository _repository;

  Future<String> call(PaymentRequest request) => _repository.processPayment(request);
}

