import 'package:json_annotation/json_annotation.dart';

part 'any_type.g.dart';

@JsonEnum()
enum Types {
  @JsonValue('number')
  number,
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
class AnyType {
  AnyType({required this.type, this.value});

  final Types type;
  final dynamic value;

  factory AnyType.fromJson(Map<String, dynamic> json) {
    final temp = _$AnyTypeFromJson(json);
    // switch (temp.type) {
    //   case Types.number:

    //     break;
    //   default:
    // }
    return temp;
  }

  Map<String, dynamic> toJson() => _$AnyTypeToJson(this);
}
