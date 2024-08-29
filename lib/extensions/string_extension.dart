import 'dart:convert';

extension StringBody on String {
  Map<String, dynamic>? toMap() {
    final object = jsonDecode(this);
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
