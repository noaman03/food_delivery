import 'package:get/get.dart';

import 'package:fooood/features/payment/domain/entities/payment_method.dart';
import 'package:fooood/features/payment/domain/entities/payment_request.dart';
import 'package:fooood/features/payment/domain/usecases/process_payment_usecase.dart';

class PaymentController extends GetxController {
  PaymentController(this._processPaymentUseCase);

  final ProcessPaymentUseCase _processPaymentUseCase;
  final selectedMethod = PaymentMethod.card.obs;
  final isLoading = false.obs;
  final latestResult = RxnString();

  Future<void> process(PaymentRequest request) async {
    isLoading.value = true;
    latestResult.value = null;
    final result = await _processPaymentUseCase.call(request);
    latestResult.value = result;
    isLoading.value = false;
  }
}
