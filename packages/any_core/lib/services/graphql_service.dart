import 'dart:convert';
import 'package:get/get.dart';

import 'http_serivce.dart';

class Enum {
  Enum(this.value);
  String value;
}

class GraphQLService extends GetxService {
  static GraphQLService get to => Get.find();

  final String path;

  GraphQLService({this.path = '/graphql'});

  Future<dynamic> query(
    String method, {
    Map<String, dynamic> where = const {},
    Map<String, dynamic> pagination = const {
      'start': 0,
      'sort': 'createdAt:desc',
      'limit': 100,
    },
    List<dynamic> returns = const [],
  }) async {
    try {
      final query = '''
      query $method {
        $method(
          where: { ${_jsonEncode(where)} }
          start: ${pagination['start'] ?? 0},
          sort: "${pagination['sort'] ?? 'createdAt:desc'}",
          limit: ${pagination['limit'] ?? 100}
          ) {
            ${_returnsEncode(returns)}
        }
      }
    ''';
      printInfo(info: query);

      final res = await HttpService.to.post(
        path,
        body: {
          'query': query,
        },
      );

      if (res.data == null || res.data?['errors'] != null) {
        // printError(info: res.body['errors'].toString());
        return [];
      }

      return res.data?['data'][method] ?? [];
    } catch (e, stack) {
      e.printError(info: stack.toString());
      return [];
    }
  }

  Future<dynamic> mutation(
    String method, {
    Map<String, dynamic>? where,
    Map<String, dynamic> body = const {},
    List<dynamic> returns = const [],
  }) async {
    try {
      final mutation = '''
      mutation $method {
        $method(input: { 
          ${where != null ? 'where: { ${_jsonEncode(where)} }' : ''}
          data: {
            ${_jsonEncode(body)}
          }
        }) {
            ${_returnsEncode(returns)}
        }
      }
    ''';
      printInfo(info: mutation);

      final res = await HttpService.to.post(
        path,
        body: {
          'query': mutation,
        },
      ).catchError((e) {
        printError(info: e.toString());
      });

      if (res.data?['errors'] != null) {
        printError(info: res.data!['errors'].toString());
        return null;
      }

      return res.data?['data'][method];
    } catch (e, stack) {
      e.printError(info: stack.toString());
      return null;
    }
  }

  String _jsonEncode(Map<String, dynamic> json) {
    return json.entries
        .where((element) => element.value != null)
        .map(
          (e) =>
              '${e.key}: ${e.value is Enum ? (e.value as Enum).value : e.value is Map ? {
                  _jsonEncode(e.value as Map<String, dynamic>)
                } : jsonEncode(e.value)}',
        )
        .join(', ');
  }

  dynamic _returnsEncode(dynamic value) {
    if (value is Map) {
      return value.keys
          .map((key) => '$key { ${_returnsEncode(value[key])} }')
          .join(' ');
    }
    if (value is Iterable) {
      return value.map((e) => _returnsEncode(e)).join(' ');
    }
    return value;
  }
}
