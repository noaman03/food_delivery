import 'package:fooood/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:fooood/features/payment/domain/entities/payment_request.dart';
import 'package:fooood/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl(this._remoteDataSource);

  final PaymentRemoteDataSource _remoteDataSource;

  @override
  Future<String> processPayment(PaymentRequest request) {
    return _remoteDataSource.processPayment(request);
  }
}

