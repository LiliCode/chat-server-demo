import 'dart:convert';

extension StringBody on String {
  Map<String, dynamic>? toMap() {
    dynamic object;
    try {
      object = jsonDecode(this);
    } catch (e) {
      print('解析出错: $e');
    }

    if (object != null) {
      return object.cast<String, dynamic>();
    }

    if (contains('=')) {
      final params = <String, dynamic>{};
      split('&').forEach((e) {
        final query = e.split('=');
        if (query.length == 2) {
          params[query.first] = query.last;
        }
      });

      return params;
    }

    return null;
  }
}
