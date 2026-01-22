// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BrandsTable extends Brands with TableInfo<$BrandsTable, Brand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionFrMeta = const VerificationMeta(
    'descriptionFr',
  );
  @override
  late final GeneratedColumn<String> descriptionFr = GeneratedColumn<String>(
    'description_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionEnMeta = const VerificationMeta(
    'descriptionEn',
  );
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
    'description_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    descriptionFr,
    descriptionEn,
    logoUrl,
    iconUrl,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brands';
  @override
  VerificationContext validateIntegrity(
    Insertable<Brand> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description_fr')) {
      context.handle(
        _descriptionFrMeta,
        descriptionFr.isAcceptableOrUnknown(
          data['description_fr']!,
          _descriptionFrMeta,
        ),
      );
    }
    if (data.containsKey('description_en')) {
      context.handle(
        _descriptionEnMeta,
        descriptionEn.isAcceptableOrUnknown(
          data['description_en']!,
          _descriptionEnMeta,
        ),
      );
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Brand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Brand(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      descriptionFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_fr'],
      ),
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $BrandsTable createAlias(String alias) {
    return $BrandsTable(attachedDatabase, alias);
  }
}

class Brand extends DataClass implements Insertable<Brand> {
  final String id;
  final String name;
  final String? descriptionFr;
  final String? descriptionEn;
  final String? logoUrl;
  final String? iconUrl;
  final DateTime? createdAt;
  const Brand({
    required this.id,
    required this.name,
    this.descriptionFr,
    this.descriptionEn,
    this.logoUrl,
    this.iconUrl,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || descriptionFr != null) {
      map['description_fr'] = Variable<String>(descriptionFr);
    }
    if (!nullToAbsent || descriptionEn != null) {
      map['description_en'] = Variable<String>(descriptionEn);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || iconUrl != null) {
      map['icon_url'] = Variable<String>(iconUrl);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  BrandsCompanion toCompanion(bool nullToAbsent) {
    return BrandsCompanion(
      id: Value(id),
      name: Value(name),
      descriptionFr: descriptionFr == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionFr),
      descriptionEn: descriptionEn == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionEn),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      iconUrl: iconUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(iconUrl),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Brand.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Brand(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      descriptionFr: serializer.fromJson<String?>(json['descriptionFr']),
      descriptionEn: serializer.fromJson<String?>(json['descriptionEn']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      iconUrl: serializer.fromJson<String?>(json['iconUrl']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'descriptionFr': serializer.toJson<String?>(descriptionFr),
      'descriptionEn': serializer.toJson<String?>(descriptionEn),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'iconUrl': serializer.toJson<String?>(iconUrl),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  Brand copyWith({
    String? id,
    String? name,
    Value<String?> descriptionFr = const Value.absent(),
    Value<String?> descriptionEn = const Value.absent(),
    Value<String?> logoUrl = const Value.absent(),
    Value<String?> iconUrl = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
  }) => Brand(
    id: id ?? this.id,
    name: name ?? this.name,
    descriptionFr: descriptionFr.present
        ? descriptionFr.value
        : this.descriptionFr,
    descriptionEn: descriptionEn.present
        ? descriptionEn.value
        : this.descriptionEn,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    iconUrl: iconUrl.present ? iconUrl.value : this.iconUrl,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  Brand copyWithCompanion(BrandsCompanion data) {
    return Brand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      descriptionFr: data.descriptionFr.present
          ? data.descriptionFr.value
          : this.descriptionFr,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    descriptionFr,
    descriptionEn,
    logoUrl,
    iconUrl,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brand &&
          other.id == this.id &&
          other.name == this.name &&
          other.descriptionFr == this.descriptionFr &&
          other.descriptionEn == this.descriptionEn &&
          other.logoUrl == this.logoUrl &&
          other.iconUrl == this.iconUrl &&
          other.createdAt == this.createdAt);
}

class BrandsCompanion extends UpdateCompanion<Brand> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> descriptionFr;
  final Value<String?> descriptionEn;
  final Value<String?> logoUrl;
  final Value<String?> iconUrl;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BrandsCompanion.insert({
    required String id,
    required String name,
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Brand> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? descriptionFr,
    Expression<String>? descriptionEn,
    Expression<String>? logoUrl,
    Expression<String>? iconUrl,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (descriptionFr != null) 'description_fr': descriptionFr,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BrandsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? descriptionFr,
    Value<String?>? descriptionEn,
    Value<String?>? logoUrl,
    Value<String?>? iconUrl,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      descriptionFr: descriptionFr ?? this.descriptionFr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      logoUrl: logoUrl ?? this.logoUrl,
      iconUrl: iconUrl ?? this.iconUrl,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (descriptionFr.present) {
      map['description_fr'] = Variable<String>(descriptionFr.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameFrMeta = const VerificationMeta('nameFr');
  @override
  late final GeneratedColumn<String> nameFr = GeneratedColumn<String>(
    'name_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [slug, nameFr, nameEn, color, iconUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name_fr')) {
      context.handle(
        _nameFrMeta,
        nameFr.isAcceptableOrUnknown(data['name_fr']!, _nameFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameFrMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slug};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      nameFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_fr'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String slug;
  final String nameFr;
  final String? nameEn;
  final String? color;
  final String? iconUrl;
  const Category({
    required this.slug,
    required this.nameFr,
    this.nameEn,
    this.color,
    this.iconUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['slug'] = Variable<String>(slug);
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || iconUrl != null) {
      map['icon_url'] = Variable<String>(iconUrl);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      slug: Value(slug),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      iconUrl: iconUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(iconUrl),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      slug: serializer.fromJson<String>(json['slug']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      color: serializer.fromJson<String?>(json['color']),
      iconUrl: serializer.fromJson<String?>(json['iconUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'slug': serializer.toJson<String>(slug),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'color': serializer.toJson<String?>(color),
      'iconUrl': serializer.toJson<String?>(iconUrl),
    };
  }

  Category copyWith({
    String? slug,
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> color = const Value.absent(),
    Value<String?> iconUrl = const Value.absent(),
  }) => Category(
    slug: slug ?? this.slug,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    color: color.present ? color.value : this.color,
    iconUrl: iconUrl.present ? iconUrl.value : this.iconUrl,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      slug: data.slug.present ? data.slug.value : this.slug,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      color: data.color.present ? data.color.value : this.color,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('slug: $slug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('color: $color, ')
          ..write('iconUrl: $iconUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(slug, nameFr, nameEn, color, iconUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.slug == this.slug &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn &&
          other.color == this.color &&
          other.iconUrl == this.iconUrl);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> slug;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<String?> color;
  final Value<String?> iconUrl;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.slug = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.color = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String slug,
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.color = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : slug = Value(slug),
       nameFr = Value(nameFr);
  static Insertable<Category> custom({
    Expression<String>? slug,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<String>? color,
    Expression<String>? iconUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (slug != null) 'slug': slug,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (color != null) 'color': color,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? slug,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<String?>? color,
    Value<String?>? iconUrl,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      slug: slug ?? this.slug,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      color: color ?? this.color,
      iconUrl: iconUrl ?? this.iconUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('slug: $slug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('color: $color, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FormsTable extends Forms with TableInfo<$FormsTable, Form> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameFrMeta = const VerificationMeta('nameFr');
  @override
  late final GeneratedColumn<String> nameFr = GeneratedColumn<String>(
    'name_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [slug, nameFr, nameEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'forms';
  @override
  VerificationContext validateIntegrity(
    Insertable<Form> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name_fr')) {
      context.handle(
        _nameFrMeta,
        nameFr.isAcceptableOrUnknown(data['name_fr']!, _nameFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameFrMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slug};
  @override
  Form map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Form(
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      nameFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_fr'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
    );
  }

  @override
  $FormsTable createAlias(String alias) {
    return $FormsTable(attachedDatabase, alias);
  }
}

class Form extends DataClass implements Insertable<Form> {
  final String slug;
  final String nameFr;
  final String? nameEn;
  const Form({required this.slug, required this.nameFr, this.nameEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['slug'] = Variable<String>(slug);
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    return map;
  }

  FormsCompanion toCompanion(bool nullToAbsent) {
    return FormsCompanion(
      slug: Value(slug),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
    );
  }

  factory Form.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Form(
      slug: serializer.fromJson<String>(json['slug']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'slug': serializer.toJson<String>(slug),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
    };
  }

  Form copyWith({
    String? slug,
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
  }) => Form(
    slug: slug ?? this.slug,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
  );
  Form copyWithCompanion(FormsCompanion data) {
    return Form(
      slug: data.slug.present ? data.slug.value : this.slug,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Form(')
          ..write('slug: $slug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(slug, nameFr, nameEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Form &&
          other.slug == this.slug &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn);
}

class FormsCompanion extends UpdateCompanion<Form> {
  final Value<String> slug;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<int> rowid;
  const FormsCompanion({
    this.slug = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FormsCompanion.insert({
    required String slug,
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : slug = Value(slug),
       nameFr = Value(nameFr);
  static Insertable<Form> custom({
    Expression<String>? slug,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (slug != null) 'slug': slug,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FormsCompanion copyWith({
    Value<String>? slug,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<int>? rowid,
  }) {
    return FormsCompanion(
      slug: slug ?? this.slug,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormsCompanion(')
          ..write('slug: $slug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameFrMeta = const VerificationMeta('nameFr');
  @override
  late final GeneratedColumn<String> nameFr = GeneratedColumn<String>(
    'name_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nameFr, nameEn, iconUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_fr')) {
      context.handle(
        _nameFrMeta,
        nameFr.isAcceptableOrUnknown(data['name_fr']!, _nameFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameFrMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nameFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_fr'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      ),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final String nameFr;
  final String? nameEn;
  final String? iconUrl;
  const Tag({
    required this.id,
    required this.nameFr,
    this.nameEn,
    this.iconUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || iconUrl != null) {
      map['icon_url'] = Variable<String>(iconUrl);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      iconUrl: iconUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(iconUrl),
    );
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      iconUrl: serializer.fromJson<String?>(json['iconUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'iconUrl': serializer.toJson<String?>(iconUrl),
    };
  }

  Tag copyWith({
    String? id,
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> iconUrl = const Value.absent(),
  }) => Tag(
    id: id ?? this.id,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    iconUrl: iconUrl.present ? iconUrl.value : this.iconUrl,
  );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('iconUrl: $iconUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameFr, nameEn, iconUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn &&
          other.iconUrl == this.iconUrl);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<String?> iconUrl;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nameFr = Value(nameFr);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<String>? iconUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<String?>? iconUrl,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      iconUrl: iconUrl ?? this.iconUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CertificationsTable extends Certifications
    with TableInfo<$CertificationsTable, Certification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CertificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameFrMeta = const VerificationMeta('nameFr');
  @override
  late final GeneratedColumn<String> nameFr = GeneratedColumn<String>(
    'name_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nameFr, nameEn, logoUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'certifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Certification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_fr')) {
      context.handle(
        _nameFrMeta,
        nameFr.isAcceptableOrUnknown(data['name_fr']!, _nameFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameFrMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Certification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Certification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nameFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_fr'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
    );
  }

  @override
  $CertificationsTable createAlias(String alias) {
    return $CertificationsTable(attachedDatabase, alias);
  }
}

class Certification extends DataClass implements Insertable<Certification> {
  final String id;
  final String nameFr;
  final String? nameEn;
  final String? logoUrl;
  const Certification({
    required this.id,
    required this.nameFr,
    this.nameEn,
    this.logoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    return map;
  }

  CertificationsCompanion toCompanion(bool nullToAbsent) {
    return CertificationsCompanion(
      id: Value(id),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
    );
  }

  factory Certification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Certification(
      id: serializer.fromJson<String>(json['id']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'logoUrl': serializer.toJson<String?>(logoUrl),
    };
  }

  Certification copyWith({
    String? id,
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> logoUrl = const Value.absent(),
  }) => Certification(
    id: id ?? this.id,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
  );
  Certification copyWithCompanion(CertificationsCompanion data) {
    return Certification(
      id: data.id.present ? data.id.value : this.id,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Certification(')
          ..write('id: $id, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('logoUrl: $logoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameFr, nameEn, logoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Certification &&
          other.id == this.id &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn &&
          other.logoUrl == this.logoUrl);
}

class CertificationsCompanion extends UpdateCompanion<Certification> {
  final Value<String> id;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<String?> logoUrl;
  final Value<int> rowid;
  const CertificationsCompanion({
    this.id = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CertificationsCompanion.insert({
    required String id,
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nameFr = Value(nameFr);
  static Insertable<Certification> custom({
    Expression<String>? id,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<String>? logoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CertificationsCompanion copyWith({
    Value<String>? id,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<String?>? logoUrl,
    Value<int>? rowid,
  }) {
    return CertificationsCompanion(
      id: id ?? this.id,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      logoUrl: logoUrl ?? this.logoUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CertificationsCompanion(')
          ..write('id: $id, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<String> brandId = GeneratedColumn<String>(
    'brand_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brands (id)',
    ),
  );
  static const VerificationMeta _categorySlugMeta = const VerificationMeta(
    'categorySlug',
  );
  @override
  late final GeneratedColumn<String> categorySlug = GeneratedColumn<String>(
    'category_slug',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (slug)',
    ),
  );
  static const VerificationMeta _formSlugMeta = const VerificationMeta(
    'formSlug',
  );
  @override
  late final GeneratedColumn<String> formSlug = GeneratedColumn<String>(
    'form_slug',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES forms (slug)',
    ),
  );
  static const VerificationMeta _nameFrMeta = const VerificationMeta('nameFr');
  @override
  late final GeneratedColumn<String> nameFr = GeneratedColumn<String>(
    'name_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scientificNameMeta = const VerificationMeta(
    'scientificName',
  );
  @override
  late final GeneratedColumn<String> scientificName = GeneratedColumn<String>(
    'scientific_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<String> volume = GeneratedColumn<String>(
    'volume',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _excerptFrMeta = const VerificationMeta(
    'excerptFr',
  );
  @override
  late final GeneratedColumn<String> excerptFr = GeneratedColumn<String>(
    'excerpt_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _excerptEnMeta = const VerificationMeta(
    'excerptEn',
  );
  @override
  late final GeneratedColumn<String> excerptEn = GeneratedColumn<String>(
    'excerpt_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionFrMeta = const VerificationMeta(
    'descriptionFr',
  );
  @override
  late final GeneratedColumn<String> descriptionFr = GeneratedColumn<String>(
    'description_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionEnMeta = const VerificationMeta(
    'descriptionEn',
  );
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
    'description_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _benefitsFrMeta = const VerificationMeta(
    'benefitsFr',
  );
  @override
  late final GeneratedColumn<String> benefitsFr = GeneratedColumn<String>(
    'benefits_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _benefitsEnMeta = const VerificationMeta(
    'benefitsEn',
  );
  @override
  late final GeneratedColumn<String> benefitsEn = GeneratedColumn<String>(
    'benefits_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageFrMeta = const VerificationMeta(
    'usageFr',
  );
  @override
  late final GeneratedColumn<String> usageFr = GeneratedColumn<String>(
    'usage_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageEnMeta = const VerificationMeta(
    'usageEn',
  );
  @override
  late final GeneratedColumn<String> usageEn = GeneratedColumn<String>(
    'usage_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expertNoteFrMeta = const VerificationMeta(
    'expertNoteFr',
  );
  @override
  late final GeneratedColumn<String> expertNoteFr = GeneratedColumn<String>(
    'expert_note_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expertNoteEnMeta = const VerificationMeta(
    'expertNoteEn',
  );
  @override
  late final GeneratedColumn<String> expertNoteEn = GeneratedColumn<String>(
    'expert_note_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _galleryUrlsMeta = const VerificationMeta(
    'galleryUrls',
  );
  @override
  late final GeneratedColumn<String> galleryUrls = GeneratedColumn<String>(
    'gallery_urls',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isNewMeta = const VerificationMeta('isNew');
  @override
  late final GeneratedColumn<bool> isNew = GeneratedColumn<bool>(
    'is_new',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_new" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brandId,
    categorySlug,
    formSlug,
    nameFr,
    nameEn,
    scientificName,
    volume,
    weight,
    excerptFr,
    excerptEn,
    descriptionFr,
    descriptionEn,
    benefitsFr,
    benefitsEn,
    usageFr,
    usageEn,
    expertNoteFr,
    expertNoteEn,
    imageUrl,
    galleryUrls,
    isNew,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    }
    if (data.containsKey('category_slug')) {
      context.handle(
        _categorySlugMeta,
        categorySlug.isAcceptableOrUnknown(
          data['category_slug']!,
          _categorySlugMeta,
        ),
      );
    }
    if (data.containsKey('form_slug')) {
      context.handle(
        _formSlugMeta,
        formSlug.isAcceptableOrUnknown(data['form_slug']!, _formSlugMeta),
      );
    }
    if (data.containsKey('name_fr')) {
      context.handle(
        _nameFrMeta,
        nameFr.isAcceptableOrUnknown(data['name_fr']!, _nameFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameFrMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('scientific_name')) {
      context.handle(
        _scientificNameMeta,
        scientificName.isAcceptableOrUnknown(
          data['scientific_name']!,
          _scientificNameMeta,
        ),
      );
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('excerpt_fr')) {
      context.handle(
        _excerptFrMeta,
        excerptFr.isAcceptableOrUnknown(data['excerpt_fr']!, _excerptFrMeta),
      );
    }
    if (data.containsKey('excerpt_en')) {
      context.handle(
        _excerptEnMeta,
        excerptEn.isAcceptableOrUnknown(data['excerpt_en']!, _excerptEnMeta),
      );
    }
    if (data.containsKey('description_fr')) {
      context.handle(
        _descriptionFrMeta,
        descriptionFr.isAcceptableOrUnknown(
          data['description_fr']!,
          _descriptionFrMeta,
        ),
      );
    }
    if (data.containsKey('description_en')) {
      context.handle(
        _descriptionEnMeta,
        descriptionEn.isAcceptableOrUnknown(
          data['description_en']!,
          _descriptionEnMeta,
        ),
      );
    }
    if (data.containsKey('benefits_fr')) {
      context.handle(
        _benefitsFrMeta,
        benefitsFr.isAcceptableOrUnknown(data['benefits_fr']!, _benefitsFrMeta),
      );
    }
    if (data.containsKey('benefits_en')) {
      context.handle(
        _benefitsEnMeta,
        benefitsEn.isAcceptableOrUnknown(data['benefits_en']!, _benefitsEnMeta),
      );
    }
    if (data.containsKey('usage_fr')) {
      context.handle(
        _usageFrMeta,
        usageFr.isAcceptableOrUnknown(data['usage_fr']!, _usageFrMeta),
      );
    }
    if (data.containsKey('usage_en')) {
      context.handle(
        _usageEnMeta,
        usageEn.isAcceptableOrUnknown(data['usage_en']!, _usageEnMeta),
      );
    }
    if (data.containsKey('expert_note_fr')) {
      context.handle(
        _expertNoteFrMeta,
        expertNoteFr.isAcceptableOrUnknown(
          data['expert_note_fr']!,
          _expertNoteFrMeta,
        ),
      );
    }
    if (data.containsKey('expert_note_en')) {
      context.handle(
        _expertNoteEnMeta,
        expertNoteEn.isAcceptableOrUnknown(
          data['expert_note_en']!,
          _expertNoteEnMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('gallery_urls')) {
      context.handle(
        _galleryUrlsMeta,
        galleryUrls.isAcceptableOrUnknown(
          data['gallery_urls']!,
          _galleryUrlsMeta,
        ),
      );
    }
    if (data.containsKey('is_new')) {
      context.handle(
        _isNewMeta,
        isNew.isAcceptableOrUnknown(data['is_new']!, _isNewMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand_id'],
      ),
      categorySlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_slug'],
      ),
      formSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form_slug'],
      ),
      nameFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_fr'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      scientificName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scientific_name'],
      ),
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}volume'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight'],
      ),
      excerptFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}excerpt_fr'],
      ),
      excerptEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}excerpt_en'],
      ),
      descriptionFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_fr'],
      ),
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
      ),
      benefitsFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}benefits_fr'],
      ),
      benefitsEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}benefits_en'],
      ),
      usageFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage_fr'],
      ),
      usageEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage_en'],
      ),
      expertNoteFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expert_note_fr'],
      ),
      expertNoteEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expert_note_en'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      galleryUrls: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gallery_urls'],
      ),
      isNew: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_new'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String? brandId;
  final String? categorySlug;
  final String? formSlug;
  final String nameFr;
  final String? nameEn;
  final String? scientificName;
  final String? volume;
  final String? weight;
  final String? excerptFr;
  final String? excerptEn;
  final String? descriptionFr;
  final String? descriptionEn;
  final String? benefitsFr;
  final String? benefitsEn;
  final String? usageFr;
  final String? usageEn;
  final String? expertNoteFr;
  final String? expertNoteEn;
  final String? imageUrl;
  final String? galleryUrls;
  final bool isNew;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Product({
    required this.id,
    this.brandId,
    this.categorySlug,
    this.formSlug,
    required this.nameFr,
    this.nameEn,
    this.scientificName,
    this.volume,
    this.weight,
    this.excerptFr,
    this.excerptEn,
    this.descriptionFr,
    this.descriptionEn,
    this.benefitsFr,
    this.benefitsEn,
    this.usageFr,
    this.usageEn,
    this.expertNoteFr,
    this.expertNoteEn,
    this.imageUrl,
    this.galleryUrls,
    required this.isNew,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || brandId != null) {
      map['brand_id'] = Variable<String>(brandId);
    }
    if (!nullToAbsent || categorySlug != null) {
      map['category_slug'] = Variable<String>(categorySlug);
    }
    if (!nullToAbsent || formSlug != null) {
      map['form_slug'] = Variable<String>(formSlug);
    }
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || scientificName != null) {
      map['scientific_name'] = Variable<String>(scientificName);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<String>(volume);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<String>(weight);
    }
    if (!nullToAbsent || excerptFr != null) {
      map['excerpt_fr'] = Variable<String>(excerptFr);
    }
    if (!nullToAbsent || excerptEn != null) {
      map['excerpt_en'] = Variable<String>(excerptEn);
    }
    if (!nullToAbsent || descriptionFr != null) {
      map['description_fr'] = Variable<String>(descriptionFr);
    }
    if (!nullToAbsent || descriptionEn != null) {
      map['description_en'] = Variable<String>(descriptionEn);
    }
    if (!nullToAbsent || benefitsFr != null) {
      map['benefits_fr'] = Variable<String>(benefitsFr);
    }
    if (!nullToAbsent || benefitsEn != null) {
      map['benefits_en'] = Variable<String>(benefitsEn);
    }
    if (!nullToAbsent || usageFr != null) {
      map['usage_fr'] = Variable<String>(usageFr);
    }
    if (!nullToAbsent || usageEn != null) {
      map['usage_en'] = Variable<String>(usageEn);
    }
    if (!nullToAbsent || expertNoteFr != null) {
      map['expert_note_fr'] = Variable<String>(expertNoteFr);
    }
    if (!nullToAbsent || expertNoteEn != null) {
      map['expert_note_en'] = Variable<String>(expertNoteEn);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || galleryUrls != null) {
      map['gallery_urls'] = Variable<String>(galleryUrls);
    }
    map['is_new'] = Variable<bool>(isNew);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      brandId: brandId == null && nullToAbsent
          ? const Value.absent()
          : Value(brandId),
      categorySlug: categorySlug == null && nullToAbsent
          ? const Value.absent()
          : Value(categorySlug),
      formSlug: formSlug == null && nullToAbsent
          ? const Value.absent()
          : Value(formSlug),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      scientificName: scientificName == null && nullToAbsent
          ? const Value.absent()
          : Value(scientificName),
      volume: volume == null && nullToAbsent
          ? const Value.absent()
          : Value(volume),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      excerptFr: excerptFr == null && nullToAbsent
          ? const Value.absent()
          : Value(excerptFr),
      excerptEn: excerptEn == null && nullToAbsent
          ? const Value.absent()
          : Value(excerptEn),
      descriptionFr: descriptionFr == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionFr),
      descriptionEn: descriptionEn == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionEn),
      benefitsFr: benefitsFr == null && nullToAbsent
          ? const Value.absent()
          : Value(benefitsFr),
      benefitsEn: benefitsEn == null && nullToAbsent
          ? const Value.absent()
          : Value(benefitsEn),
      usageFr: usageFr == null && nullToAbsent
          ? const Value.absent()
          : Value(usageFr),
      usageEn: usageEn == null && nullToAbsent
          ? const Value.absent()
          : Value(usageEn),
      expertNoteFr: expertNoteFr == null && nullToAbsent
          ? const Value.absent()
          : Value(expertNoteFr),
      expertNoteEn: expertNoteEn == null && nullToAbsent
          ? const Value.absent()
          : Value(expertNoteEn),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      galleryUrls: galleryUrls == null && nullToAbsent
          ? const Value.absent()
          : Value(galleryUrls),
      isNew: Value(isNew),
      isActive: Value(isActive),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      brandId: serializer.fromJson<String?>(json['brandId']),
      categorySlug: serializer.fromJson<String?>(json['categorySlug']),
      formSlug: serializer.fromJson<String?>(json['formSlug']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      scientificName: serializer.fromJson<String?>(json['scientificName']),
      volume: serializer.fromJson<String?>(json['volume']),
      weight: serializer.fromJson<String?>(json['weight']),
      excerptFr: serializer.fromJson<String?>(json['excerptFr']),
      excerptEn: serializer.fromJson<String?>(json['excerptEn']),
      descriptionFr: serializer.fromJson<String?>(json['descriptionFr']),
      descriptionEn: serializer.fromJson<String?>(json['descriptionEn']),
      benefitsFr: serializer.fromJson<String?>(json['benefitsFr']),
      benefitsEn: serializer.fromJson<String?>(json['benefitsEn']),
      usageFr: serializer.fromJson<String?>(json['usageFr']),
      usageEn: serializer.fromJson<String?>(json['usageEn']),
      expertNoteFr: serializer.fromJson<String?>(json['expertNoteFr']),
      expertNoteEn: serializer.fromJson<String?>(json['expertNoteEn']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      galleryUrls: serializer.fromJson<String?>(json['galleryUrls']),
      isNew: serializer.fromJson<bool>(json['isNew']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'brandId': serializer.toJson<String?>(brandId),
      'categorySlug': serializer.toJson<String?>(categorySlug),
      'formSlug': serializer.toJson<String?>(formSlug),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'scientificName': serializer.toJson<String?>(scientificName),
      'volume': serializer.toJson<String?>(volume),
      'weight': serializer.toJson<String?>(weight),
      'excerptFr': serializer.toJson<String?>(excerptFr),
      'excerptEn': serializer.toJson<String?>(excerptEn),
      'descriptionFr': serializer.toJson<String?>(descriptionFr),
      'descriptionEn': serializer.toJson<String?>(descriptionEn),
      'benefitsFr': serializer.toJson<String?>(benefitsFr),
      'benefitsEn': serializer.toJson<String?>(benefitsEn),
      'usageFr': serializer.toJson<String?>(usageFr),
      'usageEn': serializer.toJson<String?>(usageEn),
      'expertNoteFr': serializer.toJson<String?>(expertNoteFr),
      'expertNoteEn': serializer.toJson<String?>(expertNoteEn),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'galleryUrls': serializer.toJson<String?>(galleryUrls),
      'isNew': serializer.toJson<bool>(isNew),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Product copyWith({
    String? id,
    Value<String?> brandId = const Value.absent(),
    Value<String?> categorySlug = const Value.absent(),
    Value<String?> formSlug = const Value.absent(),
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> scientificName = const Value.absent(),
    Value<String?> volume = const Value.absent(),
    Value<String?> weight = const Value.absent(),
    Value<String?> excerptFr = const Value.absent(),
    Value<String?> excerptEn = const Value.absent(),
    Value<String?> descriptionFr = const Value.absent(),
    Value<String?> descriptionEn = const Value.absent(),
    Value<String?> benefitsFr = const Value.absent(),
    Value<String?> benefitsEn = const Value.absent(),
    Value<String?> usageFr = const Value.absent(),
    Value<String?> usageEn = const Value.absent(),
    Value<String?> expertNoteFr = const Value.absent(),
    Value<String?> expertNoteEn = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> galleryUrls = const Value.absent(),
    bool? isNew,
    bool? isActive,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Product(
    id: id ?? this.id,
    brandId: brandId.present ? brandId.value : this.brandId,
    categorySlug: categorySlug.present ? categorySlug.value : this.categorySlug,
    formSlug: formSlug.present ? formSlug.value : this.formSlug,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    scientificName: scientificName.present
        ? scientificName.value
        : this.scientificName,
    volume: volume.present ? volume.value : this.volume,
    weight: weight.present ? weight.value : this.weight,
    excerptFr: excerptFr.present ? excerptFr.value : this.excerptFr,
    excerptEn: excerptEn.present ? excerptEn.value : this.excerptEn,
    descriptionFr: descriptionFr.present
        ? descriptionFr.value
        : this.descriptionFr,
    descriptionEn: descriptionEn.present
        ? descriptionEn.value
        : this.descriptionEn,
    benefitsFr: benefitsFr.present ? benefitsFr.value : this.benefitsFr,
    benefitsEn: benefitsEn.present ? benefitsEn.value : this.benefitsEn,
    usageFr: usageFr.present ? usageFr.value : this.usageFr,
    usageEn: usageEn.present ? usageEn.value : this.usageEn,
    expertNoteFr: expertNoteFr.present ? expertNoteFr.value : this.expertNoteFr,
    expertNoteEn: expertNoteEn.present ? expertNoteEn.value : this.expertNoteEn,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    galleryUrls: galleryUrls.present ? galleryUrls.value : this.galleryUrls,
    isNew: isNew ?? this.isNew,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      categorySlug: data.categorySlug.present
          ? data.categorySlug.value
          : this.categorySlug,
      formSlug: data.formSlug.present ? data.formSlug.value : this.formSlug,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      scientificName: data.scientificName.present
          ? data.scientificName.value
          : this.scientificName,
      volume: data.volume.present ? data.volume.value : this.volume,
      weight: data.weight.present ? data.weight.value : this.weight,
      excerptFr: data.excerptFr.present ? data.excerptFr.value : this.excerptFr,
      excerptEn: data.excerptEn.present ? data.excerptEn.value : this.excerptEn,
      descriptionFr: data.descriptionFr.present
          ? data.descriptionFr.value
          : this.descriptionFr,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      benefitsFr: data.benefitsFr.present
          ? data.benefitsFr.value
          : this.benefitsFr,
      benefitsEn: data.benefitsEn.present
          ? data.benefitsEn.value
          : this.benefitsEn,
      usageFr: data.usageFr.present ? data.usageFr.value : this.usageFr,
      usageEn: data.usageEn.present ? data.usageEn.value : this.usageEn,
      expertNoteFr: data.expertNoteFr.present
          ? data.expertNoteFr.value
          : this.expertNoteFr,
      expertNoteEn: data.expertNoteEn.present
          ? data.expertNoteEn.value
          : this.expertNoteEn,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      galleryUrls: data.galleryUrls.present
          ? data.galleryUrls.value
          : this.galleryUrls,
      isNew: data.isNew.present ? data.isNew.value : this.isNew,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('categorySlug: $categorySlug, ')
          ..write('formSlug: $formSlug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('scientificName: $scientificName, ')
          ..write('volume: $volume, ')
          ..write('weight: $weight, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('benefitsFr: $benefitsFr, ')
          ..write('benefitsEn: $benefitsEn, ')
          ..write('usageFr: $usageFr, ')
          ..write('usageEn: $usageEn, ')
          ..write('expertNoteFr: $expertNoteFr, ')
          ..write('expertNoteEn: $expertNoteEn, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('galleryUrls: $galleryUrls, ')
          ..write('isNew: $isNew, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    brandId,
    categorySlug,
    formSlug,
    nameFr,
    nameEn,
    scientificName,
    volume,
    weight,
    excerptFr,
    excerptEn,
    descriptionFr,
    descriptionEn,
    benefitsFr,
    benefitsEn,
    usageFr,
    usageEn,
    expertNoteFr,
    expertNoteEn,
    imageUrl,
    galleryUrls,
    isNew,
    isActive,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.categorySlug == this.categorySlug &&
          other.formSlug == this.formSlug &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn &&
          other.scientificName == this.scientificName &&
          other.volume == this.volume &&
          other.weight == this.weight &&
          other.excerptFr == this.excerptFr &&
          other.excerptEn == this.excerptEn &&
          other.descriptionFr == this.descriptionFr &&
          other.descriptionEn == this.descriptionEn &&
          other.benefitsFr == this.benefitsFr &&
          other.benefitsEn == this.benefitsEn &&
          other.usageFr == this.usageFr &&
          other.usageEn == this.usageEn &&
          other.expertNoteFr == this.expertNoteFr &&
          other.expertNoteEn == this.expertNoteEn &&
          other.imageUrl == this.imageUrl &&
          other.galleryUrls == this.galleryUrls &&
          other.isNew == this.isNew &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String?> brandId;
  final Value<String?> categorySlug;
  final Value<String?> formSlug;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<String?> scientificName;
  final Value<String?> volume;
  final Value<String?> weight;
  final Value<String?> excerptFr;
  final Value<String?> excerptEn;
  final Value<String?> descriptionFr;
  final Value<String?> descriptionEn;
  final Value<String?> benefitsFr;
  final Value<String?> benefitsEn;
  final Value<String?> usageFr;
  final Value<String?> usageEn;
  final Value<String?> expertNoteFr;
  final Value<String?> expertNoteEn;
  final Value<String?> imageUrl;
  final Value<String?> galleryUrls;
  final Value<bool> isNew;
  final Value<bool> isActive;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.categorySlug = const Value.absent(),
    this.formSlug = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.volume = const Value.absent(),
    this.weight = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.benefitsFr = const Value.absent(),
    this.benefitsEn = const Value.absent(),
    this.usageFr = const Value.absent(),
    this.usageEn = const Value.absent(),
    this.expertNoteFr = const Value.absent(),
    this.expertNoteEn = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.galleryUrls = const Value.absent(),
    this.isNew = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    this.brandId = const Value.absent(),
    this.categorySlug = const Value.absent(),
    this.formSlug = const Value.absent(),
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.volume = const Value.absent(),
    this.weight = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.benefitsFr = const Value.absent(),
    this.benefitsEn = const Value.absent(),
    this.usageFr = const Value.absent(),
    this.usageEn = const Value.absent(),
    this.expertNoteFr = const Value.absent(),
    this.expertNoteEn = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.galleryUrls = const Value.absent(),
    this.isNew = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nameFr = Value(nameFr);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? brandId,
    Expression<String>? categorySlug,
    Expression<String>? formSlug,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<String>? scientificName,
    Expression<String>? volume,
    Expression<String>? weight,
    Expression<String>? excerptFr,
    Expression<String>? excerptEn,
    Expression<String>? descriptionFr,
    Expression<String>? descriptionEn,
    Expression<String>? benefitsFr,
    Expression<String>? benefitsEn,
    Expression<String>? usageFr,
    Expression<String>? usageEn,
    Expression<String>? expertNoteFr,
    Expression<String>? expertNoteEn,
    Expression<String>? imageUrl,
    Expression<String>? galleryUrls,
    Expression<bool>? isNew,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (categorySlug != null) 'category_slug': categorySlug,
      if (formSlug != null) 'form_slug': formSlug,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (scientificName != null) 'scientific_name': scientificName,
      if (volume != null) 'volume': volume,
      if (weight != null) 'weight': weight,
      if (excerptFr != null) 'excerpt_fr': excerptFr,
      if (excerptEn != null) 'excerpt_en': excerptEn,
      if (descriptionFr != null) 'description_fr': descriptionFr,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (benefitsFr != null) 'benefits_fr': benefitsFr,
      if (benefitsEn != null) 'benefits_en': benefitsEn,
      if (usageFr != null) 'usage_fr': usageFr,
      if (usageEn != null) 'usage_en': usageEn,
      if (expertNoteFr != null) 'expert_note_fr': expertNoteFr,
      if (expertNoteEn != null) 'expert_note_en': expertNoteEn,
      if (imageUrl != null) 'image_url': imageUrl,
      if (galleryUrls != null) 'gallery_urls': galleryUrls,
      if (isNew != null) 'is_new': isNew,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String?>? brandId,
    Value<String?>? categorySlug,
    Value<String?>? formSlug,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<String?>? scientificName,
    Value<String?>? volume,
    Value<String?>? weight,
    Value<String?>? excerptFr,
    Value<String?>? excerptEn,
    Value<String?>? descriptionFr,
    Value<String?>? descriptionEn,
    Value<String?>? benefitsFr,
    Value<String?>? benefitsEn,
    Value<String?>? usageFr,
    Value<String?>? usageEn,
    Value<String?>? expertNoteFr,
    Value<String?>? expertNoteEn,
    Value<String?>? imageUrl,
    Value<String?>? galleryUrls,
    Value<bool>? isNew,
    Value<bool>? isActive,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      categorySlug: categorySlug ?? this.categorySlug,
      formSlug: formSlug ?? this.formSlug,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      scientificName: scientificName ?? this.scientificName,
      volume: volume ?? this.volume,
      weight: weight ?? this.weight,
      excerptFr: excerptFr ?? this.excerptFr,
      excerptEn: excerptEn ?? this.excerptEn,
      descriptionFr: descriptionFr ?? this.descriptionFr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      benefitsFr: benefitsFr ?? this.benefitsFr,
      benefitsEn: benefitsEn ?? this.benefitsEn,
      usageFr: usageFr ?? this.usageFr,
      usageEn: usageEn ?? this.usageEn,
      expertNoteFr: expertNoteFr ?? this.expertNoteFr,
      expertNoteEn: expertNoteEn ?? this.expertNoteEn,
      imageUrl: imageUrl ?? this.imageUrl,
      galleryUrls: galleryUrls ?? this.galleryUrls,
      isNew: isNew ?? this.isNew,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<String>(brandId.value);
    }
    if (categorySlug.present) {
      map['category_slug'] = Variable<String>(categorySlug.value);
    }
    if (formSlug.present) {
      map['form_slug'] = Variable<String>(formSlug.value);
    }
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (scientificName.present) {
      map['scientific_name'] = Variable<String>(scientificName.value);
    }
    if (volume.present) {
      map['volume'] = Variable<String>(volume.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (excerptFr.present) {
      map['excerpt_fr'] = Variable<String>(excerptFr.value);
    }
    if (excerptEn.present) {
      map['excerpt_en'] = Variable<String>(excerptEn.value);
    }
    if (descriptionFr.present) {
      map['description_fr'] = Variable<String>(descriptionFr.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (benefitsFr.present) {
      map['benefits_fr'] = Variable<String>(benefitsFr.value);
    }
    if (benefitsEn.present) {
      map['benefits_en'] = Variable<String>(benefitsEn.value);
    }
    if (usageFr.present) {
      map['usage_fr'] = Variable<String>(usageFr.value);
    }
    if (usageEn.present) {
      map['usage_en'] = Variable<String>(usageEn.value);
    }
    if (expertNoteFr.present) {
      map['expert_note_fr'] = Variable<String>(expertNoteFr.value);
    }
    if (expertNoteEn.present) {
      map['expert_note_en'] = Variable<String>(expertNoteEn.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (galleryUrls.present) {
      map['gallery_urls'] = Variable<String>(galleryUrls.value);
    }
    if (isNew.present) {
      map['is_new'] = Variable<bool>(isNew.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('categorySlug: $categorySlug, ')
          ..write('formSlug: $formSlug, ')
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('scientificName: $scientificName, ')
          ..write('volume: $volume, ')
          ..write('weight: $weight, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('benefitsFr: $benefitsFr, ')
          ..write('benefitsEn: $benefitsEn, ')
          ..write('usageFr: $usageFr, ')
          ..write('usageEn: $usageEn, ')
          ..write('expertNoteFr: $expertNoteFr, ')
          ..write('expertNoteEn: $expertNoteEn, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('galleryUrls: $galleryUrls, ')
          ..write('isNew: $isNew, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categorySlugMeta = const VerificationMeta(
    'categorySlug',
  );
  @override
  late final GeneratedColumn<String> categorySlug = GeneratedColumn<String>(
    'category_slug',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (slug)',
    ),
  );
  static const VerificationMeta _titleFrMeta = const VerificationMeta(
    'titleFr',
  );
  @override
  late final GeneratedColumn<String> titleFr = GeneratedColumn<String>(
    'title_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnMeta = const VerificationMeta(
    'titleEn',
  );
  @override
  late final GeneratedColumn<String> titleEn = GeneratedColumn<String>(
    'title_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _excerptFrMeta = const VerificationMeta(
    'excerptFr',
  );
  @override
  late final GeneratedColumn<String> excerptFr = GeneratedColumn<String>(
    'excerpt_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _excerptEnMeta = const VerificationMeta(
    'excerptEn',
  );
  @override
  late final GeneratedColumn<String> excerptEn = GeneratedColumn<String>(
    'excerpt_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentFrMeta = const VerificationMeta(
    'contentFr',
  );
  @override
  late final GeneratedColumn<String> contentFr = GeneratedColumn<String>(
    'content_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentEnMeta = const VerificationMeta(
    'contentEn',
  );
  @override
  late final GeneratedColumn<String> contentEn = GeneratedColumn<String>(
    'content_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readTimeMinutesMeta = const VerificationMeta(
    'readTimeMinutes',
  );
  @override
  late final GeneratedColumn<int> readTimeMinutes = GeneratedColumn<int>(
    'read_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categorySlug,
    titleFr,
    titleEn,
    excerptFr,
    excerptEn,
    contentFr,
    contentEn,
    imageUrl,
    readTimeMinutes,
    publishedAt,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Article> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category_slug')) {
      context.handle(
        _categorySlugMeta,
        categorySlug.isAcceptableOrUnknown(
          data['category_slug']!,
          _categorySlugMeta,
        ),
      );
    }
    if (data.containsKey('title_fr')) {
      context.handle(
        _titleFrMeta,
        titleFr.isAcceptableOrUnknown(data['title_fr']!, _titleFrMeta),
      );
    } else if (isInserting) {
      context.missing(_titleFrMeta);
    }
    if (data.containsKey('title_en')) {
      context.handle(
        _titleEnMeta,
        titleEn.isAcceptableOrUnknown(data['title_en']!, _titleEnMeta),
      );
    }
    if (data.containsKey('excerpt_fr')) {
      context.handle(
        _excerptFrMeta,
        excerptFr.isAcceptableOrUnknown(data['excerpt_fr']!, _excerptFrMeta),
      );
    }
    if (data.containsKey('excerpt_en')) {
      context.handle(
        _excerptEnMeta,
        excerptEn.isAcceptableOrUnknown(data['excerpt_en']!, _excerptEnMeta),
      );
    }
    if (data.containsKey('content_fr')) {
      context.handle(
        _contentFrMeta,
        contentFr.isAcceptableOrUnknown(data['content_fr']!, _contentFrMeta),
      );
    }
    if (data.containsKey('content_en')) {
      context.handle(
        _contentEnMeta,
        contentEn.isAcceptableOrUnknown(data['content_en']!, _contentEnMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('read_time_minutes')) {
      context.handle(
        _readTimeMinutesMeta,
        readTimeMinutes.isAcceptableOrUnknown(
          data['read_time_minutes']!,
          _readTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      categorySlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_slug'],
      ),
      titleFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_fr'],
      )!,
      titleEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_en'],
      ),
      excerptFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}excerpt_fr'],
      ),
      excerptEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}excerpt_en'],
      ),
      contentFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_fr'],
      ),
      contentEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_en'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      readTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}read_time_minutes'],
      ),
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final String id;
  final String? categorySlug;
  final String titleFr;
  final String? titleEn;
  final String? excerptFr;
  final String? excerptEn;
  final String? contentFr;
  final String? contentEn;
  final String? imageUrl;
  final int? readTimeMinutes;
  final DateTime? publishedAt;
  final bool isActive;
  const Article({
    required this.id,
    this.categorySlug,
    required this.titleFr,
    this.titleEn,
    this.excerptFr,
    this.excerptEn,
    this.contentFr,
    this.contentEn,
    this.imageUrl,
    this.readTimeMinutes,
    this.publishedAt,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || categorySlug != null) {
      map['category_slug'] = Variable<String>(categorySlug);
    }
    map['title_fr'] = Variable<String>(titleFr);
    if (!nullToAbsent || titleEn != null) {
      map['title_en'] = Variable<String>(titleEn);
    }
    if (!nullToAbsent || excerptFr != null) {
      map['excerpt_fr'] = Variable<String>(excerptFr);
    }
    if (!nullToAbsent || excerptEn != null) {
      map['excerpt_en'] = Variable<String>(excerptEn);
    }
    if (!nullToAbsent || contentFr != null) {
      map['content_fr'] = Variable<String>(contentFr);
    }
    if (!nullToAbsent || contentEn != null) {
      map['content_en'] = Variable<String>(contentEn);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || readTimeMinutes != null) {
      map['read_time_minutes'] = Variable<int>(readTimeMinutes);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      categorySlug: categorySlug == null && nullToAbsent
          ? const Value.absent()
          : Value(categorySlug),
      titleFr: Value(titleFr),
      titleEn: titleEn == null && nullToAbsent
          ? const Value.absent()
          : Value(titleEn),
      excerptFr: excerptFr == null && nullToAbsent
          ? const Value.absent()
          : Value(excerptFr),
      excerptEn: excerptEn == null && nullToAbsent
          ? const Value.absent()
          : Value(excerptEn),
      contentFr: contentFr == null && nullToAbsent
          ? const Value.absent()
          : Value(contentFr),
      contentEn: contentEn == null && nullToAbsent
          ? const Value.absent()
          : Value(contentEn),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      readTimeMinutes: readTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(readTimeMinutes),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      isActive: Value(isActive),
    );
  }

  factory Article.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<String>(json['id']),
      categorySlug: serializer.fromJson<String?>(json['categorySlug']),
      titleFr: serializer.fromJson<String>(json['titleFr']),
      titleEn: serializer.fromJson<String?>(json['titleEn']),
      excerptFr: serializer.fromJson<String?>(json['excerptFr']),
      excerptEn: serializer.fromJson<String?>(json['excerptEn']),
      contentFr: serializer.fromJson<String?>(json['contentFr']),
      contentEn: serializer.fromJson<String?>(json['contentEn']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      readTimeMinutes: serializer.fromJson<int?>(json['readTimeMinutes']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categorySlug': serializer.toJson<String?>(categorySlug),
      'titleFr': serializer.toJson<String>(titleFr),
      'titleEn': serializer.toJson<String?>(titleEn),
      'excerptFr': serializer.toJson<String?>(excerptFr),
      'excerptEn': serializer.toJson<String?>(excerptEn),
      'contentFr': serializer.toJson<String?>(contentFr),
      'contentEn': serializer.toJson<String?>(contentEn),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'readTimeMinutes': serializer.toJson<int?>(readTimeMinutes),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Article copyWith({
    String? id,
    Value<String?> categorySlug = const Value.absent(),
    String? titleFr,
    Value<String?> titleEn = const Value.absent(),
    Value<String?> excerptFr = const Value.absent(),
    Value<String?> excerptEn = const Value.absent(),
    Value<String?> contentFr = const Value.absent(),
    Value<String?> contentEn = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<int?> readTimeMinutes = const Value.absent(),
    Value<DateTime?> publishedAt = const Value.absent(),
    bool? isActive,
  }) => Article(
    id: id ?? this.id,
    categorySlug: categorySlug.present ? categorySlug.value : this.categorySlug,
    titleFr: titleFr ?? this.titleFr,
    titleEn: titleEn.present ? titleEn.value : this.titleEn,
    excerptFr: excerptFr.present ? excerptFr.value : this.excerptFr,
    excerptEn: excerptEn.present ? excerptEn.value : this.excerptEn,
    contentFr: contentFr.present ? contentFr.value : this.contentFr,
    contentEn: contentEn.present ? contentEn.value : this.contentEn,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    readTimeMinutes: readTimeMinutes.present
        ? readTimeMinutes.value
        : this.readTimeMinutes,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    isActive: isActive ?? this.isActive,
  );
  Article copyWithCompanion(ArticlesCompanion data) {
    return Article(
      id: data.id.present ? data.id.value : this.id,
      categorySlug: data.categorySlug.present
          ? data.categorySlug.value
          : this.categorySlug,
      titleFr: data.titleFr.present ? data.titleFr.value : this.titleFr,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
      excerptFr: data.excerptFr.present ? data.excerptFr.value : this.excerptFr,
      excerptEn: data.excerptEn.present ? data.excerptEn.value : this.excerptEn,
      contentFr: data.contentFr.present ? data.contentFr.value : this.contentFr,
      contentEn: data.contentEn.present ? data.contentEn.value : this.contentEn,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      readTimeMinutes: data.readTimeMinutes.present
          ? data.readTimeMinutes.value
          : this.readTimeMinutes,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('categorySlug: $categorySlug, ')
          ..write('titleFr: $titleFr, ')
          ..write('titleEn: $titleEn, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('contentFr: $contentFr, ')
          ..write('contentEn: $contentEn, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('readTimeMinutes: $readTimeMinutes, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categorySlug,
    titleFr,
    titleEn,
    excerptFr,
    excerptEn,
    contentFr,
    contentEn,
    imageUrl,
    readTimeMinutes,
    publishedAt,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.categorySlug == this.categorySlug &&
          other.titleFr == this.titleFr &&
          other.titleEn == this.titleEn &&
          other.excerptFr == this.excerptFr &&
          other.excerptEn == this.excerptEn &&
          other.contentFr == this.contentFr &&
          other.contentEn == this.contentEn &&
          other.imageUrl == this.imageUrl &&
          other.readTimeMinutes == this.readTimeMinutes &&
          other.publishedAt == this.publishedAt &&
          other.isActive == this.isActive);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<String> id;
  final Value<String?> categorySlug;
  final Value<String> titleFr;
  final Value<String?> titleEn;
  final Value<String?> excerptFr;
  final Value<String?> excerptEn;
  final Value<String?> contentFr;
  final Value<String?> contentEn;
  final Value<String?> imageUrl;
  final Value<int?> readTimeMinutes;
  final Value<DateTime?> publishedAt;
  final Value<bool> isActive;
  final Value<int> rowid;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.categorySlug = const Value.absent(),
    this.titleFr = const Value.absent(),
    this.titleEn = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.contentFr = const Value.absent(),
    this.contentEn = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.readTimeMinutes = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String id,
    this.categorySlug = const Value.absent(),
    required String titleFr,
    this.titleEn = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.contentFr = const Value.absent(),
    this.contentEn = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.readTimeMinutes = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       titleFr = Value(titleFr);
  static Insertable<Article> custom({
    Expression<String>? id,
    Expression<String>? categorySlug,
    Expression<String>? titleFr,
    Expression<String>? titleEn,
    Expression<String>? excerptFr,
    Expression<String>? excerptEn,
    Expression<String>? contentFr,
    Expression<String>? contentEn,
    Expression<String>? imageUrl,
    Expression<int>? readTimeMinutes,
    Expression<DateTime>? publishedAt,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categorySlug != null) 'category_slug': categorySlug,
      if (titleFr != null) 'title_fr': titleFr,
      if (titleEn != null) 'title_en': titleEn,
      if (excerptFr != null) 'excerpt_fr': excerptFr,
      if (excerptEn != null) 'excerpt_en': excerptEn,
      if (contentFr != null) 'content_fr': contentFr,
      if (contentEn != null) 'content_en': contentEn,
      if (imageUrl != null) 'image_url': imageUrl,
      if (readTimeMinutes != null) 'read_time_minutes': readTimeMinutes,
      if (publishedAt != null) 'published_at': publishedAt,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesCompanion copyWith({
    Value<String>? id,
    Value<String?>? categorySlug,
    Value<String>? titleFr,
    Value<String?>? titleEn,
    Value<String?>? excerptFr,
    Value<String?>? excerptEn,
    Value<String?>? contentFr,
    Value<String?>? contentEn,
    Value<String?>? imageUrl,
    Value<int?>? readTimeMinutes,
    Value<DateTime?>? publishedAt,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return ArticlesCompanion(
      id: id ?? this.id,
      categorySlug: categorySlug ?? this.categorySlug,
      titleFr: titleFr ?? this.titleFr,
      titleEn: titleEn ?? this.titleEn,
      excerptFr: excerptFr ?? this.excerptFr,
      excerptEn: excerptEn ?? this.excerptEn,
      contentFr: contentFr ?? this.contentFr,
      contentEn: contentEn ?? this.contentEn,
      imageUrl: imageUrl ?? this.imageUrl,
      readTimeMinutes: readTimeMinutes ?? this.readTimeMinutes,
      publishedAt: publishedAt ?? this.publishedAt,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categorySlug.present) {
      map['category_slug'] = Variable<String>(categorySlug.value);
    }
    if (titleFr.present) {
      map['title_fr'] = Variable<String>(titleFr.value);
    }
    if (titleEn.present) {
      map['title_en'] = Variable<String>(titleEn.value);
    }
    if (excerptFr.present) {
      map['excerpt_fr'] = Variable<String>(excerptFr.value);
    }
    if (excerptEn.present) {
      map['excerpt_en'] = Variable<String>(excerptEn.value);
    }
    if (contentFr.present) {
      map['content_fr'] = Variable<String>(contentFr.value);
    }
    if (contentEn.present) {
      map['content_en'] = Variable<String>(contentEn.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (readTimeMinutes.present) {
      map['read_time_minutes'] = Variable<int>(readTimeMinutes.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('categorySlug: $categorySlug, ')
          ..write('titleFr: $titleFr, ')
          ..write('titleEn: $titleEn, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('contentFr: $contentFr, ')
          ..write('contentEn: $contentEn, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('readTimeMinutes: $readTimeMinutes, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTagsTable extends ProductTags
    with TableInfo<$ProductTagsTable, ProductTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [productId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, tagId};
  @override
  ProductTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTag(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $ProductTagsTable createAlias(String alias) {
    return $ProductTagsTable(attachedDatabase, alias);
  }
}

class ProductTag extends DataClass implements Insertable<ProductTag> {
  final String productId;
  final String tagId;
  const ProductTag({required this.productId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  ProductTagsCompanion toCompanion(bool nullToAbsent) {
    return ProductTagsCompanion(
      productId: Value(productId),
      tagId: Value(tagId),
    );
  }

  factory ProductTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTag(
      productId: serializer.fromJson<String>(json['productId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  ProductTag copyWith({String? productId, String? tagId}) => ProductTag(
    productId: productId ?? this.productId,
    tagId: tagId ?? this.tagId,
  );
  ProductTag copyWithCompanion(ProductTagsCompanion data) {
    return ProductTag(
      productId: data.productId.present ? data.productId.value : this.productId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTag(')
          ..write('productId: $productId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTag &&
          other.productId == this.productId &&
          other.tagId == this.tagId);
}

class ProductTagsCompanion extends UpdateCompanion<ProductTag> {
  final Value<String> productId;
  final Value<String> tagId;
  final Value<int> rowid;
  const ProductTagsCompanion({
    this.productId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTagsCompanion.insert({
    required String productId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       tagId = Value(tagId);
  static Insertable<ProductTag> custom({
    Expression<String>? productId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTagsCompanion copyWith({
    Value<String>? productId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return ProductTagsCompanion(
      productId: productId ?? this.productId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTagsCompanion(')
          ..write('productId: $productId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductCertificationsTable extends ProductCertifications
    with TableInfo<$ProductCertificationsTable, ProductCertification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCertificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _certificationIdMeta = const VerificationMeta(
    'certificationId',
  );
  @override
  late final GeneratedColumn<String> certificationId = GeneratedColumn<String>(
    'certification_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES certifications (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [productId, certificationId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_certifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductCertification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('certification_id')) {
      context.handle(
        _certificationIdMeta,
        certificationId.isAcceptableOrUnknown(
          data['certification_id']!,
          _certificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_certificationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, certificationId};
  @override
  ProductCertification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCertification(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      certificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certification_id'],
      )!,
    );
  }

  @override
  $ProductCertificationsTable createAlias(String alias) {
    return $ProductCertificationsTable(attachedDatabase, alias);
  }
}

class ProductCertification extends DataClass
    implements Insertable<ProductCertification> {
  final String productId;
  final String certificationId;
  const ProductCertification({
    required this.productId,
    required this.certificationId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['certification_id'] = Variable<String>(certificationId);
    return map;
  }

  ProductCertificationsCompanion toCompanion(bool nullToAbsent) {
    return ProductCertificationsCompanion(
      productId: Value(productId),
      certificationId: Value(certificationId),
    );
  }

  factory ProductCertification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCertification(
      productId: serializer.fromJson<String>(json['productId']),
      certificationId: serializer.fromJson<String>(json['certificationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'certificationId': serializer.toJson<String>(certificationId),
    };
  }

  ProductCertification copyWith({String? productId, String? certificationId}) =>
      ProductCertification(
        productId: productId ?? this.productId,
        certificationId: certificationId ?? this.certificationId,
      );
  ProductCertification copyWithCompanion(ProductCertificationsCompanion data) {
    return ProductCertification(
      productId: data.productId.present ? data.productId.value : this.productId,
      certificationId: data.certificationId.present
          ? data.certificationId.value
          : this.certificationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductCertification(')
          ..write('productId: $productId, ')
          ..write('certificationId: $certificationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, certificationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCertification &&
          other.productId == this.productId &&
          other.certificationId == this.certificationId);
}

class ProductCertificationsCompanion
    extends UpdateCompanion<ProductCertification> {
  final Value<String> productId;
  final Value<String> certificationId;
  final Value<int> rowid;
  const ProductCertificationsCompanion({
    this.productId = const Value.absent(),
    this.certificationId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCertificationsCompanion.insert({
    required String productId,
    required String certificationId,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       certificationId = Value(certificationId);
  static Insertable<ProductCertification> custom({
    Expression<String>? productId,
    Expression<String>? certificationId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (certificationId != null) 'certification_id': certificationId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCertificationsCompanion copyWith({
    Value<String>? productId,
    Value<String>? certificationId,
    Value<int>? rowid,
  }) {
    return ProductCertificationsCompanion(
      productId: productId ?? this.productId,
      certificationId: certificationId ?? this.certificationId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (certificationId.present) {
      map['certification_id'] = Variable<String>(certificationId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCertificationsCompanion(')
          ..write('productId: $productId, ')
          ..write('certificationId: $certificationId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _articleIdMeta = const VerificationMeta(
    'articleId',
  );
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
    'article_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES articles (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, productId, articleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('article_id')) {
      context.handle(
        _articleIdMeta,
        articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      ),
      articleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_id'],
      ),
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final String? productId;
  final String? articleId;
  const Favorite({required this.id, this.productId, this.articleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || articleId != null) {
      map['article_id'] = Variable<String>(articleId);
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      articleId: articleId == null && nullToAbsent
          ? const Value.absent()
          : Value(articleId),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      articleId: serializer.fromJson<String?>(json['articleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String?>(productId),
      'articleId': serializer.toJson<String?>(articleId),
    };
  }

  Favorite copyWith({
    int? id,
    Value<String?> productId = const Value.absent(),
    Value<String?> articleId = const Value.absent(),
  }) => Favorite(
    id: id ?? this.id,
    productId: productId.present ? productId.value : this.productId,
    articleId: articleId.present ? articleId.value : this.articleId,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('articleId: $articleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, articleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.articleId == this.articleId);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<String?> productId;
  final Value<String?> articleId;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.articleId = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.articleId = const Value.absent(),
  });
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? articleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (articleId != null) 'article_id': articleId,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? id,
    Value<String?>? productId,
    Value<String?>? articleId,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      articleId: articleId ?? this.articleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('articleId: $articleId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $FormsTable forms = $FormsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $CertificationsTable certifications = $CertificationsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $ProductTagsTable productTags = $ProductTagsTable(this);
  late final $ProductCertificationsTable productCertifications =
      $ProductCertificationsTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    brands,
    categories,
    forms,
    tags,
    certifications,
    products,
    articles,
    productTags,
    productCertifications,
    favorites,
  ];
}

typedef $$BrandsTableCreateCompanionBuilder =
    BrandsCompanion Function({
      required String id,
      required String name,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
      Value<String?> logoUrl,
      Value<String?> iconUrl,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$BrandsTableUpdateCompanionBuilder =
    BrandsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
      Value<String?> logoUrl,
      Value<String?> iconUrl,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$BrandsTableReferences
    extends BaseReferences<_$AppDatabase, $BrandsTable, Brand> {
  $$BrandsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(db.brands.id, db.products.brandId),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.brandId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BrandsTableFilterComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.brandId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrandsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BrandsTable,
          Brand,
          $$BrandsTableFilterComposer,
          $$BrandsTableOrderingComposer,
          $$BrandsTableAnnotationComposer,
          $$BrandsTableCreateCompanionBuilder,
          $$BrandsTableUpdateCompanionBuilder,
          (Brand, $$BrandsTableReferences),
          Brand,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$BrandsTableTableManager(_$AppDatabase db, $BrandsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion(
                id: id,
                name: name,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
                logoUrl: logoUrl,
                iconUrl: iconUrl,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion.insert(
                id: id,
                name: name,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
                logoUrl: logoUrl,
                iconUrl: iconUrl,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BrandsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<Brand, $BrandsTable, Product>(
                      currentTable: table,
                      referencedTable: $$BrandsTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BrandsTableReferences(db, table, p0).productsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.brandId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BrandsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BrandsTable,
      Brand,
      $$BrandsTableFilterComposer,
      $$BrandsTableOrderingComposer,
      $$BrandsTableAnnotationComposer,
      $$BrandsTableCreateCompanionBuilder,
      $$BrandsTableUpdateCompanionBuilder,
      (Brand, $$BrandsTableReferences),
      Brand,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String slug,
      required String nameFr,
      Value<String?> nameEn,
      Value<String?> color,
      Value<String?> iconUrl,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> slug,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<String?> color,
      Value<String?> iconUrl,
      Value<int> rowid,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(
      db.categories.slug,
      db.products.categorySlug,
    ),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager($_db, $_db.products).filter(
      (f) => f.categorySlug.slug.sqlEquals($_itemColumn<String>('slug')!),
    );

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ArticlesTable, List<Article>> _articlesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.articles,
    aliasName: $_aliasNameGenerator(
      db.categories.slug,
      db.articles.categorySlug,
    ),
  );

  $$ArticlesTableProcessedTableManager get articlesRefs {
    final manager = $$ArticlesTableTableManager($_db, $_db.articles).filter(
      (f) => f.categorySlug.slug.sqlEquals($_itemColumn<String>('slug')!),
    );

    final cache = $_typedResult.readTableOrNull(_articlesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categorySlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> articlesRefs(
    Expression<bool> Function($$ArticlesTableFilterComposer f) f,
  ) {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.categorySlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableFilterComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get nameFr =>
      $composableBuilder(column: $table.nameFr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categorySlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> articlesRefs<T extends Object>(
    Expression<T> Function($$ArticlesTableAnnotationComposer a) f,
  ) {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.categorySlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableAnnotationComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool productsRefs, bool articlesRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> slug = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                slug: slug,
                nameFr: nameFr,
                nameEn: nameEn,
                color: color,
                iconUrl: iconUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String slug,
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                slug: slug,
                nameFr: nameFr,
                nameEn: nameEn,
                color: color,
                iconUrl: iconUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productsRefs = false, articlesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productsRefs) db.products,
                    if (articlesRefs) db.articles,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productsRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          Product
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._productsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).productsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categorySlug == item.slug,
                              ),
                          typedResults: items,
                        ),
                      if (articlesRefs)
                        await $_getPrefetchedData<
                          Category,
                          $CategoriesTable,
                          Article
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._articlesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).articlesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categorySlug == item.slug,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool productsRefs, bool articlesRefs})
    >;
typedef $$FormsTableCreateCompanionBuilder =
    FormsCompanion Function({
      required String slug,
      required String nameFr,
      Value<String?> nameEn,
      Value<int> rowid,
    });
typedef $$FormsTableUpdateCompanionBuilder =
    FormsCompanion Function({
      Value<String> slug,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<int> rowid,
    });

final class $$FormsTableReferences
    extends BaseReferences<_$AppDatabase, $FormsTable, Form> {
  $$FormsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(db.forms.slug, db.products.formSlug),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.formSlug.slug.sqlEquals($_itemColumn<String>('slug')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FormsTableFilterComposer extends Composer<_$AppDatabase, $FormsTable> {
  $$FormsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.formSlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FormsTableOrderingComposer
    extends Composer<_$AppDatabase, $FormsTable> {
  $$FormsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FormsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormsTable> {
  $$FormsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get nameFr =>
      $composableBuilder(column: $table.nameFr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slug,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.formSlug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FormsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FormsTable,
          Form,
          $$FormsTableFilterComposer,
          $$FormsTableOrderingComposer,
          $$FormsTableAnnotationComposer,
          $$FormsTableCreateCompanionBuilder,
          $$FormsTableUpdateCompanionBuilder,
          (Form, $$FormsTableReferences),
          Form,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$FormsTableTableManager(_$AppDatabase db, $FormsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> slug = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FormsCompanion(
                slug: slug,
                nameFr: nameFr,
                nameEn: nameEn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String slug,
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FormsCompanion.insert(
                slug: slug,
                nameFr: nameFr,
                nameEn: nameEn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$FormsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<Form, $FormsTable, Product>(
                      currentTable: table,
                      referencedTable: $$FormsTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FormsTableReferences(db, table, p0).productsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.formSlug == item.slug),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FormsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FormsTable,
      Form,
      $$FormsTableFilterComposer,
      $$FormsTableOrderingComposer,
      $$FormsTableAnnotationComposer,
      $$FormsTableCreateCompanionBuilder,
      $$FormsTableUpdateCompanionBuilder,
      (Form, $$FormsTableReferences),
      Form,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      required String id,
      required String nameFr,
      Value<String?> nameEn,
      Value<String?> iconUrl,
      Value<int> rowid,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<String> id,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<String?> iconUrl,
      Value<int> rowid,
    });

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTagsTable, List<ProductTag>>
  _productTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productTags,
    aliasName: $_aliasNameGenerator(db.tags.id, db.productTags.tagId),
  );

  $$ProductTagsTableProcessedTableManager get productTagsRefs {
    final manager = $$ProductTagsTableTableManager(
      $_db,
      $_db.productTags,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productTagsRefs(
    Expression<bool> Function($$ProductTagsTableFilterComposer f) f,
  ) {
    final $$ProductTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableFilterComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameFr =>
      $composableBuilder(column: $table.nameFr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  Expression<T> productTagsRefs<T extends Object>(
    Expression<T> Function($$ProductTagsTableAnnotationComposer a) f,
  ) {
    final $$ProductTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool productTagsRefs})
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                nameFr: nameFr,
                nameEn: nameEn,
                iconUrl: iconUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> iconUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                nameFr: nameFr,
                nameEn: nameEn,
                iconUrl: iconUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({productTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productTagsRefs) db.productTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, ProductTag>(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences
                          ._productTagsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).productTagsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool productTagsRefs})
    >;
typedef $$CertificationsTableCreateCompanionBuilder =
    CertificationsCompanion Function({
      required String id,
      required String nameFr,
      Value<String?> nameEn,
      Value<String?> logoUrl,
      Value<int> rowid,
    });
typedef $$CertificationsTableUpdateCompanionBuilder =
    CertificationsCompanion Function({
      Value<String> id,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<String?> logoUrl,
      Value<int> rowid,
    });

final class $$CertificationsTableReferences
    extends BaseReferences<_$AppDatabase, $CertificationsTable, Certification> {
  $$CertificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ProductCertificationsTable,
    List<ProductCertification>
  >
  _productCertificationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productCertifications,
        aliasName: $_aliasNameGenerator(
          db.certifications.id,
          db.productCertifications.certificationId,
        ),
      );

  $$ProductCertificationsTableProcessedTableManager
  get productCertificationsRefs {
    final manager =
        $$ProductCertificationsTableTableManager(
          $_db,
          $_db.productCertifications,
        ).filter(
          (f) => f.certificationId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _productCertificationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CertificationsTableFilterComposer
    extends Composer<_$AppDatabase, $CertificationsTable> {
  $$CertificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productCertificationsRefs(
    Expression<bool> Function($$ProductCertificationsTableFilterComposer f) f,
  ) {
    final $$ProductCertificationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCertifications,
          getReferencedColumn: (t) => t.certificationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCertificationsTableFilterComposer(
                $db: $db,
                $table: $db.productCertifications,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CertificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $CertificationsTable> {
  $$CertificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CertificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CertificationsTable> {
  $$CertificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameFr =>
      $composableBuilder(column: $table.nameFr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  Expression<T> productCertificationsRefs<T extends Object>(
    Expression<T> Function($$ProductCertificationsTableAnnotationComposer a) f,
  ) {
    final $$ProductCertificationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCertifications,
          getReferencedColumn: (t) => t.certificationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCertificationsTableAnnotationComposer(
                $db: $db,
                $table: $db.productCertifications,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CertificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CertificationsTable,
          Certification,
          $$CertificationsTableFilterComposer,
          $$CertificationsTableOrderingComposer,
          $$CertificationsTableAnnotationComposer,
          $$CertificationsTableCreateCompanionBuilder,
          $$CertificationsTableUpdateCompanionBuilder,
          (Certification, $$CertificationsTableReferences),
          Certification,
          PrefetchHooks Function({bool productCertificationsRefs})
        > {
  $$CertificationsTableTableManager(
    _$AppDatabase db,
    $CertificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CertificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CertificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CertificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CertificationsCompanion(
                id: id,
                nameFr: nameFr,
                nameEn: nameEn,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CertificationsCompanion.insert(
                id: id,
                nameFr: nameFr,
                nameEn: nameEn,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CertificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productCertificationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productCertificationsRefs) db.productCertifications,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productCertificationsRefs)
                    await $_getPrefetchedData<
                      Certification,
                      $CertificationsTable,
                      ProductCertification
                    >(
                      currentTable: table,
                      referencedTable: $$CertificationsTableReferences
                          ._productCertificationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CertificationsTableReferences(
                            db,
                            table,
                            p0,
                          ).productCertificationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.certificationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CertificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CertificationsTable,
      Certification,
      $$CertificationsTableFilterComposer,
      $$CertificationsTableOrderingComposer,
      $$CertificationsTableAnnotationComposer,
      $$CertificationsTableCreateCompanionBuilder,
      $$CertificationsTableUpdateCompanionBuilder,
      (Certification, $$CertificationsTableReferences),
      Certification,
      PrefetchHooks Function({bool productCertificationsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      Value<String?> brandId,
      Value<String?> categorySlug,
      Value<String?> formSlug,
      required String nameFr,
      Value<String?> nameEn,
      Value<String?> scientificName,
      Value<String?> volume,
      Value<String?> weight,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
      Value<String?> benefitsFr,
      Value<String?> benefitsEn,
      Value<String?> usageFr,
      Value<String?> usageEn,
      Value<String?> expertNoteFr,
      Value<String?> expertNoteEn,
      Value<String?> imageUrl,
      Value<String?> galleryUrls,
      Value<bool> isNew,
      Value<bool> isActive,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String?> brandId,
      Value<String?> categorySlug,
      Value<String?> formSlug,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<String?> scientificName,
      Value<String?> volume,
      Value<String?> weight,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
      Value<String?> benefitsFr,
      Value<String?> benefitsEn,
      Value<String?> usageFr,
      Value<String?> usageEn,
      Value<String?> expertNoteFr,
      Value<String?> expertNoteEn,
      Value<String?> imageUrl,
      Value<String?> galleryUrls,
      Value<bool> isNew,
      Value<bool> isActive,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BrandsTable _brandIdTable(_$AppDatabase db) => db.brands.createAlias(
    $_aliasNameGenerator(db.products.brandId, db.brands.id),
  );

  $$BrandsTableProcessedTableManager? get brandId {
    final $_column = $_itemColumn<String>('brand_id');
    if ($_column == null) return null;
    final manager = $$BrandsTableTableManager(
      $_db,
      $_db.brands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_brandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categorySlugTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.products.categorySlug, db.categories.slug),
      );

  $$CategoriesTableProcessedTableManager? get categorySlug {
    final $_column = $_itemColumn<String>('category_slug');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.slug.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categorySlugTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FormsTable _formSlugTable(_$AppDatabase db) => db.forms.createAlias(
    $_aliasNameGenerator(db.products.formSlug, db.forms.slug),
  );

  $$FormsTableProcessedTableManager? get formSlug {
    final $_column = $_itemColumn<String>('form_slug');
    if ($_column == null) return null;
    final manager = $$FormsTableTableManager(
      $_db,
      $_db.forms,
    ).filter((f) => f.slug.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_formSlugTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProductTagsTable, List<ProductTag>>
  _productTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productTags,
    aliasName: $_aliasNameGenerator(db.products.id, db.productTags.productId),
  );

  $$ProductTagsTableProcessedTableManager get productTagsRefs {
    final manager = $$ProductTagsTableTableManager(
      $_db,
      $_db.productTags,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ProductCertificationsTable,
    List<ProductCertification>
  >
  _productCertificationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productCertifications,
        aliasName: $_aliasNameGenerator(
          db.products.id,
          db.productCertifications.productId,
        ),
      );

  $$ProductCertificationsTableProcessedTableManager
  get productCertificationsRefs {
    final manager = $$ProductCertificationsTableTableManager(
      $_db,
      $_db.productCertifications,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productCertificationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FavoritesTable, List<Favorite>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: $_aliasNameGenerator(db.products.id, db.favorites.productId),
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get excerptFr => $composableBuilder(
    column: $table.excerptFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get excerptEn => $composableBuilder(
    column: $table.excerptEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get benefitsFr => $composableBuilder(
    column: $table.benefitsFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get benefitsEn => $composableBuilder(
    column: $table.benefitsEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usageFr => $composableBuilder(
    column: $table.usageFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usageEn => $composableBuilder(
    column: $table.usageEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expertNoteFr => $composableBuilder(
    column: $table.expertNoteFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expertNoteEn => $composableBuilder(
    column: $table.expertNoteEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get galleryUrls => $composableBuilder(
    column: $table.galleryUrls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BrandsTableFilterComposer get brandId {
    final $$BrandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableFilterComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categorySlug {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FormsTableFilterComposer get formSlug {
    final $$FormsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formSlug,
      referencedTable: $db.forms,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormsTableFilterComposer(
            $db: $db,
            $table: $db.forms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> productTagsRefs(
    Expression<bool> Function($$ProductTagsTableFilterComposer f) f,
  ) {
    final $$ProductTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableFilterComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productCertificationsRefs(
    Expression<bool> Function($$ProductCertificationsTableFilterComposer f) f,
  ) {
    final $$ProductCertificationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCertifications,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCertificationsTableFilterComposer(
                $db: $db,
                $table: $db.productCertifications,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFr => $composableBuilder(
    column: $table.nameFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get excerptFr => $composableBuilder(
    column: $table.excerptFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get excerptEn => $composableBuilder(
    column: $table.excerptEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get benefitsFr => $composableBuilder(
    column: $table.benefitsFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get benefitsEn => $composableBuilder(
    column: $table.benefitsEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usageFr => $composableBuilder(
    column: $table.usageFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usageEn => $composableBuilder(
    column: $table.usageEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expertNoteFr => $composableBuilder(
    column: $table.expertNoteFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expertNoteEn => $composableBuilder(
    column: $table.expertNoteEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get galleryUrls => $composableBuilder(
    column: $table.galleryUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BrandsTableOrderingComposer get brandId {
    final $$BrandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableOrderingComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categorySlug {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FormsTableOrderingComposer get formSlug {
    final $$FormsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formSlug,
      referencedTable: $db.forms,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormsTableOrderingComposer(
            $db: $db,
            $table: $db.forms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameFr =>
      $composableBuilder(column: $table.nameFr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<String> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get excerptFr =>
      $composableBuilder(column: $table.excerptFr, builder: (column) => column);

  GeneratedColumn<String> get excerptEn =>
      $composableBuilder(column: $table.excerptEn, builder: (column) => column);

  GeneratedColumn<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get benefitsFr => $composableBuilder(
    column: $table.benefitsFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get benefitsEn => $composableBuilder(
    column: $table.benefitsEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get usageFr =>
      $composableBuilder(column: $table.usageFr, builder: (column) => column);

  GeneratedColumn<String> get usageEn =>
      $composableBuilder(column: $table.usageEn, builder: (column) => column);

  GeneratedColumn<String> get expertNoteFr => $composableBuilder(
    column: $table.expertNoteFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expertNoteEn => $composableBuilder(
    column: $table.expertNoteEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get galleryUrls => $composableBuilder(
    column: $table.galleryUrls,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isNew =>
      $composableBuilder(column: $table.isNew, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$BrandsTableAnnotationComposer get brandId {
    final $$BrandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brandId,
      referencedTable: $db.brands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrandsTableAnnotationComposer(
            $db: $db,
            $table: $db.brands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categorySlug {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FormsTableAnnotationComposer get formSlug {
    final $$FormsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formSlug,
      referencedTable: $db.forms,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormsTableAnnotationComposer(
            $db: $db,
            $table: $db.forms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> productTagsRefs<T extends Object>(
    Expression<T> Function($$ProductTagsTableAnnotationComposer a) f,
  ) {
    final $$ProductTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productCertificationsRefs<T extends Object>(
    Expression<T> Function($$ProductCertificationsTableAnnotationComposer a) f,
  ) {
    final $$ProductCertificationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCertifications,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCertificationsTableAnnotationComposer(
                $db: $db,
                $table: $db.productCertifications,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({
            bool brandId,
            bool categorySlug,
            bool formSlug,
            bool productTagsRefs,
            bool productCertificationsRefs,
            bool favoritesRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> brandId = const Value.absent(),
                Value<String?> categorySlug = const Value.absent(),
                Value<String?> formSlug = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> scientificName = const Value.absent(),
                Value<String?> volume = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> benefitsFr = const Value.absent(),
                Value<String?> benefitsEn = const Value.absent(),
                Value<String?> usageFr = const Value.absent(),
                Value<String?> usageEn = const Value.absent(),
                Value<String?> expertNoteFr = const Value.absent(),
                Value<String?> expertNoteEn = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> galleryUrls = const Value.absent(),
                Value<bool> isNew = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                brandId: brandId,
                categorySlug: categorySlug,
                formSlug: formSlug,
                nameFr: nameFr,
                nameEn: nameEn,
                scientificName: scientificName,
                volume: volume,
                weight: weight,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
                benefitsFr: benefitsFr,
                benefitsEn: benefitsEn,
                usageFr: usageFr,
                usageEn: usageEn,
                expertNoteFr: expertNoteFr,
                expertNoteEn: expertNoteEn,
                imageUrl: imageUrl,
                galleryUrls: galleryUrls,
                isNew: isNew,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> brandId = const Value.absent(),
                Value<String?> categorySlug = const Value.absent(),
                Value<String?> formSlug = const Value.absent(),
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> scientificName = const Value.absent(),
                Value<String?> volume = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> benefitsFr = const Value.absent(),
                Value<String?> benefitsEn = const Value.absent(),
                Value<String?> usageFr = const Value.absent(),
                Value<String?> usageEn = const Value.absent(),
                Value<String?> expertNoteFr = const Value.absent(),
                Value<String?> expertNoteEn = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> galleryUrls = const Value.absent(),
                Value<bool> isNew = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                brandId: brandId,
                categorySlug: categorySlug,
                formSlug: formSlug,
                nameFr: nameFr,
                nameEn: nameEn,
                scientificName: scientificName,
                volume: volume,
                weight: weight,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
                benefitsFr: benefitsFr,
                benefitsEn: benefitsEn,
                usageFr: usageFr,
                usageEn: usageEn,
                expertNoteFr: expertNoteFr,
                expertNoteEn: expertNoteEn,
                imageUrl: imageUrl,
                galleryUrls: galleryUrls,
                isNew: isNew,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                brandId = false,
                categorySlug = false,
                formSlug = false,
                productTagsRefs = false,
                productCertificationsRefs = false,
                favoritesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productTagsRefs) db.productTags,
                    if (productCertificationsRefs) db.productCertifications,
                    if (favoritesRefs) db.favorites,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (brandId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.brandId,
                                    referencedTable: $$ProductsTableReferences
                                        ._brandIdTable(db),
                                    referencedColumn: $$ProductsTableReferences
                                        ._brandIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (categorySlug) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categorySlug,
                                    referencedTable: $$ProductsTableReferences
                                        ._categorySlugTable(db),
                                    referencedColumn: $$ProductsTableReferences
                                        ._categorySlugTable(db)
                                        .slug,
                                  )
                                  as T;
                        }
                        if (formSlug) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.formSlug,
                                    referencedTable: $$ProductsTableReferences
                                        ._formSlugTable(db),
                                    referencedColumn: $$ProductsTableReferences
                                        ._formSlugTable(db)
                                        .slug,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productTagsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          ProductTag
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productCertificationsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          ProductCertification
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productCertificationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productCertificationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (favoritesRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          Favorite
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({
        bool brandId,
        bool categorySlug,
        bool formSlug,
        bool productTagsRefs,
        bool productCertificationsRefs,
        bool favoritesRefs,
      })
    >;
typedef $$ArticlesTableCreateCompanionBuilder =
    ArticlesCompanion Function({
      required String id,
      Value<String?> categorySlug,
      required String titleFr,
      Value<String?> titleEn,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> contentFr,
      Value<String?> contentEn,
      Value<String?> imageUrl,
      Value<int?> readTimeMinutes,
      Value<DateTime?> publishedAt,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$ArticlesTableUpdateCompanionBuilder =
    ArticlesCompanion Function({
      Value<String> id,
      Value<String?> categorySlug,
      Value<String> titleFr,
      Value<String?> titleEn,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> contentFr,
      Value<String?> contentEn,
      Value<String?> imageUrl,
      Value<int?> readTimeMinutes,
      Value<DateTime?> publishedAt,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$ArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $ArticlesTable, Article> {
  $$ArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categorySlugTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.articles.categorySlug, db.categories.slug),
      );

  $$CategoriesTableProcessedTableManager? get categorySlug {
    final $_column = $_itemColumn<String>('category_slug');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.slug.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categorySlugTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FavoritesTable, List<Favorite>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: $_aliasNameGenerator(db.articles.id, db.favorites.articleId),
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.articleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleFr => $composableBuilder(
    column: $table.titleFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get excerptFr => $composableBuilder(
    column: $table.excerptFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get excerptEn => $composableBuilder(
    column: $table.excerptEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentFr => $composableBuilder(
    column: $table.contentFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentEn => $composableBuilder(
    column: $table.contentEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readTimeMinutes => $composableBuilder(
    column: $table.readTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categorySlug {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.articleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleFr => $composableBuilder(
    column: $table.titleFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get excerptFr => $composableBuilder(
    column: $table.excerptFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get excerptEn => $composableBuilder(
    column: $table.excerptEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentFr => $composableBuilder(
    column: $table.contentFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentEn => $composableBuilder(
    column: $table.contentEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readTimeMinutes => $composableBuilder(
    column: $table.readTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categorySlug {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titleFr =>
      $composableBuilder(column: $table.titleFr, builder: (column) => column);

  GeneratedColumn<String> get titleEn =>
      $composableBuilder(column: $table.titleEn, builder: (column) => column);

  GeneratedColumn<String> get excerptFr =>
      $composableBuilder(column: $table.excerptFr, builder: (column) => column);

  GeneratedColumn<String> get excerptEn =>
      $composableBuilder(column: $table.excerptEn, builder: (column) => column);

  GeneratedColumn<String> get contentFr =>
      $composableBuilder(column: $table.contentFr, builder: (column) => column);

  GeneratedColumn<String> get contentEn =>
      $composableBuilder(column: $table.contentEn, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get readTimeMinutes => $composableBuilder(
    column: $table.readTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categorySlug {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categorySlug,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.slug,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.articleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArticlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArticlesTable,
          Article,
          $$ArticlesTableFilterComposer,
          $$ArticlesTableOrderingComposer,
          $$ArticlesTableAnnotationComposer,
          $$ArticlesTableCreateCompanionBuilder,
          $$ArticlesTableUpdateCompanionBuilder,
          (Article, $$ArticlesTableReferences),
          Article,
          PrefetchHooks Function({bool categorySlug, bool favoritesRefs})
        > {
  $$ArticlesTableTableManager(_$AppDatabase db, $ArticlesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> categorySlug = const Value.absent(),
                Value<String> titleFr = const Value.absent(),
                Value<String?> titleEn = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> contentFr = const Value.absent(),
                Value<String?> contentEn = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int?> readTimeMinutes = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArticlesCompanion(
                id: id,
                categorySlug: categorySlug,
                titleFr: titleFr,
                titleEn: titleEn,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                contentFr: contentFr,
                contentEn: contentEn,
                imageUrl: imageUrl,
                readTimeMinutes: readTimeMinutes,
                publishedAt: publishedAt,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> categorySlug = const Value.absent(),
                required String titleFr,
                Value<String?> titleEn = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> contentFr = const Value.absent(),
                Value<String?> contentEn = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int?> readTimeMinutes = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArticlesCompanion.insert(
                id: id,
                categorySlug: categorySlug,
                titleFr: titleFr,
                titleEn: titleEn,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                contentFr: contentFr,
                contentEn: contentEn,
                imageUrl: imageUrl,
                readTimeMinutes: readTimeMinutes,
                publishedAt: publishedAt,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArticlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categorySlug = false, favoritesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (favoritesRefs) db.favorites],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categorySlug) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categorySlug,
                                    referencedTable: $$ArticlesTableReferences
                                        ._categorySlugTable(db),
                                    referencedColumn: $$ArticlesTableReferences
                                        ._categorySlugTable(db)
                                        .slug,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (favoritesRefs)
                        await $_getPrefetchedData<
                          Article,
                          $ArticlesTable,
                          Favorite
                        >(
                          currentTable: table,
                          referencedTable: $$ArticlesTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArticlesTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.articleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ArticlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArticlesTable,
      Article,
      $$ArticlesTableFilterComposer,
      $$ArticlesTableOrderingComposer,
      $$ArticlesTableAnnotationComposer,
      $$ArticlesTableCreateCompanionBuilder,
      $$ArticlesTableUpdateCompanionBuilder,
      (Article, $$ArticlesTableReferences),
      Article,
      PrefetchHooks Function({bool categorySlug, bool favoritesRefs})
    >;
typedef $$ProductTagsTableCreateCompanionBuilder =
    ProductTagsCompanion Function({
      required String productId,
      required String tagId,
      Value<int> rowid,
    });
typedef $$ProductTagsTableUpdateCompanionBuilder =
    ProductTagsCompanion Function({
      Value<String> productId,
      Value<String> tagId,
      Value<int> rowid,
    });

final class $$ProductTagsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductTagsTable, ProductTag> {
  $$ProductTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.productTags.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) => db.tags.createAlias(
    $_aliasNameGenerator(db.productTags.tagId, db.tags.id),
  );

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductTagsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTagsTable,
          ProductTag,
          $$ProductTagsTableFilterComposer,
          $$ProductTagsTableOrderingComposer,
          $$ProductTagsTableAnnotationComposer,
          $$ProductTagsTableCreateCompanionBuilder,
          $$ProductTagsTableUpdateCompanionBuilder,
          (ProductTag, $$ProductTagsTableReferences),
          ProductTag,
          PrefetchHooks Function({bool productId, bool tagId})
        > {
  $$ProductTagsTableTableManager(_$AppDatabase db, $ProductTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion(
                productId: productId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion.insert(
                productId: productId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$ProductTagsTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$ProductTagsTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$ProductTagsTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$ProductTagsTableReferences
                                    ._tagIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTagsTable,
      ProductTag,
      $$ProductTagsTableFilterComposer,
      $$ProductTagsTableOrderingComposer,
      $$ProductTagsTableAnnotationComposer,
      $$ProductTagsTableCreateCompanionBuilder,
      $$ProductTagsTableUpdateCompanionBuilder,
      (ProductTag, $$ProductTagsTableReferences),
      ProductTag,
      PrefetchHooks Function({bool productId, bool tagId})
    >;
typedef $$ProductCertificationsTableCreateCompanionBuilder =
    ProductCertificationsCompanion Function({
      required String productId,
      required String certificationId,
      Value<int> rowid,
    });
typedef $$ProductCertificationsTableUpdateCompanionBuilder =
    ProductCertificationsCompanion Function({
      Value<String> productId,
      Value<String> certificationId,
      Value<int> rowid,
    });

final class $$ProductCertificationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductCertificationsTable,
          ProductCertification
        > {
  $$ProductCertificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(
          db.productCertifications.productId,
          db.products.id,
        ),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CertificationsTable _certificationIdTable(_$AppDatabase db) =>
      db.certifications.createAlias(
        $_aliasNameGenerator(
          db.productCertifications.certificationId,
          db.certifications.id,
        ),
      );

  $$CertificationsTableProcessedTableManager get certificationId {
    final $_column = $_itemColumn<String>('certification_id')!;

    final manager = $$CertificationsTableTableManager(
      $_db,
      $_db.certifications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_certificationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductCertificationsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductCertificationsTable> {
  $$ProductCertificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CertificationsTableFilterComposer get certificationId {
    final $$CertificationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.certificationId,
      referencedTable: $db.certifications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CertificationsTableFilterComposer(
            $db: $db,
            $table: $db.certifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCertificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductCertificationsTable> {
  $$ProductCertificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CertificationsTableOrderingComposer get certificationId {
    final $$CertificationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.certificationId,
      referencedTable: $db.certifications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CertificationsTableOrderingComposer(
            $db: $db,
            $table: $db.certifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCertificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductCertificationsTable> {
  $$ProductCertificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CertificationsTableAnnotationComposer get certificationId {
    final $$CertificationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.certificationId,
      referencedTable: $db.certifications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CertificationsTableAnnotationComposer(
            $db: $db,
            $table: $db.certifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCertificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductCertificationsTable,
          ProductCertification,
          $$ProductCertificationsTableFilterComposer,
          $$ProductCertificationsTableOrderingComposer,
          $$ProductCertificationsTableAnnotationComposer,
          $$ProductCertificationsTableCreateCompanionBuilder,
          $$ProductCertificationsTableUpdateCompanionBuilder,
          (ProductCertification, $$ProductCertificationsTableReferences),
          ProductCertification,
          PrefetchHooks Function({bool productId, bool certificationId})
        > {
  $$ProductCertificationsTableTableManager(
    _$AppDatabase db,
    $ProductCertificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCertificationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProductCertificationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductCertificationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> certificationId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductCertificationsCompanion(
                productId: productId,
                certificationId: certificationId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String certificationId,
                Value<int> rowid = const Value.absent(),
              }) => ProductCertificationsCompanion.insert(
                productId: productId,
                certificationId: certificationId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductCertificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, certificationId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$ProductCertificationsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$ProductCertificationsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (certificationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.certificationId,
                                    referencedTable:
                                        $$ProductCertificationsTableReferences
                                            ._certificationIdTable(db),
                                    referencedColumn:
                                        $$ProductCertificationsTableReferences
                                            ._certificationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ProductCertificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductCertificationsTable,
      ProductCertification,
      $$ProductCertificationsTableFilterComposer,
      $$ProductCertificationsTableOrderingComposer,
      $$ProductCertificationsTableAnnotationComposer,
      $$ProductCertificationsTableCreateCompanionBuilder,
      $$ProductCertificationsTableUpdateCompanionBuilder,
      (ProductCertification, $$ProductCertificationsTableReferences),
      ProductCertification,
      PrefetchHooks Function({bool productId, bool certificationId})
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<String?> productId,
      Value<String?> articleId,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<String?> productId,
      Value<String?> articleId,
    });

final class $$FavoritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavoritesTable, Favorite> {
  $$FavoritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.favorites.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager? get productId {
    final $_column = $_itemColumn<String>('product_id');
    if ($_column == null) return null;
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ArticlesTable _articleIdTable(_$AppDatabase db) =>
      db.articles.createAlias(
        $_aliasNameGenerator(db.favorites.articleId, db.articles.id),
      );

  $$ArticlesTableProcessedTableManager? get articleId {
    final $_column = $_itemColumn<String>('article_id');
    if ($_column == null) return null;
    final manager = $$ArticlesTableTableManager(
      $_db,
      $_db.articles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_articleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ArticlesTableFilterComposer get articleId {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleId,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableFilterComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ArticlesTableOrderingComposer get articleId {
    final $$ArticlesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleId,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableOrderingComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ArticlesTableAnnotationComposer get articleId {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleId,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableAnnotationComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, $$FavoritesTableReferences),
          Favorite,
          PrefetchHooks Function({bool productId, bool articleId})
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> articleId = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                productId: productId,
                articleId: articleId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> articleId = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                productId: productId,
                articleId: articleId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoritesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, articleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$FavoritesTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$FavoritesTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (articleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.articleId,
                                referencedTable: $$FavoritesTableReferences
                                    ._articleIdTable(db),
                                referencedColumn: $$FavoritesTableReferences
                                    ._articleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, $$FavoritesTableReferences),
      Favorite,
      PrefetchHooks Function({bool productId, bool articleId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db, _db.brands);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$FormsTableTableManager get forms =>
      $$FormsTableTableManager(_db, _db.forms);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$CertificationsTableTableManager get certifications =>
      $$CertificationsTableTableManager(_db, _db.certifications);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
  $$ProductTagsTableTableManager get productTags =>
      $$ProductTagsTableTableManager(_db, _db.productTags);
  $$ProductCertificationsTableTableManager get productCertifications =>
      $$ProductCertificationsTableTableManager(_db, _db.productCertifications);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
