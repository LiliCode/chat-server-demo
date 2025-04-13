import 'dart:convert';

enum ResStatus {
  success('success'),
  error('error'),
  noImplement('noImplement'),
  exception('exception');

  final String value;

  const ResStatus(this.value);

  static ResStatus from(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResStatus.noImplement);
}

class ResultData<T> {
  final ResStatus status;
  final String? reason;
  final T? data;

  ResultData(this.status, {this.reason, this.data});

  ResultData.success(T? d) : this(ResStatus.success, data: d);

  ResultData.error(String? reason) : this(ResStatus.error, reason: reason);

  ResultData.noImplement() : this(ResStatus.noImplement, reason: '方法未实现');

  ResultData.exception({String? reason})
      : this(ResStatus.exception, reason: reason);

  ResultData.fromJson(Map<String, dynamic>? json)
      : this(
          ResStatus.from(json?['status']),
          reason: json?['reason'],
          data: json?['data'] as T,
        );

  Map<String, dynamic> toJson() =>
      {'status': status.value, 'reason': reason, 'data': data};

  @override
  String toString() => jsonEncode(toJson());
}
