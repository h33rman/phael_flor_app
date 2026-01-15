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
    logoUrl,
    descriptionFr,
    descriptionEn,
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
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
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
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      descriptionFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_fr'],
      ),
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
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
  final String? logoUrl;
  final String? descriptionFr;
  final String? descriptionEn;
  final DateTime? createdAt;
  const Brand({
    required this.id,
    required this.name,
    this.logoUrl,
    this.descriptionFr,
    this.descriptionEn,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || descriptionFr != null) {
      map['description_fr'] = Variable<String>(descriptionFr);
    }
    if (!nullToAbsent || descriptionEn != null) {
      map['description_en'] = Variable<String>(descriptionEn);
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
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      descriptionFr: descriptionFr == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionFr),
      descriptionEn: descriptionEn == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionEn),
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
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      descriptionFr: serializer.fromJson<String?>(json['descriptionFr']),
      descriptionEn: serializer.fromJson<String?>(json['descriptionEn']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'descriptionFr': serializer.toJson<String?>(descriptionFr),
      'descriptionEn': serializer.toJson<String?>(descriptionEn),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  Brand copyWith({
    String? id,
    String? name,
    Value<String?> logoUrl = const Value.absent(),
    Value<String?> descriptionFr = const Value.absent(),
    Value<String?> descriptionEn = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
  }) => Brand(
    id: id ?? this.id,
    name: name ?? this.name,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    descriptionFr: descriptionFr.present
        ? descriptionFr.value
        : this.descriptionFr,
    descriptionEn: descriptionEn.present
        ? descriptionEn.value
        : this.descriptionEn,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  Brand copyWithCompanion(BrandsCompanion data) {
    return Brand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      descriptionFr: data.descriptionFr.present
          ? data.descriptionFr.value
          : this.descriptionFr,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, logoUrl, descriptionFr, descriptionEn, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brand &&
          other.id == this.id &&
          other.name == this.name &&
          other.logoUrl == this.logoUrl &&
          other.descriptionFr == this.descriptionFr &&
          other.descriptionEn == this.descriptionEn &&
          other.createdAt == this.createdAt);
}

class BrandsCompanion extends UpdateCompanion<Brand> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> logoUrl;
  final Value<String?> descriptionFr;
  final Value<String?> descriptionEn;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BrandsCompanion.insert({
    required String id,
    required String name,
    this.logoUrl = const Value.absent(),
    this.descriptionFr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Brand> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? logoUrl,
    Expression<String>? descriptionFr,
    Expression<String>? descriptionEn,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (descriptionFr != null) 'description_fr': descriptionFr,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BrandsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? logoUrl,
    Value<String?>? descriptionFr,
    Value<String?>? descriptionEn,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      descriptionFr: descriptionFr ?? this.descriptionFr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
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
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (descriptionFr.present) {
      map['description_fr'] = Variable<String>(descriptionFr.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
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
          ..write('logoUrl: $logoUrl, ')
          ..write('descriptionFr: $descriptionFr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('createdAt: $createdAt, ')
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brands (id)',
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
  static const VerificationMeta _formMeta = const VerificationMeta('form');
  @override
  late final GeneratedColumn<String> form = GeneratedColumn<String>(
    'form',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightVolumeMeta = const VerificationMeta(
    'weightVolume',
  );
  @override
  late final GeneratedColumn<String> weightVolume = GeneratedColumn<String>(
    'weight_volume',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _certificationsMeta = const VerificationMeta(
    'certifications',
  );
  @override
  late final GeneratedColumn<String> certifications = GeneratedColumn<String>(
    'certifications',
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
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bienfaitsFrMeta = const VerificationMeta(
    'bienfaitsFr',
  );
  @override
  late final GeneratedColumn<String> bienfaitsFr = GeneratedColumn<String>(
    'bienfaits_fr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bienfaitsEnMeta = const VerificationMeta(
    'bienfaitsEn',
  );
  @override
  late final GeneratedColumn<String> bienfaitsEn = GeneratedColumn<String>(
    'bienfaits_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usagesMeta = const VerificationMeta('usages');
  @override
  late final GeneratedColumn<String> usages = GeneratedColumn<String>(
    'usages',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    nameFr,
    nameEn,
    scientificName,
    form,
    category,
    weightVolume,
    ingredients,
    certifications,
    imageUrl,
    galleryUrls,
    tags,
    bienfaitsFr,
    bienfaitsEn,
    usages,
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
    } else if (isInserting) {
      context.missing(_brandIdMeta);
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
    if (data.containsKey('form')) {
      context.handle(
        _formMeta,
        form.isAcceptableOrUnknown(data['form']!, _formMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('weight_volume')) {
      context.handle(
        _weightVolumeMeta,
        weightVolume.isAcceptableOrUnknown(
          data['weight_volume']!,
          _weightVolumeMeta,
        ),
      );
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    }
    if (data.containsKey('certifications')) {
      context.handle(
        _certificationsMeta,
        certifications.isAcceptableOrUnknown(
          data['certifications']!,
          _certificationsMeta,
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
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('bienfaits_fr')) {
      context.handle(
        _bienfaitsFrMeta,
        bienfaitsFr.isAcceptableOrUnknown(
          data['bienfaits_fr']!,
          _bienfaitsFrMeta,
        ),
      );
    }
    if (data.containsKey('bienfaits_en')) {
      context.handle(
        _bienfaitsEnMeta,
        bienfaitsEn.isAcceptableOrUnknown(
          data['bienfaits_en']!,
          _bienfaitsEnMeta,
        ),
      );
    }
    if (data.containsKey('usages')) {
      context.handle(
        _usagesMeta,
        usages.isAcceptableOrUnknown(data['usages']!, _usagesMeta),
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
      )!,
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
      form: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      weightVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight_volume'],
      ),
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      ),
      certifications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certifications'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      galleryUrls: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gallery_urls'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      bienfaitsFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bienfaits_fr'],
      ),
      bienfaitsEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bienfaits_en'],
      ),
      usages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usages'],
      ),
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
  final String brandId;
  final String nameFr;
  final String? nameEn;
  final String? scientificName;
  final String? form;
  final String? category;
  final String? weightVolume;
  final String? ingredients;
  final String? certifications;
  final String? imageUrl;
  final String? galleryUrls;
  final String? tags;
  final String? bienfaitsFr;
  final String? bienfaitsEn;
  final String? usages;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Product({
    required this.id,
    required this.brandId,
    required this.nameFr,
    this.nameEn,
    this.scientificName,
    this.form,
    this.category,
    this.weightVolume,
    this.ingredients,
    this.certifications,
    this.imageUrl,
    this.galleryUrls,
    this.tags,
    this.bienfaitsFr,
    this.bienfaitsEn,
    this.usages,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['brand_id'] = Variable<String>(brandId);
    map['name_fr'] = Variable<String>(nameFr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || scientificName != null) {
      map['scientific_name'] = Variable<String>(scientificName);
    }
    if (!nullToAbsent || form != null) {
      map['form'] = Variable<String>(form);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || weightVolume != null) {
      map['weight_volume'] = Variable<String>(weightVolume);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(ingredients);
    }
    if (!nullToAbsent || certifications != null) {
      map['certifications'] = Variable<String>(certifications);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || galleryUrls != null) {
      map['gallery_urls'] = Variable<String>(galleryUrls);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || bienfaitsFr != null) {
      map['bienfaits_fr'] = Variable<String>(bienfaitsFr);
    }
    if (!nullToAbsent || bienfaitsEn != null) {
      map['bienfaits_en'] = Variable<String>(bienfaitsEn);
    }
    if (!nullToAbsent || usages != null) {
      map['usages'] = Variable<String>(usages);
    }
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
      brandId: Value(brandId),
      nameFr: Value(nameFr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      scientificName: scientificName == null && nullToAbsent
          ? const Value.absent()
          : Value(scientificName),
      form: form == null && nullToAbsent ? const Value.absent() : Value(form),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      weightVolume: weightVolume == null && nullToAbsent
          ? const Value.absent()
          : Value(weightVolume),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      certifications: certifications == null && nullToAbsent
          ? const Value.absent()
          : Value(certifications),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      galleryUrls: galleryUrls == null && nullToAbsent
          ? const Value.absent()
          : Value(galleryUrls),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      bienfaitsFr: bienfaitsFr == null && nullToAbsent
          ? const Value.absent()
          : Value(bienfaitsFr),
      bienfaitsEn: bienfaitsEn == null && nullToAbsent
          ? const Value.absent()
          : Value(bienfaitsEn),
      usages: usages == null && nullToAbsent
          ? const Value.absent()
          : Value(usages),
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
      brandId: serializer.fromJson<String>(json['brandId']),
      nameFr: serializer.fromJson<String>(json['nameFr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      scientificName: serializer.fromJson<String?>(json['scientificName']),
      form: serializer.fromJson<String?>(json['form']),
      category: serializer.fromJson<String?>(json['category']),
      weightVolume: serializer.fromJson<String?>(json['weightVolume']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
      certifications: serializer.fromJson<String?>(json['certifications']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      galleryUrls: serializer.fromJson<String?>(json['galleryUrls']),
      tags: serializer.fromJson<String?>(json['tags']),
      bienfaitsFr: serializer.fromJson<String?>(json['bienfaitsFr']),
      bienfaitsEn: serializer.fromJson<String?>(json['bienfaitsEn']),
      usages: serializer.fromJson<String?>(json['usages']),
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
      'brandId': serializer.toJson<String>(brandId),
      'nameFr': serializer.toJson<String>(nameFr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'scientificName': serializer.toJson<String?>(scientificName),
      'form': serializer.toJson<String?>(form),
      'category': serializer.toJson<String?>(category),
      'weightVolume': serializer.toJson<String?>(weightVolume),
      'ingredients': serializer.toJson<String?>(ingredients),
      'certifications': serializer.toJson<String?>(certifications),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'galleryUrls': serializer.toJson<String?>(galleryUrls),
      'tags': serializer.toJson<String?>(tags),
      'bienfaitsFr': serializer.toJson<String?>(bienfaitsFr),
      'bienfaitsEn': serializer.toJson<String?>(bienfaitsEn),
      'usages': serializer.toJson<String?>(usages),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Product copyWith({
    String? id,
    String? brandId,
    String? nameFr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> scientificName = const Value.absent(),
    Value<String?> form = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> weightVolume = const Value.absent(),
    Value<String?> ingredients = const Value.absent(),
    Value<String?> certifications = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> galleryUrls = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    Value<String?> bienfaitsFr = const Value.absent(),
    Value<String?> bienfaitsEn = const Value.absent(),
    Value<String?> usages = const Value.absent(),
    bool? isActive,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Product(
    id: id ?? this.id,
    brandId: brandId ?? this.brandId,
    nameFr: nameFr ?? this.nameFr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    scientificName: scientificName.present
        ? scientificName.value
        : this.scientificName,
    form: form.present ? form.value : this.form,
    category: category.present ? category.value : this.category,
    weightVolume: weightVolume.present ? weightVolume.value : this.weightVolume,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
    certifications: certifications.present
        ? certifications.value
        : this.certifications,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    galleryUrls: galleryUrls.present ? galleryUrls.value : this.galleryUrls,
    tags: tags.present ? tags.value : this.tags,
    bienfaitsFr: bienfaitsFr.present ? bienfaitsFr.value : this.bienfaitsFr,
    bienfaitsEn: bienfaitsEn.present ? bienfaitsEn.value : this.bienfaitsEn,
    usages: usages.present ? usages.value : this.usages,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      nameFr: data.nameFr.present ? data.nameFr.value : this.nameFr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      scientificName: data.scientificName.present
          ? data.scientificName.value
          : this.scientificName,
      form: data.form.present ? data.form.value : this.form,
      category: data.category.present ? data.category.value : this.category,
      weightVolume: data.weightVolume.present
          ? data.weightVolume.value
          : this.weightVolume,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      certifications: data.certifications.present
          ? data.certifications.value
          : this.certifications,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      galleryUrls: data.galleryUrls.present
          ? data.galleryUrls.value
          : this.galleryUrls,
      tags: data.tags.present ? data.tags.value : this.tags,
      bienfaitsFr: data.bienfaitsFr.present
          ? data.bienfaitsFr.value
          : this.bienfaitsFr,
      bienfaitsEn: data.bienfaitsEn.present
          ? data.bienfaitsEn.value
          : this.bienfaitsEn,
      usages: data.usages.present ? data.usages.value : this.usages,
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
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('scientificName: $scientificName, ')
          ..write('form: $form, ')
          ..write('category: $category, ')
          ..write('weightVolume: $weightVolume, ')
          ..write('ingredients: $ingredients, ')
          ..write('certifications: $certifications, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('galleryUrls: $galleryUrls, ')
          ..write('tags: $tags, ')
          ..write('bienfaitsFr: $bienfaitsFr, ')
          ..write('bienfaitsEn: $bienfaitsEn, ')
          ..write('usages: $usages, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    brandId,
    nameFr,
    nameEn,
    scientificName,
    form,
    category,
    weightVolume,
    ingredients,
    certifications,
    imageUrl,
    galleryUrls,
    tags,
    bienfaitsFr,
    bienfaitsEn,
    usages,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.nameFr == this.nameFr &&
          other.nameEn == this.nameEn &&
          other.scientificName == this.scientificName &&
          other.form == this.form &&
          other.category == this.category &&
          other.weightVolume == this.weightVolume &&
          other.ingredients == this.ingredients &&
          other.certifications == this.certifications &&
          other.imageUrl == this.imageUrl &&
          other.galleryUrls == this.galleryUrls &&
          other.tags == this.tags &&
          other.bienfaitsFr == this.bienfaitsFr &&
          other.bienfaitsEn == this.bienfaitsEn &&
          other.usages == this.usages &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> brandId;
  final Value<String> nameFr;
  final Value<String?> nameEn;
  final Value<String?> scientificName;
  final Value<String?> form;
  final Value<String?> category;
  final Value<String?> weightVolume;
  final Value<String?> ingredients;
  final Value<String?> certifications;
  final Value<String?> imageUrl;
  final Value<String?> galleryUrls;
  final Value<String?> tags;
  final Value<String?> bienfaitsFr;
  final Value<String?> bienfaitsEn;
  final Value<String?> usages;
  final Value<bool> isActive;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.nameFr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.form = const Value.absent(),
    this.category = const Value.absent(),
    this.weightVolume = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.certifications = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.galleryUrls = const Value.absent(),
    this.tags = const Value.absent(),
    this.bienfaitsFr = const Value.absent(),
    this.bienfaitsEn = const Value.absent(),
    this.usages = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String brandId,
    required String nameFr,
    this.nameEn = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.form = const Value.absent(),
    this.category = const Value.absent(),
    this.weightVolume = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.certifications = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.galleryUrls = const Value.absent(),
    this.tags = const Value.absent(),
    this.bienfaitsFr = const Value.absent(),
    this.bienfaitsEn = const Value.absent(),
    this.usages = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       brandId = Value(brandId),
       nameFr = Value(nameFr);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? brandId,
    Expression<String>? nameFr,
    Expression<String>? nameEn,
    Expression<String>? scientificName,
    Expression<String>? form,
    Expression<String>? category,
    Expression<String>? weightVolume,
    Expression<String>? ingredients,
    Expression<String>? certifications,
    Expression<String>? imageUrl,
    Expression<String>? galleryUrls,
    Expression<String>? tags,
    Expression<String>? bienfaitsFr,
    Expression<String>? bienfaitsEn,
    Expression<String>? usages,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (nameFr != null) 'name_fr': nameFr,
      if (nameEn != null) 'name_en': nameEn,
      if (scientificName != null) 'scientific_name': scientificName,
      if (form != null) 'form': form,
      if (category != null) 'category': category,
      if (weightVolume != null) 'weight_volume': weightVolume,
      if (ingredients != null) 'ingredients': ingredients,
      if (certifications != null) 'certifications': certifications,
      if (imageUrl != null) 'image_url': imageUrl,
      if (galleryUrls != null) 'gallery_urls': galleryUrls,
      if (tags != null) 'tags': tags,
      if (bienfaitsFr != null) 'bienfaits_fr': bienfaitsFr,
      if (bienfaitsEn != null) 'bienfaits_en': bienfaitsEn,
      if (usages != null) 'usages': usages,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? brandId,
    Value<String>? nameFr,
    Value<String?>? nameEn,
    Value<String?>? scientificName,
    Value<String?>? form,
    Value<String?>? category,
    Value<String?>? weightVolume,
    Value<String?>? ingredients,
    Value<String?>? certifications,
    Value<String?>? imageUrl,
    Value<String?>? galleryUrls,
    Value<String?>? tags,
    Value<String?>? bienfaitsFr,
    Value<String?>? bienfaitsEn,
    Value<String?>? usages,
    Value<bool>? isActive,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      nameFr: nameFr ?? this.nameFr,
      nameEn: nameEn ?? this.nameEn,
      scientificName: scientificName ?? this.scientificName,
      form: form ?? this.form,
      category: category ?? this.category,
      weightVolume: weightVolume ?? this.weightVolume,
      ingredients: ingredients ?? this.ingredients,
      certifications: certifications ?? this.certifications,
      imageUrl: imageUrl ?? this.imageUrl,
      galleryUrls: galleryUrls ?? this.galleryUrls,
      tags: tags ?? this.tags,
      bienfaitsFr: bienfaitsFr ?? this.bienfaitsFr,
      bienfaitsEn: bienfaitsEn ?? this.bienfaitsEn,
      usages: usages ?? this.usages,
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
    if (nameFr.present) {
      map['name_fr'] = Variable<String>(nameFr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (scientificName.present) {
      map['scientific_name'] = Variable<String>(scientificName.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(form.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (weightVolume.present) {
      map['weight_volume'] = Variable<String>(weightVolume.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (certifications.present) {
      map['certifications'] = Variable<String>(certifications.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (galleryUrls.present) {
      map['gallery_urls'] = Variable<String>(galleryUrls.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (bienfaitsFr.present) {
      map['bienfaits_fr'] = Variable<String>(bienfaitsFr.value);
    }
    if (bienfaitsEn.present) {
      map['bienfaits_en'] = Variable<String>(bienfaitsEn.value);
    }
    if (usages.present) {
      map['usages'] = Variable<String>(usages.value);
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
          ..write('nameFr: $nameFr, ')
          ..write('nameEn: $nameEn, ')
          ..write('scientificName: $scientificName, ')
          ..write('form: $form, ')
          ..write('category: $category, ')
          ..write('weightVolume: $weightVolume, ')
          ..write('ingredients: $ingredients, ')
          ..write('certifications: $certifications, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('galleryUrls: $galleryUrls, ')
          ..write('tags: $tags, ')
          ..write('bienfaitsFr: $bienfaitsFr, ')
          ..write('bienfaitsEn: $bienfaitsEn, ')
          ..write('usages: $usages, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FormLabelsTable extends FormLabels
    with TableInfo<$FormLabelsTable, FormLabel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormLabelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelFrMeta = const VerificationMeta(
    'labelFr',
  );
  @override
  late final GeneratedColumn<String> labelFr = GeneratedColumn<String>(
    'label_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelEnMeta = const VerificationMeta(
    'labelEn',
  );
  @override
  late final GeneratedColumn<String> labelEn = GeneratedColumn<String>(
    'label_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, labelFr, labelEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'form_labels';
  @override
  VerificationContext validateIntegrity(
    Insertable<FormLabel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('label_fr')) {
      context.handle(
        _labelFrMeta,
        labelFr.isAcceptableOrUnknown(data['label_fr']!, _labelFrMeta),
      );
    } else if (isInserting) {
      context.missing(_labelFrMeta);
    }
    if (data.containsKey('label_en')) {
      context.handle(
        _labelEnMeta,
        labelEn.isAcceptableOrUnknown(data['label_en']!, _labelEnMeta),
      );
    } else if (isInserting) {
      context.missing(_labelEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  FormLabel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormLabel(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      labelFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_fr'],
      )!,
      labelEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_en'],
      )!,
    );
  }

  @override
  $FormLabelsTable createAlias(String alias) {
    return $FormLabelsTable(attachedDatabase, alias);
  }
}

class FormLabel extends DataClass implements Insertable<FormLabel> {
  final String key;
  final String labelFr;
  final String labelEn;
  const FormLabel({
    required this.key,
    required this.labelFr,
    required this.labelEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['label_fr'] = Variable<String>(labelFr);
    map['label_en'] = Variable<String>(labelEn);
    return map;
  }

  FormLabelsCompanion toCompanion(bool nullToAbsent) {
    return FormLabelsCompanion(
      key: Value(key),
      labelFr: Value(labelFr),
      labelEn: Value(labelEn),
    );
  }

  factory FormLabel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormLabel(
      key: serializer.fromJson<String>(json['key']),
      labelFr: serializer.fromJson<String>(json['labelFr']),
      labelEn: serializer.fromJson<String>(json['labelEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'labelFr': serializer.toJson<String>(labelFr),
      'labelEn': serializer.toJson<String>(labelEn),
    };
  }

  FormLabel copyWith({String? key, String? labelFr, String? labelEn}) =>
      FormLabel(
        key: key ?? this.key,
        labelFr: labelFr ?? this.labelFr,
        labelEn: labelEn ?? this.labelEn,
      );
  FormLabel copyWithCompanion(FormLabelsCompanion data) {
    return FormLabel(
      key: data.key.present ? data.key.value : this.key,
      labelFr: data.labelFr.present ? data.labelFr.value : this.labelFr,
      labelEn: data.labelEn.present ? data.labelEn.value : this.labelEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FormLabel(')
          ..write('key: $key, ')
          ..write('labelFr: $labelFr, ')
          ..write('labelEn: $labelEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, labelFr, labelEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormLabel &&
          other.key == this.key &&
          other.labelFr == this.labelFr &&
          other.labelEn == this.labelEn);
}

class FormLabelsCompanion extends UpdateCompanion<FormLabel> {
  final Value<String> key;
  final Value<String> labelFr;
  final Value<String> labelEn;
  final Value<int> rowid;
  const FormLabelsCompanion({
    this.key = const Value.absent(),
    this.labelFr = const Value.absent(),
    this.labelEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FormLabelsCompanion.insert({
    required String key,
    required String labelFr,
    required String labelEn,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       labelFr = Value(labelFr),
       labelEn = Value(labelEn);
  static Insertable<FormLabel> custom({
    Expression<String>? key,
    Expression<String>? labelFr,
    Expression<String>? labelEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (labelFr != null) 'label_fr': labelFr,
      if (labelEn != null) 'label_en': labelEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FormLabelsCompanion copyWith({
    Value<String>? key,
    Value<String>? labelFr,
    Value<String>? labelEn,
    Value<int>? rowid,
  }) {
    return FormLabelsCompanion(
      key: key ?? this.key,
      labelFr: labelFr ?? this.labelFr,
      labelEn: labelEn ?? this.labelEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (labelFr.present) {
      map['label_fr'] = Variable<String>(labelFr.value);
    }
    if (labelEn.present) {
      map['label_en'] = Variable<String>(labelEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormLabelsCompanion(')
          ..write('key: $key, ')
          ..write('labelFr: $labelFr, ')
          ..write('labelEn: $labelEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryLabelsTable extends CategoryLabels
    with TableInfo<$CategoryLabelsTable, CategoryLabel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryLabelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelFrMeta = const VerificationMeta(
    'labelFr',
  );
  @override
  late final GeneratedColumn<String> labelFr = GeneratedColumn<String>(
    'label_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelEnMeta = const VerificationMeta(
    'labelEn',
  );
  @override
  late final GeneratedColumn<String> labelEn = GeneratedColumn<String>(
    'label_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, labelFr, labelEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_labels';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryLabel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('label_fr')) {
      context.handle(
        _labelFrMeta,
        labelFr.isAcceptableOrUnknown(data['label_fr']!, _labelFrMeta),
      );
    } else if (isInserting) {
      context.missing(_labelFrMeta);
    }
    if (data.containsKey('label_en')) {
      context.handle(
        _labelEnMeta,
        labelEn.isAcceptableOrUnknown(data['label_en']!, _labelEnMeta),
      );
    } else if (isInserting) {
      context.missing(_labelEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  CategoryLabel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryLabel(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      labelFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_fr'],
      )!,
      labelEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_en'],
      )!,
    );
  }

  @override
  $CategoryLabelsTable createAlias(String alias) {
    return $CategoryLabelsTable(attachedDatabase, alias);
  }
}

class CategoryLabel extends DataClass implements Insertable<CategoryLabel> {
  final String key;
  final String labelFr;
  final String labelEn;
  const CategoryLabel({
    required this.key,
    required this.labelFr,
    required this.labelEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['label_fr'] = Variable<String>(labelFr);
    map['label_en'] = Variable<String>(labelEn);
    return map;
  }

  CategoryLabelsCompanion toCompanion(bool nullToAbsent) {
    return CategoryLabelsCompanion(
      key: Value(key),
      labelFr: Value(labelFr),
      labelEn: Value(labelEn),
    );
  }

  factory CategoryLabel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryLabel(
      key: serializer.fromJson<String>(json['key']),
      labelFr: serializer.fromJson<String>(json['labelFr']),
      labelEn: serializer.fromJson<String>(json['labelEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'labelFr': serializer.toJson<String>(labelFr),
      'labelEn': serializer.toJson<String>(labelEn),
    };
  }

  CategoryLabel copyWith({String? key, String? labelFr, String? labelEn}) =>
      CategoryLabel(
        key: key ?? this.key,
        labelFr: labelFr ?? this.labelFr,
        labelEn: labelEn ?? this.labelEn,
      );
  CategoryLabel copyWithCompanion(CategoryLabelsCompanion data) {
    return CategoryLabel(
      key: data.key.present ? data.key.value : this.key,
      labelFr: data.labelFr.present ? data.labelFr.value : this.labelFr,
      labelEn: data.labelEn.present ? data.labelEn.value : this.labelEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryLabel(')
          ..write('key: $key, ')
          ..write('labelFr: $labelFr, ')
          ..write('labelEn: $labelEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, labelFr, labelEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryLabel &&
          other.key == this.key &&
          other.labelFr == this.labelFr &&
          other.labelEn == this.labelEn);
}

class CategoryLabelsCompanion extends UpdateCompanion<CategoryLabel> {
  final Value<String> key;
  final Value<String> labelFr;
  final Value<String> labelEn;
  final Value<int> rowid;
  const CategoryLabelsCompanion({
    this.key = const Value.absent(),
    this.labelFr = const Value.absent(),
    this.labelEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryLabelsCompanion.insert({
    required String key,
    required String labelFr,
    required String labelEn,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       labelFr = Value(labelFr),
       labelEn = Value(labelEn);
  static Insertable<CategoryLabel> custom({
    Expression<String>? key,
    Expression<String>? labelFr,
    Expression<String>? labelEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (labelFr != null) 'label_fr': labelFr,
      if (labelEn != null) 'label_en': labelEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryLabelsCompanion copyWith({
    Value<String>? key,
    Value<String>? labelFr,
    Value<String>? labelEn,
    Value<int>? rowid,
  }) {
    return CategoryLabelsCompanion(
      key: key ?? this.key,
      labelFr: labelFr ?? this.labelFr,
      labelEn: labelEn ?? this.labelEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (labelFr.present) {
      map['label_fr'] = Variable<String>(labelFr.value);
    }
    if (labelEn.present) {
      map['label_en'] = Variable<String>(labelEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryLabelsCompanion(')
          ..write('key: $key, ')
          ..write('labelFr: $labelFr, ')
          ..write('labelEn: $labelEn, ')
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
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _featureImageUrlMeta = const VerificationMeta(
    'featureImageUrl',
  );
  @override
  late final GeneratedColumn<String> featureImageUrl = GeneratedColumn<String>(
    'feature_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedProductIdsMeta = const VerificationMeta(
    'relatedProductIds',
  );
  @override
  late final GeneratedColumn<String> relatedProductIds =
      GeneratedColumn<String>(
        'related_product_ids',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _readTimeMeta = const VerificationMeta(
    'readTime',
  );
  @override
  late final GeneratedColumn<int> readTime = GeneratedColumn<int>(
    'read_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titleFr,
    titleEn,
    excerptFr,
    excerptEn,
    contentFr,
    contentEn,
    category,
    tags,
    featureImageUrl,
    relatedProductIds,
    readTime,
    isActive,
    publishedAt,
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
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('feature_image_url')) {
      context.handle(
        _featureImageUrlMeta,
        featureImageUrl.isAcceptableOrUnknown(
          data['feature_image_url']!,
          _featureImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('related_product_ids')) {
      context.handle(
        _relatedProductIdsMeta,
        relatedProductIds.isAcceptableOrUnknown(
          data['related_product_ids']!,
          _relatedProductIdsMeta,
        ),
      );
    }
    if (data.containsKey('read_time')) {
      context.handle(
        _readTimeMeta,
        readTime.isAcceptableOrUnknown(data['read_time']!, _readTimeMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
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
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      featureImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feature_image_url'],
      ),
      relatedProductIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_product_ids'],
      ),
      readTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}read_time'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final String id;
  final String titleFr;
  final String? titleEn;
  final String? excerptFr;
  final String? excerptEn;
  final String? contentFr;
  final String? contentEn;
  final String category;
  final String? tags;
  final String? featureImageUrl;
  final String? relatedProductIds;
  final int? readTime;
  final bool isActive;
  final DateTime? publishedAt;
  const Article({
    required this.id,
    required this.titleFr,
    this.titleEn,
    this.excerptFr,
    this.excerptEn,
    this.contentFr,
    this.contentEn,
    required this.category,
    this.tags,
    this.featureImageUrl,
    this.relatedProductIds,
    this.readTime,
    required this.isActive,
    this.publishedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
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
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || featureImageUrl != null) {
      map['feature_image_url'] = Variable<String>(featureImageUrl);
    }
    if (!nullToAbsent || relatedProductIds != null) {
      map['related_product_ids'] = Variable<String>(relatedProductIds);
    }
    if (!nullToAbsent || readTime != null) {
      map['read_time'] = Variable<int>(readTime);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
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
      category: Value(category),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      featureImageUrl: featureImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(featureImageUrl),
      relatedProductIds: relatedProductIds == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedProductIds),
      readTime: readTime == null && nullToAbsent
          ? const Value.absent()
          : Value(readTime),
      isActive: Value(isActive),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
    );
  }

  factory Article.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<String>(json['id']),
      titleFr: serializer.fromJson<String>(json['titleFr']),
      titleEn: serializer.fromJson<String?>(json['titleEn']),
      excerptFr: serializer.fromJson<String?>(json['excerptFr']),
      excerptEn: serializer.fromJson<String?>(json['excerptEn']),
      contentFr: serializer.fromJson<String?>(json['contentFr']),
      contentEn: serializer.fromJson<String?>(json['contentEn']),
      category: serializer.fromJson<String>(json['category']),
      tags: serializer.fromJson<String?>(json['tags']),
      featureImageUrl: serializer.fromJson<String?>(json['featureImageUrl']),
      relatedProductIds: serializer.fromJson<String?>(
        json['relatedProductIds'],
      ),
      readTime: serializer.fromJson<int?>(json['readTime']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'titleFr': serializer.toJson<String>(titleFr),
      'titleEn': serializer.toJson<String?>(titleEn),
      'excerptFr': serializer.toJson<String?>(excerptFr),
      'excerptEn': serializer.toJson<String?>(excerptEn),
      'contentFr': serializer.toJson<String?>(contentFr),
      'contentEn': serializer.toJson<String?>(contentEn),
      'category': serializer.toJson<String>(category),
      'tags': serializer.toJson<String?>(tags),
      'featureImageUrl': serializer.toJson<String?>(featureImageUrl),
      'relatedProductIds': serializer.toJson<String?>(relatedProductIds),
      'readTime': serializer.toJson<int?>(readTime),
      'isActive': serializer.toJson<bool>(isActive),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
    };
  }

  Article copyWith({
    String? id,
    String? titleFr,
    Value<String?> titleEn = const Value.absent(),
    Value<String?> excerptFr = const Value.absent(),
    Value<String?> excerptEn = const Value.absent(),
    Value<String?> contentFr = const Value.absent(),
    Value<String?> contentEn = const Value.absent(),
    String? category,
    Value<String?> tags = const Value.absent(),
    Value<String?> featureImageUrl = const Value.absent(),
    Value<String?> relatedProductIds = const Value.absent(),
    Value<int?> readTime = const Value.absent(),
    bool? isActive,
    Value<DateTime?> publishedAt = const Value.absent(),
  }) => Article(
    id: id ?? this.id,
    titleFr: titleFr ?? this.titleFr,
    titleEn: titleEn.present ? titleEn.value : this.titleEn,
    excerptFr: excerptFr.present ? excerptFr.value : this.excerptFr,
    excerptEn: excerptEn.present ? excerptEn.value : this.excerptEn,
    contentFr: contentFr.present ? contentFr.value : this.contentFr,
    contentEn: contentEn.present ? contentEn.value : this.contentEn,
    category: category ?? this.category,
    tags: tags.present ? tags.value : this.tags,
    featureImageUrl: featureImageUrl.present
        ? featureImageUrl.value
        : this.featureImageUrl,
    relatedProductIds: relatedProductIds.present
        ? relatedProductIds.value
        : this.relatedProductIds,
    readTime: readTime.present ? readTime.value : this.readTime,
    isActive: isActive ?? this.isActive,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
  );
  Article copyWithCompanion(ArticlesCompanion data) {
    return Article(
      id: data.id.present ? data.id.value : this.id,
      titleFr: data.titleFr.present ? data.titleFr.value : this.titleFr,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
      excerptFr: data.excerptFr.present ? data.excerptFr.value : this.excerptFr,
      excerptEn: data.excerptEn.present ? data.excerptEn.value : this.excerptEn,
      contentFr: data.contentFr.present ? data.contentFr.value : this.contentFr,
      contentEn: data.contentEn.present ? data.contentEn.value : this.contentEn,
      category: data.category.present ? data.category.value : this.category,
      tags: data.tags.present ? data.tags.value : this.tags,
      featureImageUrl: data.featureImageUrl.present
          ? data.featureImageUrl.value
          : this.featureImageUrl,
      relatedProductIds: data.relatedProductIds.present
          ? data.relatedProductIds.value
          : this.relatedProductIds,
      readTime: data.readTime.present ? data.readTime.value : this.readTime,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('titleFr: $titleFr, ')
          ..write('titleEn: $titleEn, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('contentFr: $contentFr, ')
          ..write('contentEn: $contentEn, ')
          ..write('category: $category, ')
          ..write('tags: $tags, ')
          ..write('featureImageUrl: $featureImageUrl, ')
          ..write('relatedProductIds: $relatedProductIds, ')
          ..write('readTime: $readTime, ')
          ..write('isActive: $isActive, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    titleFr,
    titleEn,
    excerptFr,
    excerptEn,
    contentFr,
    contentEn,
    category,
    tags,
    featureImageUrl,
    relatedProductIds,
    readTime,
    isActive,
    publishedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.titleFr == this.titleFr &&
          other.titleEn == this.titleEn &&
          other.excerptFr == this.excerptFr &&
          other.excerptEn == this.excerptEn &&
          other.contentFr == this.contentFr &&
          other.contentEn == this.contentEn &&
          other.category == this.category &&
          other.tags == this.tags &&
          other.featureImageUrl == this.featureImageUrl &&
          other.relatedProductIds == this.relatedProductIds &&
          other.readTime == this.readTime &&
          other.isActive == this.isActive &&
          other.publishedAt == this.publishedAt);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<String> id;
  final Value<String> titleFr;
  final Value<String?> titleEn;
  final Value<String?> excerptFr;
  final Value<String?> excerptEn;
  final Value<String?> contentFr;
  final Value<String?> contentEn;
  final Value<String> category;
  final Value<String?> tags;
  final Value<String?> featureImageUrl;
  final Value<String?> relatedProductIds;
  final Value<int?> readTime;
  final Value<bool> isActive;
  final Value<DateTime?> publishedAt;
  final Value<int> rowid;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.titleFr = const Value.absent(),
    this.titleEn = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.contentFr = const Value.absent(),
    this.contentEn = const Value.absent(),
    this.category = const Value.absent(),
    this.tags = const Value.absent(),
    this.featureImageUrl = const Value.absent(),
    this.relatedProductIds = const Value.absent(),
    this.readTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String id,
    required String titleFr,
    this.titleEn = const Value.absent(),
    this.excerptFr = const Value.absent(),
    this.excerptEn = const Value.absent(),
    this.contentFr = const Value.absent(),
    this.contentEn = const Value.absent(),
    required String category,
    this.tags = const Value.absent(),
    this.featureImageUrl = const Value.absent(),
    this.relatedProductIds = const Value.absent(),
    this.readTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       titleFr = Value(titleFr),
       category = Value(category);
  static Insertable<Article> custom({
    Expression<String>? id,
    Expression<String>? titleFr,
    Expression<String>? titleEn,
    Expression<String>? excerptFr,
    Expression<String>? excerptEn,
    Expression<String>? contentFr,
    Expression<String>? contentEn,
    Expression<String>? category,
    Expression<String>? tags,
    Expression<String>? featureImageUrl,
    Expression<String>? relatedProductIds,
    Expression<int>? readTime,
    Expression<bool>? isActive,
    Expression<DateTime>? publishedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titleFr != null) 'title_fr': titleFr,
      if (titleEn != null) 'title_en': titleEn,
      if (excerptFr != null) 'excerpt_fr': excerptFr,
      if (excerptEn != null) 'excerpt_en': excerptEn,
      if (contentFr != null) 'content_fr': contentFr,
      if (contentEn != null) 'content_en': contentEn,
      if (category != null) 'category': category,
      if (tags != null) 'tags': tags,
      if (featureImageUrl != null) 'feature_image_url': featureImageUrl,
      if (relatedProductIds != null) 'related_product_ids': relatedProductIds,
      if (readTime != null) 'read_time': readTime,
      if (isActive != null) 'is_active': isActive,
      if (publishedAt != null) 'published_at': publishedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesCompanion copyWith({
    Value<String>? id,
    Value<String>? titleFr,
    Value<String?>? titleEn,
    Value<String?>? excerptFr,
    Value<String?>? excerptEn,
    Value<String?>? contentFr,
    Value<String?>? contentEn,
    Value<String>? category,
    Value<String?>? tags,
    Value<String?>? featureImageUrl,
    Value<String?>? relatedProductIds,
    Value<int?>? readTime,
    Value<bool>? isActive,
    Value<DateTime?>? publishedAt,
    Value<int>? rowid,
  }) {
    return ArticlesCompanion(
      id: id ?? this.id,
      titleFr: titleFr ?? this.titleFr,
      titleEn: titleEn ?? this.titleEn,
      excerptFr: excerptFr ?? this.excerptFr,
      excerptEn: excerptEn ?? this.excerptEn,
      contentFr: contentFr ?? this.contentFr,
      contentEn: contentEn ?? this.contentEn,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      featureImageUrl: featureImageUrl ?? this.featureImageUrl,
      relatedProductIds: relatedProductIds ?? this.relatedProductIds,
      readTime: readTime ?? this.readTime,
      isActive: isActive ?? this.isActive,
      publishedAt: publishedAt ?? this.publishedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (featureImageUrl.present) {
      map['feature_image_url'] = Variable<String>(featureImageUrl.value);
    }
    if (relatedProductIds.present) {
      map['related_product_ids'] = Variable<String>(relatedProductIds.value);
    }
    if (readTime.present) {
      map['read_time'] = Variable<int>(readTime.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
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
          ..write('titleFr: $titleFr, ')
          ..write('titleEn: $titleEn, ')
          ..write('excerptFr: $excerptFr, ')
          ..write('excerptEn: $excerptEn, ')
          ..write('contentFr: $contentFr, ')
          ..write('contentEn: $contentEn, ')
          ..write('category: $category, ')
          ..write('tags: $tags, ')
          ..write('featureImageUrl: $featureImageUrl, ')
          ..write('relatedProductIds: $relatedProductIds, ')
          ..write('readTime: $readTime, ')
          ..write('isActive: $isActive, ')
          ..write('publishedAt: $publishedAt, ')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, productId, articleId, createdAt];
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
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final String id;
  final String? productId;
  final String? articleId;
  final DateTime createdAt;
  const Favorite({
    required this.id,
    this.productId,
    this.articleId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || articleId != null) {
      map['article_id'] = Variable<String>(articleId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
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
      createdAt: Value(createdAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      articleId: serializer.fromJson<String?>(json['articleId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String?>(productId),
      'articleId': serializer.toJson<String?>(articleId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Favorite copyWith({
    String? id,
    Value<String?> productId = const Value.absent(),
    Value<String?> articleId = const Value.absent(),
    DateTime? createdAt,
  }) => Favorite(
    id: id ?? this.id,
    productId: productId.present ? productId.value : this.productId,
    articleId: articleId.present ? articleId.value : this.articleId,
    createdAt: createdAt ?? this.createdAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('articleId: $articleId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, articleId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.articleId == this.articleId &&
          other.createdAt == this.createdAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> id;
  final Value<String?> productId;
  final Value<String?> articleId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.articleId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.articleId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Favorite> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? articleId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (articleId != null) 'article_id': articleId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? id,
    Value<String?>? productId,
    Value<String?>? articleId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      articleId: articleId ?? this.articleId,
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
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
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
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('articleId: $articleId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $FormLabelsTable formLabels = $FormLabelsTable(this);
  late final $CategoryLabelsTable categoryLabels = $CategoryLabelsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    brands,
    products,
    formLabels,
    categoryLabels,
    articles,
    favorites,
  ];
}

typedef $$BrandsTableCreateCompanionBuilder =
    BrandsCompanion Function({
      required String id,
      required String name,
      Value<String?> logoUrl,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$BrandsTableUpdateCompanionBuilder =
    BrandsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> logoUrl,
      Value<String?> descriptionFr,
      Value<String?> descriptionEn,
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

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
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

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
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

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get descriptionFr => $composableBuilder(
    column: $table.descriptionFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

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
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion(
                id: id,
                name: name,
                logoUrl: logoUrl,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> logoUrl = const Value.absent(),
                Value<String?> descriptionFr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion.insert(
                id: id,
                name: name,
                logoUrl: logoUrl,
                descriptionFr: descriptionFr,
                descriptionEn: descriptionEn,
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
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required String brandId,
      required String nameFr,
      Value<String?> nameEn,
      Value<String?> scientificName,
      Value<String?> form,
      Value<String?> category,
      Value<String?> weightVolume,
      Value<String?> ingredients,
      Value<String?> certifications,
      Value<String?> imageUrl,
      Value<String?> galleryUrls,
      Value<String?> tags,
      Value<String?> bienfaitsFr,
      Value<String?> bienfaitsEn,
      Value<String?> usages,
      Value<bool> isActive,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> brandId,
      Value<String> nameFr,
      Value<String?> nameEn,
      Value<String?> scientificName,
      Value<String?> form,
      Value<String?> category,
      Value<String?> weightVolume,
      Value<String?> ingredients,
      Value<String?> certifications,
      Value<String?> imageUrl,
      Value<String?> galleryUrls,
      Value<String?> tags,
      Value<String?> bienfaitsFr,
      Value<String?> bienfaitsEn,
      Value<String?> usages,
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

  $$BrandsTableProcessedTableManager get brandId {
    final $_column = $_itemColumn<String>('brand_id')!;

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

  ColumnFilters<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weightVolume => $composableBuilder(
    column: $table.weightVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certifications => $composableBuilder(
    column: $table.certifications,
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

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bienfaitsFr => $composableBuilder(
    column: $table.bienfaitsFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bienfaitsEn => $composableBuilder(
    column: $table.bienfaitsEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usages => $composableBuilder(
    column: $table.usages,
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

  ColumnOrderings<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weightVolume => $composableBuilder(
    column: $table.weightVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certifications => $composableBuilder(
    column: $table.certifications,
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

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bienfaitsFr => $composableBuilder(
    column: $table.bienfaitsFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bienfaitsEn => $composableBuilder(
    column: $table.bienfaitsEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usages => $composableBuilder(
    column: $table.usages,
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

  GeneratedColumn<String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get weightVolume => $composableBuilder(
    column: $table.weightVolume,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get galleryUrls => $composableBuilder(
    column: $table.galleryUrls,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get bienfaitsFr => $composableBuilder(
    column: $table.bienfaitsFr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bienfaitsEn => $composableBuilder(
    column: $table.bienfaitsEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get usages =>
      $composableBuilder(column: $table.usages, builder: (column) => column);

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
          PrefetchHooks Function({bool brandId, bool favoritesRefs})
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
                Value<String> brandId = const Value.absent(),
                Value<String> nameFr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> scientificName = const Value.absent(),
                Value<String?> form = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> weightVolume = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> certifications = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> galleryUrls = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> bienfaitsFr = const Value.absent(),
                Value<String?> bienfaitsEn = const Value.absent(),
                Value<String?> usages = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                brandId: brandId,
                nameFr: nameFr,
                nameEn: nameEn,
                scientificName: scientificName,
                form: form,
                category: category,
                weightVolume: weightVolume,
                ingredients: ingredients,
                certifications: certifications,
                imageUrl: imageUrl,
                galleryUrls: galleryUrls,
                tags: tags,
                bienfaitsFr: bienfaitsFr,
                bienfaitsEn: bienfaitsEn,
                usages: usages,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String brandId,
                required String nameFr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> scientificName = const Value.absent(),
                Value<String?> form = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> weightVolume = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> certifications = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> galleryUrls = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> bienfaitsFr = const Value.absent(),
                Value<String?> bienfaitsEn = const Value.absent(),
                Value<String?> usages = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                brandId: brandId,
                nameFr: nameFr,
                nameEn: nameEn,
                scientificName: scientificName,
                form: form,
                category: category,
                weightVolume: weightVolume,
                ingredients: ingredients,
                certifications: certifications,
                imageUrl: imageUrl,
                galleryUrls: galleryUrls,
                tags: tags,
                bienfaitsFr: bienfaitsFr,
                bienfaitsEn: bienfaitsEn,
                usages: usages,
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
          prefetchHooksCallback: ({brandId = false, favoritesRefs = false}) {
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

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (favoritesRefs)
                    await $_getPrefetchedData<
                      Product,
                      $ProductsTable,
                      Favorite
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._favoritesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProductsTableReferences(
                        db,
                        table,
                        p0,
                      ).favoritesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
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
      PrefetchHooks Function({bool brandId, bool favoritesRefs})
    >;
typedef $$FormLabelsTableCreateCompanionBuilder =
    FormLabelsCompanion Function({
      required String key,
      required String labelFr,
      required String labelEn,
      Value<int> rowid,
    });
typedef $$FormLabelsTableUpdateCompanionBuilder =
    FormLabelsCompanion Function({
      Value<String> key,
      Value<String> labelFr,
      Value<String> labelEn,
      Value<int> rowid,
    });

class $$FormLabelsTableFilterComposer
    extends Composer<_$AppDatabase, $FormLabelsTable> {
  $$FormLabelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelFr => $composableBuilder(
    column: $table.labelFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelEn => $composableBuilder(
    column: $table.labelEn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FormLabelsTableOrderingComposer
    extends Composer<_$AppDatabase, $FormLabelsTable> {
  $$FormLabelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelFr => $composableBuilder(
    column: $table.labelFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelEn => $composableBuilder(
    column: $table.labelEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FormLabelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormLabelsTable> {
  $$FormLabelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get labelFr =>
      $composableBuilder(column: $table.labelFr, builder: (column) => column);

  GeneratedColumn<String> get labelEn =>
      $composableBuilder(column: $table.labelEn, builder: (column) => column);
}

class $$FormLabelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FormLabelsTable,
          FormLabel,
          $$FormLabelsTableFilterComposer,
          $$FormLabelsTableOrderingComposer,
          $$FormLabelsTableAnnotationComposer,
          $$FormLabelsTableCreateCompanionBuilder,
          $$FormLabelsTableUpdateCompanionBuilder,
          (
            FormLabel,
            BaseReferences<_$AppDatabase, $FormLabelsTable, FormLabel>,
          ),
          FormLabel,
          PrefetchHooks Function()
        > {
  $$FormLabelsTableTableManager(_$AppDatabase db, $FormLabelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormLabelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormLabelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormLabelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> labelFr = const Value.absent(),
                Value<String> labelEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FormLabelsCompanion(
                key: key,
                labelFr: labelFr,
                labelEn: labelEn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String labelFr,
                required String labelEn,
                Value<int> rowid = const Value.absent(),
              }) => FormLabelsCompanion.insert(
                key: key,
                labelFr: labelFr,
                labelEn: labelEn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FormLabelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FormLabelsTable,
      FormLabel,
      $$FormLabelsTableFilterComposer,
      $$FormLabelsTableOrderingComposer,
      $$FormLabelsTableAnnotationComposer,
      $$FormLabelsTableCreateCompanionBuilder,
      $$FormLabelsTableUpdateCompanionBuilder,
      (FormLabel, BaseReferences<_$AppDatabase, $FormLabelsTable, FormLabel>),
      FormLabel,
      PrefetchHooks Function()
    >;
typedef $$CategoryLabelsTableCreateCompanionBuilder =
    CategoryLabelsCompanion Function({
      required String key,
      required String labelFr,
      required String labelEn,
      Value<int> rowid,
    });
typedef $$CategoryLabelsTableUpdateCompanionBuilder =
    CategoryLabelsCompanion Function({
      Value<String> key,
      Value<String> labelFr,
      Value<String> labelEn,
      Value<int> rowid,
    });

class $$CategoryLabelsTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryLabelsTable> {
  $$CategoryLabelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelFr => $composableBuilder(
    column: $table.labelFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelEn => $composableBuilder(
    column: $table.labelEn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryLabelsTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryLabelsTable> {
  $$CategoryLabelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelFr => $composableBuilder(
    column: $table.labelFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelEn => $composableBuilder(
    column: $table.labelEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryLabelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryLabelsTable> {
  $$CategoryLabelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get labelFr =>
      $composableBuilder(column: $table.labelFr, builder: (column) => column);

  GeneratedColumn<String> get labelEn =>
      $composableBuilder(column: $table.labelEn, builder: (column) => column);
}

class $$CategoryLabelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryLabelsTable,
          CategoryLabel,
          $$CategoryLabelsTableFilterComposer,
          $$CategoryLabelsTableOrderingComposer,
          $$CategoryLabelsTableAnnotationComposer,
          $$CategoryLabelsTableCreateCompanionBuilder,
          $$CategoryLabelsTableUpdateCompanionBuilder,
          (
            CategoryLabel,
            BaseReferences<_$AppDatabase, $CategoryLabelsTable, CategoryLabel>,
          ),
          CategoryLabel,
          PrefetchHooks Function()
        > {
  $$CategoryLabelsTableTableManager(
    _$AppDatabase db,
    $CategoryLabelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryLabelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryLabelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryLabelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> labelFr = const Value.absent(),
                Value<String> labelEn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryLabelsCompanion(
                key: key,
                labelFr: labelFr,
                labelEn: labelEn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String labelFr,
                required String labelEn,
                Value<int> rowid = const Value.absent(),
              }) => CategoryLabelsCompanion.insert(
                key: key,
                labelFr: labelFr,
                labelEn: labelEn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryLabelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryLabelsTable,
      CategoryLabel,
      $$CategoryLabelsTableFilterComposer,
      $$CategoryLabelsTableOrderingComposer,
      $$CategoryLabelsTableAnnotationComposer,
      $$CategoryLabelsTableCreateCompanionBuilder,
      $$CategoryLabelsTableUpdateCompanionBuilder,
      (
        CategoryLabel,
        BaseReferences<_$AppDatabase, $CategoryLabelsTable, CategoryLabel>,
      ),
      CategoryLabel,
      PrefetchHooks Function()
    >;
typedef $$ArticlesTableCreateCompanionBuilder =
    ArticlesCompanion Function({
      required String id,
      required String titleFr,
      Value<String?> titleEn,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> contentFr,
      Value<String?> contentEn,
      required String category,
      Value<String?> tags,
      Value<String?> featureImageUrl,
      Value<String?> relatedProductIds,
      Value<int?> readTime,
      Value<bool> isActive,
      Value<DateTime?> publishedAt,
      Value<int> rowid,
    });
typedef $$ArticlesTableUpdateCompanionBuilder =
    ArticlesCompanion Function({
      Value<String> id,
      Value<String> titleFr,
      Value<String?> titleEn,
      Value<String?> excerptFr,
      Value<String?> excerptEn,
      Value<String?> contentFr,
      Value<String?> contentEn,
      Value<String> category,
      Value<String?> tags,
      Value<String?> featureImageUrl,
      Value<String?> relatedProductIds,
      Value<int?> readTime,
      Value<bool> isActive,
      Value<DateTime?> publishedAt,
      Value<int> rowid,
    });

final class $$ArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $ArticlesTable, Article> {
  $$ArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get featureImageUrl => $composableBuilder(
    column: $table.featureImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedProductIds => $composableBuilder(
    column: $table.relatedProductIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readTime => $composableBuilder(
    column: $table.readTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get featureImageUrl => $composableBuilder(
    column: $table.featureImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedProductIds => $composableBuilder(
    column: $table.relatedProductIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readTime => $composableBuilder(
    column: $table.readTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get featureImageUrl => $composableBuilder(
    column: $table.featureImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedProductIds => $composableBuilder(
    column: $table.relatedProductIds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get readTime =>
      $composableBuilder(column: $table.readTime, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

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
          PrefetchHooks Function({bool favoritesRefs})
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
                Value<String> titleFr = const Value.absent(),
                Value<String?> titleEn = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> contentFr = const Value.absent(),
                Value<String?> contentEn = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> featureImageUrl = const Value.absent(),
                Value<String?> relatedProductIds = const Value.absent(),
                Value<int?> readTime = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArticlesCompanion(
                id: id,
                titleFr: titleFr,
                titleEn: titleEn,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                contentFr: contentFr,
                contentEn: contentEn,
                category: category,
                tags: tags,
                featureImageUrl: featureImageUrl,
                relatedProductIds: relatedProductIds,
                readTime: readTime,
                isActive: isActive,
                publishedAt: publishedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titleFr,
                Value<String?> titleEn = const Value.absent(),
                Value<String?> excerptFr = const Value.absent(),
                Value<String?> excerptEn = const Value.absent(),
                Value<String?> contentFr = const Value.absent(),
                Value<String?> contentEn = const Value.absent(),
                required String category,
                Value<String?> tags = const Value.absent(),
                Value<String?> featureImageUrl = const Value.absent(),
                Value<String?> relatedProductIds = const Value.absent(),
                Value<int?> readTime = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArticlesCompanion.insert(
                id: id,
                titleFr: titleFr,
                titleEn: titleEn,
                excerptFr: excerptFr,
                excerptEn: excerptEn,
                contentFr: contentFr,
                contentEn: contentEn,
                category: category,
                tags: tags,
                featureImageUrl: featureImageUrl,
                relatedProductIds: relatedProductIds,
                readTime: readTime,
                isActive: isActive,
                publishedAt: publishedAt,
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
          prefetchHooksCallback: ({favoritesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (favoritesRefs) db.favorites],
              addJoins: null,
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
                      managerFromTypedResult: (p0) => $$ArticlesTableReferences(
                        db,
                        table,
                        p0,
                      ).favoritesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.articleId == item.id),
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
      PrefetchHooks Function({bool favoritesRefs})
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> id,
      Value<String?> productId,
      Value<String?> articleId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> id,
      Value<String?> productId,
      Value<String?> articleId,
      Value<DateTime> createdAt,
      Value<int> rowid,
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
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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
                Value<String> id = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> articleId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                productId: productId,
                articleId: articleId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> articleId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                productId: productId,
                articleId: articleId,
                createdAt: createdAt,
                rowid: rowid,
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
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$FormLabelsTableTableManager get formLabels =>
      $$FormLabelsTableTableManager(_db, _db.formLabels);
  $$CategoryLabelsTableTableManager get categoryLabels =>
      $$CategoryLabelsTableTableManager(_db, _db.categoryLabels);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
