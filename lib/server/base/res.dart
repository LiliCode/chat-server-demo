import 'dart:convert';

/// 返回值的状态
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

/// 返回结果的数据结构
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

  /// 转换成字典
  Map<String, dynamic> toJson() {
    final dict = <String, dynamic>{};
    dict['status'] = status.value;
    if (reason != null) dict['reason'] = reason;
    if (data != null) dict['data'] = data;

    return dict;
  }

  @override
  String toString() => jsonEncode(toJson());
}
