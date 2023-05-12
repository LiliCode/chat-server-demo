class ResponseStatus {
  static Map<String, dynamic> success() {
    return {'status': 'success'};
  }

  static Map<String, dynamic> error({String? description}) {
    return {'status': 'error', 'description': description ?? 'system error'};
  }
}

class ResponseTools {
  final Map<String, dynamic> _res;

  Map<String, dynamic> get response => _res;

  ResponseTools(this._res, {Object? info}) {
    if (info != null) {
      _res['content'] = info;
    }
  }
}
