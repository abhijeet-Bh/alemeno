import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class DeviceFailure extends Failure {
  final int? statusCode;
  const DeviceFailure({
    required super.message,
    required this.statusCode,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
  });
}
