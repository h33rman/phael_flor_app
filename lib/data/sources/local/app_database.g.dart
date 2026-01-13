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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $FormLabelsTable formLabels = $FormLabelsTable(this);
  late final $CategoryLabelsTable categoryLabels = $CategoryLabelsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    brands,
    products,
    formLabels,
    categoryLabels,
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
          PrefetchHooks Function({bool brandId})
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
          prefetchHooksCallback: ({brandId = false}) {
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
                return [];
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
      PrefetchHooks Function({bool brandId})
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
}
