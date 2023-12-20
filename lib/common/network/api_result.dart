import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exception.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.success({required T data}) = Success<T>;

  factory ApiResult.failure({required NetworkExceptions error}) = Failure<T>;
}
