import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure(this.message, [this.code]);

  @override
  // TODO: implement props
  List<Object?> get props => [message, code];

  @override
  String toString() {
    // TODO: implement toString
    return "Failure(message: $message,code:$code)";
  }
}

class CacheFailure extends Failure {
  const CacheFailure(String message, [int? code]) : super(message, code);
}

class ServerFailure extends Failure {
  const ServerFailure(String message, [int? code]) : super(message, code);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message, [int? code]) : super(message, code);
}
