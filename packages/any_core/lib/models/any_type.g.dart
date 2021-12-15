// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'any_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnyType _$AnyTypeFromJson(Map<String, dynamic> json) => AnyType(
      type: $enumDecode(_$TypesEnumMap, json['type']),
      value: json['value'],
    );

Map<String, dynamic> _$AnyTypeToJson(AnyType instance) => <String, dynamic>{
      'type': _$TypesEnumMap[instance.type],
      'value': instance.value,
    };

const _$TypesEnumMap = {
  Types.number: 'number',
  Types.text: 'text',
  Types.list: 'list',
  Types.datetime: 'datetime',
  Types.object: 'object',
};
