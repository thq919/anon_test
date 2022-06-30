import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errmsg;
  const Failure(this.errmsg);
  @override
  List<Object> get props => [errmsg];
}

class ServerFailure extends Failure {
  const ServerFailure(errmsg) : super(errmsg);
}

class DatabaseFailure extends Failure {
 const DatabaseFailure(errmsg) : super(errmsg);
}
