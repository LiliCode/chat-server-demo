import 'dart:convert';

enum ResStatus {
  success('success'),
  error('error');

  final String value;

  const ResStatus(this.value);

  static ResStatus from(String value) => values.firstWhere((e) => e.value == value);
}

class ResponseData<T> {
  final ResStatus status;
  final String? reason;
  final T? data;

  ResponseData(this.status, {this.reason, this.data});

  ResponseData.success({T? d}) : this(ResStatus.success, data: d);

  ResponseData.error(String? reason) : this(ResStatus.error, reason: reason);

  ResponseData.noImplement() : this(ResStatus.error, reason: '方法未实现');

  ResponseData.fromJson(Map<String, dynamic>? json)
      : this(
          ResStatus.from(json?['status']),
          reason: json?['reason'],
          data: json?['data'] as T,
        );

  Map<String, dynamic> toMap() =>
      {'status': status.value, 'reason': reason, 'data': data};

  @override
  String toString() => jsonEncode(toMap());
}
