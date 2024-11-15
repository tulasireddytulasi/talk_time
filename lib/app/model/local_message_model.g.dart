// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_message_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalMessageModelCollection on Isar {
  IsarCollection<LocalMessageModel> get localMessageModels => this.collection();
}

const LocalMessageModelSchema = CollectionSchema(
  name: r'LocalMessageModel',
  id: -3755124595844361002,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'filePath': PropertySchema(
      id: 1,
      name: r'filePath',
      type: IsarType.string,
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    ),
    r'receiverId': PropertySchema(
      id: 3,
      name: r'receiverId',
      type: IsarType.string,
    ),
    r'senderId': PropertySchema(
      id: 4,
      name: r'senderId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
      enumMap: _LocalMessageModelstatusEnumValueMap,
    ),
    r'widgetTypeName': PropertySchema(
      id: 6,
      name: r'widgetTypeName',
      type: IsarType.string,
    )
  },
  estimateSize: _localMessageModelEstimateSize,
  serialize: _localMessageModelSerialize,
  deserialize: _localMessageModelDeserialize,
  deserializeProp: _localMessageModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localMessageModelGetId,
  getLinks: _localMessageModelGetLinks,
  attach: _localMessageModelAttach,
  version: '3.1.0+1',
);

int _localMessageModelEstimateSize(
  LocalMessageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filePath.length * 3;
  bytesCount += 3 + object.message.length * 3;
  bytesCount += 3 + object.receiverId.length * 3;
  bytesCount += 3 + object.senderId.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.widgetTypeName.length * 3;
  return bytesCount;
}

void _localMessageModelSerialize(
  LocalMessageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.filePath);
  writer.writeString(offsets[2], object.message);
  writer.writeString(offsets[3], object.receiverId);
  writer.writeString(offsets[4], object.senderId);
  writer.writeString(offsets[5], object.status.name);
  writer.writeString(offsets[6], object.widgetTypeName);
}

LocalMessageModel _localMessageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalMessageModel();
  object.date = reader.readDateTime(offsets[0]);
  object.filePath = reader.readString(offsets[1]);
  object.id = id;
  object.message = reader.readString(offsets[2]);
  object.receiverId = reader.readString(offsets[3]);
  object.senderId = reader.readString(offsets[4]);
  object.status = _LocalMessageModelstatusValueEnumMap[
          reader.readStringOrNull(offsets[5])] ??
      MessStatus.sent;
  object.widgetTypeName = reader.readString(offsets[6]);
  return object;
}

P _localMessageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_LocalMessageModelstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MessStatus.sent) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocalMessageModelstatusEnumValueMap = {
  r'sent': r'sent',
  r'notSent': r'notSent',
  r'seen': r'seen',
};
const _LocalMessageModelstatusValueEnumMap = {
  r'sent': MessStatus.sent,
  r'notSent': MessStatus.notSent,
  r'seen': MessStatus.seen,
};

Id _localMessageModelGetId(LocalMessageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localMessageModelGetLinks(
    LocalMessageModel object) {
  return [];
}

void _localMessageModelAttach(
    IsarCollection<dynamic> col, Id id, LocalMessageModel object) {
  object.id = id;
}

extension LocalMessageModelQueryWhereSort
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QWhere> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalMessageModelQueryWhere
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QWhereClause> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalMessageModelQueryFilter
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QFilterCondition> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      filePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      receiverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      senderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusEqualTo(
    MessStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusGreaterThan(
    MessStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusLessThan(
    MessStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusBetween(
    MessStatus lower,
    MessStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widgetTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'widgetTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'widgetTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterFilterCondition>
      widgetTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'widgetTypeName',
        value: '',
      ));
    });
  }
}

extension LocalMessageModelQueryObject
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QFilterCondition> {}

extension LocalMessageModelQueryLinks
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QFilterCondition> {}

extension LocalMessageModelQuerySortBy
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QSortBy> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByWidgetTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTypeName', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      sortByWidgetTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTypeName', Sort.desc);
    });
  }
}

extension LocalMessageModelQuerySortThenBy
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QSortThenBy> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByWidgetTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTypeName', Sort.asc);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QAfterSortBy>
      thenByWidgetTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetTypeName', Sort.desc);
    });
  }
}

extension LocalMessageModelQueryWhereDistinct
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct> {
  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByFilePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByReceiverId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctBySenderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalMessageModel, LocalMessageModel, QDistinct>
      distinctByWidgetTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetTypeName',
          caseSensitive: caseSensitive);
    });
  }
}

extension LocalMessageModelQueryProperty
    on QueryBuilder<LocalMessageModel, LocalMessageModel, QQueryProperty> {
  QueryBuilder<LocalMessageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalMessageModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<LocalMessageModel, String, QQueryOperations> filePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filePath');
    });
  }

  QueryBuilder<LocalMessageModel, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<LocalMessageModel, String, QQueryOperations>
      receiverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverId');
    });
  }

  QueryBuilder<LocalMessageModel, String, QQueryOperations> senderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderId');
    });
  }

  QueryBuilder<LocalMessageModel, MessStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocalMessageModel, String, QQueryOperations>
      widgetTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetTypeName');
    });
  }
}
