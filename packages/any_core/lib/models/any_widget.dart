import 'package:json_annotation/json_annotation.dart';

part 'any_widget.g.dart';

@JsonEnum()
enum WidgetNames {
  @JsonValue('column')
  column,
  @JsonValue('text')
  text,
  @JsonValue('list')
  list,
  @JsonValue('datetime')
  datetime,
  @JsonValue('object')
  object,
}

@JsonSerializable()
class AnyWidget {
  AnyWidget({
    required this.name,
    this.options = const {},
  });

  final String name;
  final Map<String, dynamic> options;
}
