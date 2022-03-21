// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetTodoCollection on Isar {
  IsarCollection<Todo> get todos {
    return getCollection('Todo');
  }
}

final TodoSchema = CollectionSchema(
  name: 'Todo',
  schema:
      '{"name":"Todo","idName":"id","properties":[{"name":"hashCode","type":"Long"},{"name":"memo","type":"String"},{"name":"stringify","type":"Bool"},{"name":"title","type":"String"},{"name":"url","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _TodoNativeAdapter(),
  webAdapter: const _TodoWebAdapter(),
  idName: 'id',
  propertyIds: {'hashCode': 0, 'memo': 1, 'stringify': 2, 'title': 3, 'url': 4},
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: null,
  getLinks: (obj) => [],
  version: 2,
);

class _TodoWebAdapter extends IsarWebTypeAdapter<Todo> {
  const _TodoWebAdapter();

  @override
  Object serialize(IsarCollection<Todo> collection, Todo object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'memo', object.memo);
    IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
    IsarNative.jsObjectSet(jsObj, 'title', object.title);
    IsarNative.jsObjectSet(jsObj, 'url', object.url);
    return jsObj;
  }

  @override
  Todo deserialize(IsarCollection<Todo> collection, dynamic jsObj) {
    final object = Todo(
      id: IsarNative.jsObjectGet(jsObj, 'id'),
      memo: IsarNative.jsObjectGet(jsObj, 'memo') ?? '',
      title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
      url: IsarNative.jsObjectGet(jsObj, 'url') ?? '',
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'hashCode':
        return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'memo':
        return (IsarNative.jsObjectGet(jsObj, 'memo') ?? '') as P;
      case 'stringify':
        return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
      case 'title':
        return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
      case 'url':
        return (IsarNative.jsObjectGet(jsObj, 'url') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Todo object) {}
}

class _TodoNativeAdapter extends IsarNativeTypeAdapter<Todo> {
  const _TodoNativeAdapter();

  @override
  void serialize(IsarCollection<Todo> collection, IsarRawObject rawObj,
      Todo object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.hashCode;
    final _hashCode = value0;
    final value1 = object.memo;
    final _memo = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_memo.length) as int;
    final value2 = object.stringify;
    final _stringify = value2;
    final value3 = object.title;
    final _title = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_title.length) as int;
    final value4 = object.url;
    final _url = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_url.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _hashCode);
    writer.writeBytes(offsets[1], _memo);
    writer.writeBool(offsets[2], _stringify);
    writer.writeBytes(offsets[3], _title);
    writer.writeBytes(offsets[4], _url);
  }

  @override
  Todo deserialize(IsarCollection<Todo> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Todo(
      id: id,
      memo: reader.readString(offsets[1]),
      title: reader.readString(offsets[3]),
      url: reader.readString(offsets[4]),
    );
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLong(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readBoolOrNull(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Todo object) {}
}

extension TodoQueryWhereSort on QueryBuilder<Todo, Todo, QWhere> {
  QueryBuilder<Todo, Todo, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension TodoQueryWhere on QueryBuilder<Todo, Todo, QWhereClause> {
  QueryBuilder<Todo, Todo, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension TodoQueryFilter on QueryBuilder<Todo, Todo, QFilterCondition> {
  QueryBuilder<Todo, Todo, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'memo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> memoMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'memo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TodoQueryLinks on QueryBuilder<Todo, Todo, QFilterCondition> {}

extension TodoQueryWhereSortBy on QueryBuilder<Todo, Todo, QSortBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByMemo() {
    return addSortByInternal('memo', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByMemoDesc() {
    return addSortByInternal('memo', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension TodoQueryWhereSortThenBy on QueryBuilder<Todo, Todo, QSortThenBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByMemo() {
    return addSortByInternal('memo', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByMemoDesc() {
    return addSortByInternal('memo', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension TodoQueryWhereDistinct on QueryBuilder<Todo, Todo, QDistinct> {
  QueryBuilder<Todo, Todo, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('memo', caseSensitive: caseSensitive);
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension TodoQueryProperty on QueryBuilder<Todo, Todo, QQueryProperty> {
  QueryBuilder<Todo, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Todo, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Todo, String, QQueryOperations> memoProperty() {
    return addPropertyNameInternal('memo');
  }

  QueryBuilder<Todo, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<Todo, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Todo, String, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}
