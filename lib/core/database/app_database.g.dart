// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CompanyProfileTable extends CompanyProfile
    with TableInfo<$CompanyProfileTable, CompanyProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _nationalIdMeta = const VerificationMeta(
    'nationalId',
  );
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
    'national_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _economicCodeMeta = const VerificationMeta(
    'economicCode',
  );
  @override
  late final GeneratedColumn<String> economicCode = GeneratedColumn<String>(
    'economic_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _insuranceWorkshopCodeMeta =
      const VerificationMeta('insuranceWorkshopCode');
  @override
  late final GeneratedColumn<String> insuranceWorkshopCode =
      GeneratedColumn<String>(
        'insurance_workshop_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayCurrencyMeta = const VerificationMeta(
    'displayCurrency',
  );
  @override
  late final GeneratedColumn<String> displayCurrency = GeneratedColumn<String>(
    'display_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('rial'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nationalId,
    economicCode,
    insuranceWorkshopCode,
    address,
    phone,
    logoPath,
    displayCurrency,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('national_id')) {
      context.handle(
        _nationalIdMeta,
        nationalId.isAcceptableOrUnknown(data['national_id']!, _nationalIdMeta),
      );
    }
    if (data.containsKey('economic_code')) {
      context.handle(
        _economicCodeMeta,
        economicCode.isAcceptableOrUnknown(
          data['economic_code']!,
          _economicCodeMeta,
        ),
      );
    }
    if (data.containsKey('insurance_workshop_code')) {
      context.handle(
        _insuranceWorkshopCodeMeta,
        insuranceWorkshopCode.isAcceptableOrUnknown(
          data['insurance_workshop_code']!,
          _insuranceWorkshopCodeMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('display_currency')) {
      context.handle(
        _displayCurrencyMeta,
        displayCurrency.isAcceptableOrUnknown(
          data['display_currency']!,
          _displayCurrencyMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyProfileData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nationalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}national_id'],
      ),
      economicCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}economic_code'],
      ),
      insuranceWorkshopCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurance_workshop_code'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      displayCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_currency'],
      )!,
    );
  }

  @override
  $CompanyProfileTable createAlias(String alias) {
    return $CompanyProfileTable(attachedDatabase, alias);
  }
}

class CompanyProfileData extends DataClass
    implements Insertable<CompanyProfileData> {
  final int id;
  final String name;
  final String? nationalId;
  final String? economicCode;
  final String? insuranceWorkshopCode;
  final String? address;
  final String? phone;
  final String? logoPath;
  final String displayCurrency;
  const CompanyProfileData({
    required this.id,
    required this.name,
    this.nationalId,
    this.economicCode,
    this.insuranceWorkshopCode,
    this.address,
    this.phone,
    this.logoPath,
    required this.displayCurrency,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nationalId != null) {
      map['national_id'] = Variable<String>(nationalId);
    }
    if (!nullToAbsent || economicCode != null) {
      map['economic_code'] = Variable<String>(economicCode);
    }
    if (!nullToAbsent || insuranceWorkshopCode != null) {
      map['insurance_workshop_code'] = Variable<String>(insuranceWorkshopCode);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    map['display_currency'] = Variable<String>(displayCurrency);
    return map;
  }

  CompanyProfileCompanion toCompanion(bool nullToAbsent) {
    return CompanyProfileCompanion(
      id: Value(id),
      name: Value(name),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      economicCode: economicCode == null && nullToAbsent
          ? const Value.absent()
          : Value(economicCode),
      insuranceWorkshopCode: insuranceWorkshopCode == null && nullToAbsent
          ? const Value.absent()
          : Value(insuranceWorkshopCode),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      displayCurrency: Value(displayCurrency),
    );
  }

  factory CompanyProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nationalId: serializer.fromJson<String?>(json['nationalId']),
      economicCode: serializer.fromJson<String?>(json['economicCode']),
      insuranceWorkshopCode: serializer.fromJson<String?>(
        json['insuranceWorkshopCode'],
      ),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      displayCurrency: serializer.fromJson<String>(json['displayCurrency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nationalId': serializer.toJson<String?>(nationalId),
      'economicCode': serializer.toJson<String?>(economicCode),
      'insuranceWorkshopCode': serializer.toJson<String?>(
        insuranceWorkshopCode,
      ),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'logoPath': serializer.toJson<String?>(logoPath),
      'displayCurrency': serializer.toJson<String>(displayCurrency),
    };
  }

  CompanyProfileData copyWith({
    int? id,
    String? name,
    Value<String?> nationalId = const Value.absent(),
    Value<String?> economicCode = const Value.absent(),
    Value<String?> insuranceWorkshopCode = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    String? displayCurrency,
  }) => CompanyProfileData(
    id: id ?? this.id,
    name: name ?? this.name,
    nationalId: nationalId.present ? nationalId.value : this.nationalId,
    economicCode: economicCode.present ? economicCode.value : this.economicCode,
    insuranceWorkshopCode: insuranceWorkshopCode.present
        ? insuranceWorkshopCode.value
        : this.insuranceWorkshopCode,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    displayCurrency: displayCurrency ?? this.displayCurrency,
  );
  CompanyProfileData copyWithCompanion(CompanyProfileCompanion data) {
    return CompanyProfileData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nationalId: data.nationalId.present
          ? data.nationalId.value
          : this.nationalId,
      economicCode: data.economicCode.present
          ? data.economicCode.value
          : this.economicCode,
      insuranceWorkshopCode: data.insuranceWorkshopCode.present
          ? data.insuranceWorkshopCode.value
          : this.insuranceWorkshopCode,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      displayCurrency: data.displayCurrency.present
          ? data.displayCurrency.value
          : this.displayCurrency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nationalId: $nationalId, ')
          ..write('economicCode: $economicCode, ')
          ..write('insuranceWorkshopCode: $insuranceWorkshopCode, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('logoPath: $logoPath, ')
          ..write('displayCurrency: $displayCurrency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    nationalId,
    economicCode,
    insuranceWorkshopCode,
    address,
    phone,
    logoPath,
    displayCurrency,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.nationalId == this.nationalId &&
          other.economicCode == this.economicCode &&
          other.insuranceWorkshopCode == this.insuranceWorkshopCode &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.logoPath == this.logoPath &&
          other.displayCurrency == this.displayCurrency);
}

class CompanyProfileCompanion extends UpdateCompanion<CompanyProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> nationalId;
  final Value<String?> economicCode;
  final Value<String?> insuranceWorkshopCode;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> logoPath;
  final Value<String> displayCurrency;
  const CompanyProfileCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.economicCode = const Value.absent(),
    this.insuranceWorkshopCode = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.displayCurrency = const Value.absent(),
  });
  CompanyProfileCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.economicCode = const Value.absent(),
    this.insuranceWorkshopCode = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.displayCurrency = const Value.absent(),
  });
  static Insertable<CompanyProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nationalId,
    Expression<String>? economicCode,
    Expression<String>? insuranceWorkshopCode,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? logoPath,
    Expression<String>? displayCurrency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nationalId != null) 'national_id': nationalId,
      if (economicCode != null) 'economic_code': economicCode,
      if (insuranceWorkshopCode != null)
        'insurance_workshop_code': insuranceWorkshopCode,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (logoPath != null) 'logo_path': logoPath,
      if (displayCurrency != null) 'display_currency': displayCurrency,
    });
  }

  CompanyProfileCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? nationalId,
    Value<String?>? economicCode,
    Value<String?>? insuranceWorkshopCode,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String?>? logoPath,
    Value<String>? displayCurrency,
  }) {
    return CompanyProfileCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nationalId: nationalId ?? this.nationalId,
      economicCode: economicCode ?? this.economicCode,
      insuranceWorkshopCode:
          insuranceWorkshopCode ?? this.insuranceWorkshopCode,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      logoPath: logoPath ?? this.logoPath,
      displayCurrency: displayCurrency ?? this.displayCurrency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (economicCode.present) {
      map['economic_code'] = Variable<String>(economicCode.value);
    }
    if (insuranceWorkshopCode.present) {
      map['insurance_workshop_code'] = Variable<String>(
        insuranceWorkshopCode.value,
      );
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (displayCurrency.present) {
      map['display_currency'] = Variable<String>(displayCurrency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyProfileCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nationalId: $nationalId, ')
          ..write('economicCode: $economicCode, ')
          ..write('insuranceWorkshopCode: $insuranceWorkshopCode, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('logoPath: $logoPath, ')
          ..write('displayCurrency: $displayCurrency')
          ..write(')'))
        .toString();
  }
}

class $AppAuthTable extends AppAuth with TableInfo<$AppAuthTable, AppAuthData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppAuthTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<String> salt = GeneratedColumn<String>(
    'salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recoveryKeyHashMeta = const VerificationMeta(
    'recoveryKeyHash',
  );
  @override
  late final GeneratedColumn<String> recoveryKeyHash = GeneratedColumn<String>(
    'recovery_key_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _onboardedMeta = const VerificationMeta(
    'onboarded',
  );
  @override
  late final GeneratedColumn<bool> onboarded = GeneratedColumn<bool>(
    'onboarded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    passwordHash,
    salt,
    recoveryKeyHash,
    createdAt,
    onboarded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_auth';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppAuthData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('salt')) {
      context.handle(
        _saltMeta,
        salt.isAcceptableOrUnknown(data['salt']!, _saltMeta),
      );
    } else if (isInserting) {
      context.missing(_saltMeta);
    }
    if (data.containsKey('recovery_key_hash')) {
      context.handle(
        _recoveryKeyHashMeta,
        recoveryKeyHash.isAcceptableOrUnknown(
          data['recovery_key_hash']!,
          _recoveryKeyHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recoveryKeyHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('onboarded')) {
      context.handle(
        _onboardedMeta,
        onboarded.isAcceptableOrUnknown(data['onboarded']!, _onboardedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppAuthData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppAuthData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      salt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}salt'],
      )!,
      recoveryKeyHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_key_hash'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      onboarded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarded'],
      )!,
    );
  }

  @override
  $AppAuthTable createAlias(String alias) {
    return $AppAuthTable(attachedDatabase, alias);
  }
}

class AppAuthData extends DataClass implements Insertable<AppAuthData> {
  final int id;
  final String passwordHash;
  final String salt;
  final String recoveryKeyHash;
  final DateTime createdAt;
  final bool onboarded;
  const AppAuthData({
    required this.id,
    required this.passwordHash,
    required this.salt,
    required this.recoveryKeyHash,
    required this.createdAt,
    required this.onboarded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['password_hash'] = Variable<String>(passwordHash);
    map['salt'] = Variable<String>(salt);
    map['recovery_key_hash'] = Variable<String>(recoveryKeyHash);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['onboarded'] = Variable<bool>(onboarded);
    return map;
  }

  AppAuthCompanion toCompanion(bool nullToAbsent) {
    return AppAuthCompanion(
      id: Value(id),
      passwordHash: Value(passwordHash),
      salt: Value(salt),
      recoveryKeyHash: Value(recoveryKeyHash),
      createdAt: Value(createdAt),
      onboarded: Value(onboarded),
    );
  }

  factory AppAuthData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppAuthData(
      id: serializer.fromJson<int>(json['id']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      salt: serializer.fromJson<String>(json['salt']),
      recoveryKeyHash: serializer.fromJson<String>(json['recoveryKeyHash']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      onboarded: serializer.fromJson<bool>(json['onboarded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'salt': serializer.toJson<String>(salt),
      'recoveryKeyHash': serializer.toJson<String>(recoveryKeyHash),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'onboarded': serializer.toJson<bool>(onboarded),
    };
  }

  AppAuthData copyWith({
    int? id,
    String? passwordHash,
    String? salt,
    String? recoveryKeyHash,
    DateTime? createdAt,
    bool? onboarded,
  }) => AppAuthData(
    id: id ?? this.id,
    passwordHash: passwordHash ?? this.passwordHash,
    salt: salt ?? this.salt,
    recoveryKeyHash: recoveryKeyHash ?? this.recoveryKeyHash,
    createdAt: createdAt ?? this.createdAt,
    onboarded: onboarded ?? this.onboarded,
  );
  AppAuthData copyWithCompanion(AppAuthCompanion data) {
    return AppAuthData(
      id: data.id.present ? data.id.value : this.id,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      salt: data.salt.present ? data.salt.value : this.salt,
      recoveryKeyHash: data.recoveryKeyHash.present
          ? data.recoveryKeyHash.value
          : this.recoveryKeyHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      onboarded: data.onboarded.present ? data.onboarded.value : this.onboarded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppAuthData(')
          ..write('id: $id, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('recoveryKeyHash: $recoveryKeyHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('onboarded: $onboarded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    passwordHash,
    salt,
    recoveryKeyHash,
    createdAt,
    onboarded,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppAuthData &&
          other.id == this.id &&
          other.passwordHash == this.passwordHash &&
          other.salt == this.salt &&
          other.recoveryKeyHash == this.recoveryKeyHash &&
          other.createdAt == this.createdAt &&
          other.onboarded == this.onboarded);
}

class AppAuthCompanion extends UpdateCompanion<AppAuthData> {
  final Value<int> id;
  final Value<String> passwordHash;
  final Value<String> salt;
  final Value<String> recoveryKeyHash;
  final Value<DateTime> createdAt;
  final Value<bool> onboarded;
  const AppAuthCompanion({
    this.id = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.salt = const Value.absent(),
    this.recoveryKeyHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.onboarded = const Value.absent(),
  });
  AppAuthCompanion.insert({
    this.id = const Value.absent(),
    required String passwordHash,
    required String salt,
    required String recoveryKeyHash,
    this.createdAt = const Value.absent(),
    this.onboarded = const Value.absent(),
  }) : passwordHash = Value(passwordHash),
       salt = Value(salt),
       recoveryKeyHash = Value(recoveryKeyHash);
  static Insertable<AppAuthData> custom({
    Expression<int>? id,
    Expression<String>? passwordHash,
    Expression<String>? salt,
    Expression<String>? recoveryKeyHash,
    Expression<DateTime>? createdAt,
    Expression<bool>? onboarded,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (salt != null) 'salt': salt,
      if (recoveryKeyHash != null) 'recovery_key_hash': recoveryKeyHash,
      if (createdAt != null) 'created_at': createdAt,
      if (onboarded != null) 'onboarded': onboarded,
    });
  }

  AppAuthCompanion copyWith({
    Value<int>? id,
    Value<String>? passwordHash,
    Value<String>? salt,
    Value<String>? recoveryKeyHash,
    Value<DateTime>? createdAt,
    Value<bool>? onboarded,
  }) {
    return AppAuthCompanion(
      id: id ?? this.id,
      passwordHash: passwordHash ?? this.passwordHash,
      salt: salt ?? this.salt,
      recoveryKeyHash: recoveryKeyHash ?? this.recoveryKeyHash,
      createdAt: createdAt ?? this.createdAt,
      onboarded: onboarded ?? this.onboarded,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (salt.present) {
      map['salt'] = Variable<String>(salt.value);
    }
    if (recoveryKeyHash.present) {
      map['recovery_key_hash'] = Variable<String>(recoveryKeyHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (onboarded.present) {
      map['onboarded'] = Variable<bool>(onboarded.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppAuthCompanion(')
          ..write('id: $id, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('recoveryKeyHash: $recoveryKeyHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('onboarded: $onboarded')
          ..write(')'))
        .toString();
  }
}

class $FiscalYearSettingsTable extends FiscalYearSettings
    with TableInfo<$FiscalYearSettingsTable, FiscalYearSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FiscalYearSettingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _settingsJsonMeta = const VerificationMeta(
    'settingsJson',
  );
  @override
  late final GeneratedColumn<String> settingsJson = GeneratedColumn<String>(
    'settings_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, year, settingsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fiscal_year_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<FiscalYearSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('settings_json')) {
      context.handle(
        _settingsJsonMeta,
        settingsJson.isAcceptableOrUnknown(
          data['settings_json']!,
          _settingsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settingsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FiscalYearSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FiscalYearSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      settingsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settings_json'],
      )!,
    );
  }

  @override
  $FiscalYearSettingsTable createAlias(String alias) {
    return $FiscalYearSettingsTable(attachedDatabase, alias);
  }
}

class FiscalYearSetting extends DataClass
    implements Insertable<FiscalYearSetting> {
  final int id;
  final int year;
  final String settingsJson;
  const FiscalYearSetting({
    required this.id,
    required this.year,
    required this.settingsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['settings_json'] = Variable<String>(settingsJson);
    return map;
  }

  FiscalYearSettingsCompanion toCompanion(bool nullToAbsent) {
    return FiscalYearSettingsCompanion(
      id: Value(id),
      year: Value(year),
      settingsJson: Value(settingsJson),
    );
  }

  factory FiscalYearSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FiscalYearSetting(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      settingsJson: serializer.fromJson<String>(json['settingsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'settingsJson': serializer.toJson<String>(settingsJson),
    };
  }

  FiscalYearSetting copyWith({int? id, int? year, String? settingsJson}) =>
      FiscalYearSetting(
        id: id ?? this.id,
        year: year ?? this.year,
        settingsJson: settingsJson ?? this.settingsJson,
      );
  FiscalYearSetting copyWithCompanion(FiscalYearSettingsCompanion data) {
    return FiscalYearSetting(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      settingsJson: data.settingsJson.present
          ? data.settingsJson.value
          : this.settingsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FiscalYearSetting(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('settingsJson: $settingsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, year, settingsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FiscalYearSetting &&
          other.id == this.id &&
          other.year == this.year &&
          other.settingsJson == this.settingsJson);
}

class FiscalYearSettingsCompanion extends UpdateCompanion<FiscalYearSetting> {
  final Value<int> id;
  final Value<int> year;
  final Value<String> settingsJson;
  const FiscalYearSettingsCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.settingsJson = const Value.absent(),
  });
  FiscalYearSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    required String settingsJson,
  }) : year = Value(year),
       settingsJson = Value(settingsJson);
  static Insertable<FiscalYearSetting> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<String>? settingsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (settingsJson != null) 'settings_json': settingsJson,
    });
  }

  FiscalYearSettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<String>? settingsJson,
  }) {
    return FiscalYearSettingsCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      settingsJson: settingsJson ?? this.settingsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (settingsJson.present) {
      map['settings_json'] = Variable<String>(settingsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FiscalYearSettingsCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('settingsJson: $settingsJson')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _personnelCodeMeta = const VerificationMeta(
    'personnelCode',
  );
  @override
  late final GeneratedColumn<String> personnelCode = GeneratedColumn<String>(
    'personnel_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nationalIdMeta = const VerificationMeta(
    'nationalId',
  );
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
    'national_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _insuranceNumberMeta = const VerificationMeta(
    'insuranceNumber',
  );
  @override
  late final GeneratedColumn<String> insuranceNumber = GeneratedColumn<String>(
    'insurance_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatherNameMeta = const VerificationMeta(
    'fatherName',
  );
  @override
  late final GeneratedColumn<String> fatherName = GeneratedColumn<String>(
    'father_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('male'),
  );
  static const VerificationMeta _marriedMeta = const VerificationMeta(
    'married',
  );
  @override
  late final GeneratedColumn<bool> married = GeneratedColumn<bool>(
    'married',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("married" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _childrenCountMeta = const VerificationMeta(
    'childrenCount',
  );
  @override
  late final GeneratedColumn<int> childrenCount = GeneratedColumn<int>(
    'children_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _childAllowanceEligibleMeta =
      const VerificationMeta('childAllowanceEligible');
  @override
  late final GeneratedColumn<bool> childAllowanceEligible =
      GeneratedColumn<bool>(
        'child_allowance_eligible',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("child_allowance_eligible" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _hireDateMeta = const VerificationMeta(
    'hireDate',
  );
  @override
  late final GeneratedColumn<DateTime> hireDate = GeneratedColumn<DateTime>(
    'hire_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contractTypeMeta = const VerificationMeta(
    'contractType',
  );
  @override
  late final GeneratedColumn<String> contractType = GeneratedColumn<String>(
    'contract_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('permanent'),
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobTitleMeta = const VerificationMeta(
    'jobTitle',
  );
  @override
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
    'job_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shebaMeta = const VerificationMeta('sheba');
  @override
  late final GeneratedColumn<String> sheba = GeneratedColumn<String>(
    'sheba',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountNumberMeta = const VerificationMeta(
    'accountNumber',
  );
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
    'account_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyWageMeta = const VerificationMeta(
    'dailyWage',
  );
  @override
  late final GeneratedColumn<int> dailyWage = GeneratedColumn<int>(
    'daily_wage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seniorityBasesMeta = const VerificationMeta(
    'seniorityBases',
  );
  @override
  late final GeneratedColumn<int> seniorityBases = GeneratedColumn<int>(
    'seniority_bases',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobAllowanceMonthlyMeta =
      const VerificationMeta('jobAllowanceMonthly');
  @override
  late final GeneratedColumn<int> jobAllowanceMonthly = GeneratedColumn<int>(
    'job_allowance_monthly',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isHardJobMeta = const VerificationMeta(
    'isHardJob',
  );
  @override
  late final GeneratedColumn<bool> isHardJob = GeneratedColumn<bool>(
    'is_hard_job',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hard_job" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    personnelCode,
    nationalId,
    insuranceNumber,
    firstName,
    lastName,
    fatherName,
    birthDate,
    gender,
    married,
    childrenCount,
    childAllowanceEligible,
    hireDate,
    contractType,
    department,
    jobTitle,
    bankName,
    sheba,
    accountNumber,
    dailyWage,
    seniorityBases,
    jobAllowanceMonthly,
    isHardJob,
    active,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employees';
  @override
  VerificationContext validateIntegrity(
    Insertable<Employee> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('personnel_code')) {
      context.handle(
        _personnelCodeMeta,
        personnelCode.isAcceptableOrUnknown(
          data['personnel_code']!,
          _personnelCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personnelCodeMeta);
    }
    if (data.containsKey('national_id')) {
      context.handle(
        _nationalIdMeta,
        nationalId.isAcceptableOrUnknown(data['national_id']!, _nationalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_nationalIdMeta);
    }
    if (data.containsKey('insurance_number')) {
      context.handle(
        _insuranceNumberMeta,
        insuranceNumber.isAcceptableOrUnknown(
          data['insurance_number']!,
          _insuranceNumberMeta,
        ),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('father_name')) {
      context.handle(
        _fatherNameMeta,
        fatherName.isAcceptableOrUnknown(data['father_name']!, _fatherNameMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('married')) {
      context.handle(
        _marriedMeta,
        married.isAcceptableOrUnknown(data['married']!, _marriedMeta),
      );
    }
    if (data.containsKey('children_count')) {
      context.handle(
        _childrenCountMeta,
        childrenCount.isAcceptableOrUnknown(
          data['children_count']!,
          _childrenCountMeta,
        ),
      );
    }
    if (data.containsKey('child_allowance_eligible')) {
      context.handle(
        _childAllowanceEligibleMeta,
        childAllowanceEligible.isAcceptableOrUnknown(
          data['child_allowance_eligible']!,
          _childAllowanceEligibleMeta,
        ),
      );
    }
    if (data.containsKey('hire_date')) {
      context.handle(
        _hireDateMeta,
        hireDate.isAcceptableOrUnknown(data['hire_date']!, _hireDateMeta),
      );
    } else if (isInserting) {
      context.missing(_hireDateMeta);
    }
    if (data.containsKey('contract_type')) {
      context.handle(
        _contractTypeMeta,
        contractType.isAcceptableOrUnknown(
          data['contract_type']!,
          _contractTypeMeta,
        ),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('job_title')) {
      context.handle(
        _jobTitleMeta,
        jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('sheba')) {
      context.handle(
        _shebaMeta,
        sheba.isAcceptableOrUnknown(data['sheba']!, _shebaMeta),
      );
    }
    if (data.containsKey('account_number')) {
      context.handle(
        _accountNumberMeta,
        accountNumber.isAcceptableOrUnknown(
          data['account_number']!,
          _accountNumberMeta,
        ),
      );
    }
    if (data.containsKey('daily_wage')) {
      context.handle(
        _dailyWageMeta,
        dailyWage.isAcceptableOrUnknown(data['daily_wage']!, _dailyWageMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyWageMeta);
    }
    if (data.containsKey('seniority_bases')) {
      context.handle(
        _seniorityBasesMeta,
        seniorityBases.isAcceptableOrUnknown(
          data['seniority_bases']!,
          _seniorityBasesMeta,
        ),
      );
    }
    if (data.containsKey('job_allowance_monthly')) {
      context.handle(
        _jobAllowanceMonthlyMeta,
        jobAllowanceMonthly.isAcceptableOrUnknown(
          data['job_allowance_monthly']!,
          _jobAllowanceMonthlyMeta,
        ),
      );
    }
    if (data.containsKey('is_hard_job')) {
      context.handle(
        _isHardJobMeta,
        isHardJob.isAcceptableOrUnknown(data['is_hard_job']!, _isHardJobMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Employee(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      personnelCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personnel_code'],
      )!,
      nationalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}national_id'],
      )!,
      insuranceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurance_number'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      fatherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}father_name'],
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      married: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}married'],
      )!,
      childrenCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}children_count'],
      )!,
      childAllowanceEligible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}child_allowance_eligible'],
      )!,
      hireDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hire_date'],
      )!,
      contractType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contract_type'],
      )!,
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      jobTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_title'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      sheba: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sheba'],
      ),
      accountNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_number'],
      ),
      dailyWage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_wage'],
      )!,
      seniorityBases: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seniority_bases'],
      ),
      jobAllowanceMonthly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}job_allowance_monthly'],
      )!,
      isHardJob: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hard_job'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(attachedDatabase, alias);
  }
}

class Employee extends DataClass implements Insertable<Employee> {
  final int id;
  final String personnelCode;
  final String nationalId;
  final String? insuranceNumber;
  final String firstName;
  final String lastName;
  final String? fatherName;
  final DateTime? birthDate;
  final String gender;
  final bool married;
  final int childrenCount;
  final bool childAllowanceEligible;
  final DateTime hireDate;
  final String contractType;
  final String? department;
  final String? jobTitle;
  final String? bankName;
  final String? sheba;
  final String? accountNumber;
  final int dailyWage;
  final int? seniorityBases;
  final int jobAllowanceMonthly;
  final bool isHardJob;
  final bool active;
  final String? notes;
  const Employee({
    required this.id,
    required this.personnelCode,
    required this.nationalId,
    this.insuranceNumber,
    required this.firstName,
    required this.lastName,
    this.fatherName,
    this.birthDate,
    required this.gender,
    required this.married,
    required this.childrenCount,
    required this.childAllowanceEligible,
    required this.hireDate,
    required this.contractType,
    this.department,
    this.jobTitle,
    this.bankName,
    this.sheba,
    this.accountNumber,
    required this.dailyWage,
    this.seniorityBases,
    required this.jobAllowanceMonthly,
    required this.isHardJob,
    required this.active,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['personnel_code'] = Variable<String>(personnelCode);
    map['national_id'] = Variable<String>(nationalId);
    if (!nullToAbsent || insuranceNumber != null) {
      map['insurance_number'] = Variable<String>(insuranceNumber);
    }
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    map['gender'] = Variable<String>(gender);
    map['married'] = Variable<bool>(married);
    map['children_count'] = Variable<int>(childrenCount);
    map['child_allowance_eligible'] = Variable<bool>(childAllowanceEligible);
    map['hire_date'] = Variable<DateTime>(hireDate);
    map['contract_type'] = Variable<String>(contractType);
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || jobTitle != null) {
      map['job_title'] = Variable<String>(jobTitle);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || sheba != null) {
      map['sheba'] = Variable<String>(sheba);
    }
    if (!nullToAbsent || accountNumber != null) {
      map['account_number'] = Variable<String>(accountNumber);
    }
    map['daily_wage'] = Variable<int>(dailyWage);
    if (!nullToAbsent || seniorityBases != null) {
      map['seniority_bases'] = Variable<int>(seniorityBases);
    }
    map['job_allowance_monthly'] = Variable<int>(jobAllowanceMonthly);
    map['is_hard_job'] = Variable<bool>(isHardJob);
    map['active'] = Variable<bool>(active);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: Value(id),
      personnelCode: Value(personnelCode),
      nationalId: Value(nationalId),
      insuranceNumber: insuranceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(insuranceNumber),
      firstName: Value(firstName),
      lastName: Value(lastName),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      gender: Value(gender),
      married: Value(married),
      childrenCount: Value(childrenCount),
      childAllowanceEligible: Value(childAllowanceEligible),
      hireDate: Value(hireDate),
      contractType: Value(contractType),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      jobTitle: jobTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTitle),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      sheba: sheba == null && nullToAbsent
          ? const Value.absent()
          : Value(sheba),
      accountNumber: accountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNumber),
      dailyWage: Value(dailyWage),
      seniorityBases: seniorityBases == null && nullToAbsent
          ? const Value.absent()
          : Value(seniorityBases),
      jobAllowanceMonthly: Value(jobAllowanceMonthly),
      isHardJob: Value(isHardJob),
      active: Value(active),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Employee.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<int>(json['id']),
      personnelCode: serializer.fromJson<String>(json['personnelCode']),
      nationalId: serializer.fromJson<String>(json['nationalId']),
      insuranceNumber: serializer.fromJson<String?>(json['insuranceNumber']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      fatherName: serializer.fromJson<String?>(json['fatherName']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      gender: serializer.fromJson<String>(json['gender']),
      married: serializer.fromJson<bool>(json['married']),
      childrenCount: serializer.fromJson<int>(json['childrenCount']),
      childAllowanceEligible: serializer.fromJson<bool>(
        json['childAllowanceEligible'],
      ),
      hireDate: serializer.fromJson<DateTime>(json['hireDate']),
      contractType: serializer.fromJson<String>(json['contractType']),
      department: serializer.fromJson<String?>(json['department']),
      jobTitle: serializer.fromJson<String?>(json['jobTitle']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      sheba: serializer.fromJson<String?>(json['sheba']),
      accountNumber: serializer.fromJson<String?>(json['accountNumber']),
      dailyWage: serializer.fromJson<int>(json['dailyWage']),
      seniorityBases: serializer.fromJson<int?>(json['seniorityBases']),
      jobAllowanceMonthly: serializer.fromJson<int>(
        json['jobAllowanceMonthly'],
      ),
      isHardJob: serializer.fromJson<bool>(json['isHardJob']),
      active: serializer.fromJson<bool>(json['active']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'personnelCode': serializer.toJson<String>(personnelCode),
      'nationalId': serializer.toJson<String>(nationalId),
      'insuranceNumber': serializer.toJson<String?>(insuranceNumber),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'fatherName': serializer.toJson<String?>(fatherName),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'gender': serializer.toJson<String>(gender),
      'married': serializer.toJson<bool>(married),
      'childrenCount': serializer.toJson<int>(childrenCount),
      'childAllowanceEligible': serializer.toJson<bool>(childAllowanceEligible),
      'hireDate': serializer.toJson<DateTime>(hireDate),
      'contractType': serializer.toJson<String>(contractType),
      'department': serializer.toJson<String?>(department),
      'jobTitle': serializer.toJson<String?>(jobTitle),
      'bankName': serializer.toJson<String?>(bankName),
      'sheba': serializer.toJson<String?>(sheba),
      'accountNumber': serializer.toJson<String?>(accountNumber),
      'dailyWage': serializer.toJson<int>(dailyWage),
      'seniorityBases': serializer.toJson<int?>(seniorityBases),
      'jobAllowanceMonthly': serializer.toJson<int>(jobAllowanceMonthly),
      'isHardJob': serializer.toJson<bool>(isHardJob),
      'active': serializer.toJson<bool>(active),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Employee copyWith({
    int? id,
    String? personnelCode,
    String? nationalId,
    Value<String?> insuranceNumber = const Value.absent(),
    String? firstName,
    String? lastName,
    Value<String?> fatherName = const Value.absent(),
    Value<DateTime?> birthDate = const Value.absent(),
    String? gender,
    bool? married,
    int? childrenCount,
    bool? childAllowanceEligible,
    DateTime? hireDate,
    String? contractType,
    Value<String?> department = const Value.absent(),
    Value<String?> jobTitle = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> sheba = const Value.absent(),
    Value<String?> accountNumber = const Value.absent(),
    int? dailyWage,
    Value<int?> seniorityBases = const Value.absent(),
    int? jobAllowanceMonthly,
    bool? isHardJob,
    bool? active,
    Value<String?> notes = const Value.absent(),
  }) => Employee(
    id: id ?? this.id,
    personnelCode: personnelCode ?? this.personnelCode,
    nationalId: nationalId ?? this.nationalId,
    insuranceNumber: insuranceNumber.present
        ? insuranceNumber.value
        : this.insuranceNumber,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    fatherName: fatherName.present ? fatherName.value : this.fatherName,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    gender: gender ?? this.gender,
    married: married ?? this.married,
    childrenCount: childrenCount ?? this.childrenCount,
    childAllowanceEligible:
        childAllowanceEligible ?? this.childAllowanceEligible,
    hireDate: hireDate ?? this.hireDate,
    contractType: contractType ?? this.contractType,
    department: department.present ? department.value : this.department,
    jobTitle: jobTitle.present ? jobTitle.value : this.jobTitle,
    bankName: bankName.present ? bankName.value : this.bankName,
    sheba: sheba.present ? sheba.value : this.sheba,
    accountNumber: accountNumber.present
        ? accountNumber.value
        : this.accountNumber,
    dailyWage: dailyWage ?? this.dailyWage,
    seniorityBases: seniorityBases.present
        ? seniorityBases.value
        : this.seniorityBases,
    jobAllowanceMonthly: jobAllowanceMonthly ?? this.jobAllowanceMonthly,
    isHardJob: isHardJob ?? this.isHardJob,
    active: active ?? this.active,
    notes: notes.present ? notes.value : this.notes,
  );
  Employee copyWithCompanion(EmployeesCompanion data) {
    return Employee(
      id: data.id.present ? data.id.value : this.id,
      personnelCode: data.personnelCode.present
          ? data.personnelCode.value
          : this.personnelCode,
      nationalId: data.nationalId.present
          ? data.nationalId.value
          : this.nationalId,
      insuranceNumber: data.insuranceNumber.present
          ? data.insuranceNumber.value
          : this.insuranceNumber,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      fatherName: data.fatherName.present
          ? data.fatherName.value
          : this.fatherName,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      gender: data.gender.present ? data.gender.value : this.gender,
      married: data.married.present ? data.married.value : this.married,
      childrenCount: data.childrenCount.present
          ? data.childrenCount.value
          : this.childrenCount,
      childAllowanceEligible: data.childAllowanceEligible.present
          ? data.childAllowanceEligible.value
          : this.childAllowanceEligible,
      hireDate: data.hireDate.present ? data.hireDate.value : this.hireDate,
      contractType: data.contractType.present
          ? data.contractType.value
          : this.contractType,
      department: data.department.present
          ? data.department.value
          : this.department,
      jobTitle: data.jobTitle.present ? data.jobTitle.value : this.jobTitle,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      sheba: data.sheba.present ? data.sheba.value : this.sheba,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      dailyWage: data.dailyWage.present ? data.dailyWage.value : this.dailyWage,
      seniorityBases: data.seniorityBases.present
          ? data.seniorityBases.value
          : this.seniorityBases,
      jobAllowanceMonthly: data.jobAllowanceMonthly.present
          ? data.jobAllowanceMonthly.value
          : this.jobAllowanceMonthly,
      isHardJob: data.isHardJob.present ? data.isHardJob.value : this.isHardJob,
      active: data.active.present ? data.active.value : this.active,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('personnelCode: $personnelCode, ')
          ..write('nationalId: $nationalId, ')
          ..write('insuranceNumber: $insuranceNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fatherName: $fatherName, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('married: $married, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('childAllowanceEligible: $childAllowanceEligible, ')
          ..write('hireDate: $hireDate, ')
          ..write('contractType: $contractType, ')
          ..write('department: $department, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('bankName: $bankName, ')
          ..write('sheba: $sheba, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('dailyWage: $dailyWage, ')
          ..write('seniorityBases: $seniorityBases, ')
          ..write('jobAllowanceMonthly: $jobAllowanceMonthly, ')
          ..write('isHardJob: $isHardJob, ')
          ..write('active: $active, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    personnelCode,
    nationalId,
    insuranceNumber,
    firstName,
    lastName,
    fatherName,
    birthDate,
    gender,
    married,
    childrenCount,
    childAllowanceEligible,
    hireDate,
    contractType,
    department,
    jobTitle,
    bankName,
    sheba,
    accountNumber,
    dailyWage,
    seniorityBases,
    jobAllowanceMonthly,
    isHardJob,
    active,
    notes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.personnelCode == this.personnelCode &&
          other.nationalId == this.nationalId &&
          other.insuranceNumber == this.insuranceNumber &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.fatherName == this.fatherName &&
          other.birthDate == this.birthDate &&
          other.gender == this.gender &&
          other.married == this.married &&
          other.childrenCount == this.childrenCount &&
          other.childAllowanceEligible == this.childAllowanceEligible &&
          other.hireDate == this.hireDate &&
          other.contractType == this.contractType &&
          other.department == this.department &&
          other.jobTitle == this.jobTitle &&
          other.bankName == this.bankName &&
          other.sheba == this.sheba &&
          other.accountNumber == this.accountNumber &&
          other.dailyWage == this.dailyWage &&
          other.seniorityBases == this.seniorityBases &&
          other.jobAllowanceMonthly == this.jobAllowanceMonthly &&
          other.isHardJob == this.isHardJob &&
          other.active == this.active &&
          other.notes == this.notes);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<int> id;
  final Value<String> personnelCode;
  final Value<String> nationalId;
  final Value<String?> insuranceNumber;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> fatherName;
  final Value<DateTime?> birthDate;
  final Value<String> gender;
  final Value<bool> married;
  final Value<int> childrenCount;
  final Value<bool> childAllowanceEligible;
  final Value<DateTime> hireDate;
  final Value<String> contractType;
  final Value<String?> department;
  final Value<String?> jobTitle;
  final Value<String?> bankName;
  final Value<String?> sheba;
  final Value<String?> accountNumber;
  final Value<int> dailyWage;
  final Value<int?> seniorityBases;
  final Value<int> jobAllowanceMonthly;
  final Value<bool> isHardJob;
  final Value<bool> active;
  final Value<String?> notes;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.personnelCode = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.insuranceNumber = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.gender = const Value.absent(),
    this.married = const Value.absent(),
    this.childrenCount = const Value.absent(),
    this.childAllowanceEligible = const Value.absent(),
    this.hireDate = const Value.absent(),
    this.contractType = const Value.absent(),
    this.department = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.bankName = const Value.absent(),
    this.sheba = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.dailyWage = const Value.absent(),
    this.seniorityBases = const Value.absent(),
    this.jobAllowanceMonthly = const Value.absent(),
    this.isHardJob = const Value.absent(),
    this.active = const Value.absent(),
    this.notes = const Value.absent(),
  });
  EmployeesCompanion.insert({
    this.id = const Value.absent(),
    required String personnelCode,
    required String nationalId,
    this.insuranceNumber = const Value.absent(),
    required String firstName,
    required String lastName,
    this.fatherName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.gender = const Value.absent(),
    this.married = const Value.absent(),
    this.childrenCount = const Value.absent(),
    this.childAllowanceEligible = const Value.absent(),
    required DateTime hireDate,
    this.contractType = const Value.absent(),
    this.department = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.bankName = const Value.absent(),
    this.sheba = const Value.absent(),
    this.accountNumber = const Value.absent(),
    required int dailyWage,
    this.seniorityBases = const Value.absent(),
    this.jobAllowanceMonthly = const Value.absent(),
    this.isHardJob = const Value.absent(),
    this.active = const Value.absent(),
    this.notes = const Value.absent(),
  }) : personnelCode = Value(personnelCode),
       nationalId = Value(nationalId),
       firstName = Value(firstName),
       lastName = Value(lastName),
       hireDate = Value(hireDate),
       dailyWage = Value(dailyWage);
  static Insertable<Employee> custom({
    Expression<int>? id,
    Expression<String>? personnelCode,
    Expression<String>? nationalId,
    Expression<String>? insuranceNumber,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? fatherName,
    Expression<DateTime>? birthDate,
    Expression<String>? gender,
    Expression<bool>? married,
    Expression<int>? childrenCount,
    Expression<bool>? childAllowanceEligible,
    Expression<DateTime>? hireDate,
    Expression<String>? contractType,
    Expression<String>? department,
    Expression<String>? jobTitle,
    Expression<String>? bankName,
    Expression<String>? sheba,
    Expression<String>? accountNumber,
    Expression<int>? dailyWage,
    Expression<int>? seniorityBases,
    Expression<int>? jobAllowanceMonthly,
    Expression<bool>? isHardJob,
    Expression<bool>? active,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (personnelCode != null) 'personnel_code': personnelCode,
      if (nationalId != null) 'national_id': nationalId,
      if (insuranceNumber != null) 'insurance_number': insuranceNumber,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (fatherName != null) 'father_name': fatherName,
      if (birthDate != null) 'birth_date': birthDate,
      if (gender != null) 'gender': gender,
      if (married != null) 'married': married,
      if (childrenCount != null) 'children_count': childrenCount,
      if (childAllowanceEligible != null)
        'child_allowance_eligible': childAllowanceEligible,
      if (hireDate != null) 'hire_date': hireDate,
      if (contractType != null) 'contract_type': contractType,
      if (department != null) 'department': department,
      if (jobTitle != null) 'job_title': jobTitle,
      if (bankName != null) 'bank_name': bankName,
      if (sheba != null) 'sheba': sheba,
      if (accountNumber != null) 'account_number': accountNumber,
      if (dailyWage != null) 'daily_wage': dailyWage,
      if (seniorityBases != null) 'seniority_bases': seniorityBases,
      if (jobAllowanceMonthly != null)
        'job_allowance_monthly': jobAllowanceMonthly,
      if (isHardJob != null) 'is_hard_job': isHardJob,
      if (active != null) 'active': active,
      if (notes != null) 'notes': notes,
    });
  }

  EmployeesCompanion copyWith({
    Value<int>? id,
    Value<String>? personnelCode,
    Value<String>? nationalId,
    Value<String?>? insuranceNumber,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String?>? fatherName,
    Value<DateTime?>? birthDate,
    Value<String>? gender,
    Value<bool>? married,
    Value<int>? childrenCount,
    Value<bool>? childAllowanceEligible,
    Value<DateTime>? hireDate,
    Value<String>? contractType,
    Value<String?>? department,
    Value<String?>? jobTitle,
    Value<String?>? bankName,
    Value<String?>? sheba,
    Value<String?>? accountNumber,
    Value<int>? dailyWage,
    Value<int?>? seniorityBases,
    Value<int>? jobAllowanceMonthly,
    Value<bool>? isHardJob,
    Value<bool>? active,
    Value<String?>? notes,
  }) {
    return EmployeesCompanion(
      id: id ?? this.id,
      personnelCode: personnelCode ?? this.personnelCode,
      nationalId: nationalId ?? this.nationalId,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      married: married ?? this.married,
      childrenCount: childrenCount ?? this.childrenCount,
      childAllowanceEligible:
          childAllowanceEligible ?? this.childAllowanceEligible,
      hireDate: hireDate ?? this.hireDate,
      contractType: contractType ?? this.contractType,
      department: department ?? this.department,
      jobTitle: jobTitle ?? this.jobTitle,
      bankName: bankName ?? this.bankName,
      sheba: sheba ?? this.sheba,
      accountNumber: accountNumber ?? this.accountNumber,
      dailyWage: dailyWage ?? this.dailyWage,
      seniorityBases: seniorityBases ?? this.seniorityBases,
      jobAllowanceMonthly: jobAllowanceMonthly ?? this.jobAllowanceMonthly,
      isHardJob: isHardJob ?? this.isHardJob,
      active: active ?? this.active,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (personnelCode.present) {
      map['personnel_code'] = Variable<String>(personnelCode.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (insuranceNumber.present) {
      map['insurance_number'] = Variable<String>(insuranceNumber.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (married.present) {
      map['married'] = Variable<bool>(married.value);
    }
    if (childrenCount.present) {
      map['children_count'] = Variable<int>(childrenCount.value);
    }
    if (childAllowanceEligible.present) {
      map['child_allowance_eligible'] = Variable<bool>(
        childAllowanceEligible.value,
      );
    }
    if (hireDate.present) {
      map['hire_date'] = Variable<DateTime>(hireDate.value);
    }
    if (contractType.present) {
      map['contract_type'] = Variable<String>(contractType.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (sheba.present) {
      map['sheba'] = Variable<String>(sheba.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (dailyWage.present) {
      map['daily_wage'] = Variable<int>(dailyWage.value);
    }
    if (seniorityBases.present) {
      map['seniority_bases'] = Variable<int>(seniorityBases.value);
    }
    if (jobAllowanceMonthly.present) {
      map['job_allowance_monthly'] = Variable<int>(jobAllowanceMonthly.value);
    }
    if (isHardJob.present) {
      map['is_hard_job'] = Variable<bool>(isHardJob.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesCompanion(')
          ..write('id: $id, ')
          ..write('personnelCode: $personnelCode, ')
          ..write('nationalId: $nationalId, ')
          ..write('insuranceNumber: $insuranceNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fatherName: $fatherName, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('married: $married, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('childAllowanceEligible: $childAllowanceEligible, ')
          ..write('hireDate: $hireDate, ')
          ..write('contractType: $contractType, ')
          ..write('department: $department, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('bankName: $bankName, ')
          ..write('sheba: $sheba, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('dailyWage: $dailyWage, ')
          ..write('seniorityBases: $seniorityBases, ')
          ..write('jobAllowanceMonthly: $jobAllowanceMonthly, ')
          ..write('isHardJob: $isHardJob, ')
          ..write('active: $active, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PayItemDefinitionsTable extends PayItemDefinitions
    with TableInfo<$PayItemDefinitionsTable, PayItemDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayItemDefinitionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _calcMethodMeta = const VerificationMeta(
    'calcMethod',
  );
  @override
  late final GeneratedColumn<String> calcMethod = GeneratedColumn<String>(
    'calc_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectToInsuranceMeta =
      const VerificationMeta('subjectToInsurance');
  @override
  late final GeneratedColumn<bool> subjectToInsurance = GeneratedColumn<bool>(
    'subject_to_insurance',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("subject_to_insurance" IN (0, 1))',
    ),
  );
  static const VerificationMeta _subjectToTaxMeta = const VerificationMeta(
    'subjectToTax',
  );
  @override
  late final GeneratedColumn<bool> subjectToTax = GeneratedColumn<bool>(
    'subject_to_tax',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("subject_to_tax" IN (0, 1))',
    ),
  );
  static const VerificationMeta _exemptionCapMeta = const VerificationMeta(
    'exemptionCap',
  );
  @override
  late final GeneratedColumn<int> exemptionCap = GeneratedColumn<int>(
    'exemption_cap',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needsReviewMeta = const VerificationMeta(
    'needsReview',
  );
  @override
  late final GeneratedColumn<bool> needsReview = GeneratedColumn<bool>(
    'needs_review',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("needs_review" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    kind,
    calcMethod,
    subjectToInsurance,
    subjectToTax,
    exemptionCap,
    needsReview,
    isSystem,
    active,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pay_item_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PayItemDefinition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('calc_method')) {
      context.handle(
        _calcMethodMeta,
        calcMethod.isAcceptableOrUnknown(data['calc_method']!, _calcMethodMeta),
      );
    } else if (isInserting) {
      context.missing(_calcMethodMeta);
    }
    if (data.containsKey('subject_to_insurance')) {
      context.handle(
        _subjectToInsuranceMeta,
        subjectToInsurance.isAcceptableOrUnknown(
          data['subject_to_insurance']!,
          _subjectToInsuranceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectToInsuranceMeta);
    }
    if (data.containsKey('subject_to_tax')) {
      context.handle(
        _subjectToTaxMeta,
        subjectToTax.isAcceptableOrUnknown(
          data['subject_to_tax']!,
          _subjectToTaxMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectToTaxMeta);
    }
    if (data.containsKey('exemption_cap')) {
      context.handle(
        _exemptionCapMeta,
        exemptionCap.isAcceptableOrUnknown(
          data['exemption_cap']!,
          _exemptionCapMeta,
        ),
      );
    }
    if (data.containsKey('needs_review')) {
      context.handle(
        _needsReviewMeta,
        needsReview.isAcceptableOrUnknown(
          data['needs_review']!,
          _needsReviewMeta,
        ),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PayItemDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayItemDefinition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      calcMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calc_method'],
      )!,
      subjectToInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}subject_to_insurance'],
      )!,
      subjectToTax: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}subject_to_tax'],
      )!,
      exemptionCap: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exemption_cap'],
      ),
      needsReview: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}needs_review'],
      )!,
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $PayItemDefinitionsTable createAlias(String alias) {
    return $PayItemDefinitionsTable(attachedDatabase, alias);
  }
}

class PayItemDefinition extends DataClass
    implements Insertable<PayItemDefinition> {
  final int id;
  final String code;
  final String name;
  final String kind;
  final String calcMethod;
  final bool subjectToInsurance;
  final bool subjectToTax;
  final int? exemptionCap;
  final bool needsReview;
  final bool isSystem;
  final bool active;
  final int sortOrder;
  const PayItemDefinition({
    required this.id,
    required this.code,
    required this.name,
    required this.kind,
    required this.calcMethod,
    required this.subjectToInsurance,
    required this.subjectToTax,
    this.exemptionCap,
    required this.needsReview,
    required this.isSystem,
    required this.active,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['kind'] = Variable<String>(kind);
    map['calc_method'] = Variable<String>(calcMethod);
    map['subject_to_insurance'] = Variable<bool>(subjectToInsurance);
    map['subject_to_tax'] = Variable<bool>(subjectToTax);
    if (!nullToAbsent || exemptionCap != null) {
      map['exemption_cap'] = Variable<int>(exemptionCap);
    }
    map['needs_review'] = Variable<bool>(needsReview);
    map['is_system'] = Variable<bool>(isSystem);
    map['active'] = Variable<bool>(active);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  PayItemDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return PayItemDefinitionsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      kind: Value(kind),
      calcMethod: Value(calcMethod),
      subjectToInsurance: Value(subjectToInsurance),
      subjectToTax: Value(subjectToTax),
      exemptionCap: exemptionCap == null && nullToAbsent
          ? const Value.absent()
          : Value(exemptionCap),
      needsReview: Value(needsReview),
      isSystem: Value(isSystem),
      active: Value(active),
      sortOrder: Value(sortOrder),
    );
  }

  factory PayItemDefinition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayItemDefinition(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      kind: serializer.fromJson<String>(json['kind']),
      calcMethod: serializer.fromJson<String>(json['calcMethod']),
      subjectToInsurance: serializer.fromJson<bool>(json['subjectToInsurance']),
      subjectToTax: serializer.fromJson<bool>(json['subjectToTax']),
      exemptionCap: serializer.fromJson<int?>(json['exemptionCap']),
      needsReview: serializer.fromJson<bool>(json['needsReview']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      active: serializer.fromJson<bool>(json['active']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<String>(kind),
      'calcMethod': serializer.toJson<String>(calcMethod),
      'subjectToInsurance': serializer.toJson<bool>(subjectToInsurance),
      'subjectToTax': serializer.toJson<bool>(subjectToTax),
      'exemptionCap': serializer.toJson<int?>(exemptionCap),
      'needsReview': serializer.toJson<bool>(needsReview),
      'isSystem': serializer.toJson<bool>(isSystem),
      'active': serializer.toJson<bool>(active),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  PayItemDefinition copyWith({
    int? id,
    String? code,
    String? name,
    String? kind,
    String? calcMethod,
    bool? subjectToInsurance,
    bool? subjectToTax,
    Value<int?> exemptionCap = const Value.absent(),
    bool? needsReview,
    bool? isSystem,
    bool? active,
    int? sortOrder,
  }) => PayItemDefinition(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    kind: kind ?? this.kind,
    calcMethod: calcMethod ?? this.calcMethod,
    subjectToInsurance: subjectToInsurance ?? this.subjectToInsurance,
    subjectToTax: subjectToTax ?? this.subjectToTax,
    exemptionCap: exemptionCap.present ? exemptionCap.value : this.exemptionCap,
    needsReview: needsReview ?? this.needsReview,
    isSystem: isSystem ?? this.isSystem,
    active: active ?? this.active,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  PayItemDefinition copyWithCompanion(PayItemDefinitionsCompanion data) {
    return PayItemDefinition(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      calcMethod: data.calcMethod.present
          ? data.calcMethod.value
          : this.calcMethod,
      subjectToInsurance: data.subjectToInsurance.present
          ? data.subjectToInsurance.value
          : this.subjectToInsurance,
      subjectToTax: data.subjectToTax.present
          ? data.subjectToTax.value
          : this.subjectToTax,
      exemptionCap: data.exemptionCap.present
          ? data.exemptionCap.value
          : this.exemptionCap,
      needsReview: data.needsReview.present
          ? data.needsReview.value
          : this.needsReview,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      active: data.active.present ? data.active.value : this.active,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayItemDefinition(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('calcMethod: $calcMethod, ')
          ..write('subjectToInsurance: $subjectToInsurance, ')
          ..write('subjectToTax: $subjectToTax, ')
          ..write('exemptionCap: $exemptionCap, ')
          ..write('needsReview: $needsReview, ')
          ..write('isSystem: $isSystem, ')
          ..write('active: $active, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    kind,
    calcMethod,
    subjectToInsurance,
    subjectToTax,
    exemptionCap,
    needsReview,
    isSystem,
    active,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayItemDefinition &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.calcMethod == this.calcMethod &&
          other.subjectToInsurance == this.subjectToInsurance &&
          other.subjectToTax == this.subjectToTax &&
          other.exemptionCap == this.exemptionCap &&
          other.needsReview == this.needsReview &&
          other.isSystem == this.isSystem &&
          other.active == this.active &&
          other.sortOrder == this.sortOrder);
}

class PayItemDefinitionsCompanion extends UpdateCompanion<PayItemDefinition> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> kind;
  final Value<String> calcMethod;
  final Value<bool> subjectToInsurance;
  final Value<bool> subjectToTax;
  final Value<int?> exemptionCap;
  final Value<bool> needsReview;
  final Value<bool> isSystem;
  final Value<bool> active;
  final Value<int> sortOrder;
  const PayItemDefinitionsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.calcMethod = const Value.absent(),
    this.subjectToInsurance = const Value.absent(),
    this.subjectToTax = const Value.absent(),
    this.exemptionCap = const Value.absent(),
    this.needsReview = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.active = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  PayItemDefinitionsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String kind,
    required String calcMethod,
    required bool subjectToInsurance,
    required bool subjectToTax,
    this.exemptionCap = const Value.absent(),
    this.needsReview = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.active = const Value.absent(),
    this.sortOrder = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       kind = Value(kind),
       calcMethod = Value(calcMethod),
       subjectToInsurance = Value(subjectToInsurance),
       subjectToTax = Value(subjectToTax);
  static Insertable<PayItemDefinition> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<String>? calcMethod,
    Expression<bool>? subjectToInsurance,
    Expression<bool>? subjectToTax,
    Expression<int>? exemptionCap,
    Expression<bool>? needsReview,
    Expression<bool>? isSystem,
    Expression<bool>? active,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (calcMethod != null) 'calc_method': calcMethod,
      if (subjectToInsurance != null)
        'subject_to_insurance': subjectToInsurance,
      if (subjectToTax != null) 'subject_to_tax': subjectToTax,
      if (exemptionCap != null) 'exemption_cap': exemptionCap,
      if (needsReview != null) 'needs_review': needsReview,
      if (isSystem != null) 'is_system': isSystem,
      if (active != null) 'active': active,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  PayItemDefinitionsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? kind,
    Value<String>? calcMethod,
    Value<bool>? subjectToInsurance,
    Value<bool>? subjectToTax,
    Value<int?>? exemptionCap,
    Value<bool>? needsReview,
    Value<bool>? isSystem,
    Value<bool>? active,
    Value<int>? sortOrder,
  }) {
    return PayItemDefinitionsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      calcMethod: calcMethod ?? this.calcMethod,
      subjectToInsurance: subjectToInsurance ?? this.subjectToInsurance,
      subjectToTax: subjectToTax ?? this.subjectToTax,
      exemptionCap: exemptionCap ?? this.exemptionCap,
      needsReview: needsReview ?? this.needsReview,
      isSystem: isSystem ?? this.isSystem,
      active: active ?? this.active,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (calcMethod.present) {
      map['calc_method'] = Variable<String>(calcMethod.value);
    }
    if (subjectToInsurance.present) {
      map['subject_to_insurance'] = Variable<bool>(subjectToInsurance.value);
    }
    if (subjectToTax.present) {
      map['subject_to_tax'] = Variable<bool>(subjectToTax.value);
    }
    if (exemptionCap.present) {
      map['exemption_cap'] = Variable<int>(exemptionCap.value);
    }
    if (needsReview.present) {
      map['needs_review'] = Variable<bool>(needsReview.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayItemDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('calcMethod: $calcMethod, ')
          ..write('subjectToInsurance: $subjectToInsurance, ')
          ..write('subjectToTax: $subjectToTax, ')
          ..write('exemptionCap: $exemptionCap, ')
          ..write('needsReview: $needsReview, ')
          ..write('isSystem: $isSystem, ')
          ..write('active: $active, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $MonthlyPeriodsTable extends MonthlyPeriods
    with TableInfo<$MonthlyPeriodsTable, MonthlyPeriod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MonthlyPeriodsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _lockedAtMeta = const VerificationMeta(
    'lockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lockedAt = GeneratedColumn<DateTime>(
    'locked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _settingsSnapshotJsonMeta =
      const VerificationMeta('settingsSnapshotJson');
  @override
  late final GeneratedColumn<String> settingsSnapshotJson =
      GeneratedColumn<String>(
        'settings_snapshot_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    year,
    month,
    status,
    lockedAt,
    settingsSnapshotJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'monthly_periods';
  @override
  VerificationContext validateIntegrity(
    Insertable<MonthlyPeriod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('locked_at')) {
      context.handle(
        _lockedAtMeta,
        lockedAt.isAcceptableOrUnknown(data['locked_at']!, _lockedAtMeta),
      );
    }
    if (data.containsKey('settings_snapshot_json')) {
      context.handle(
        _settingsSnapshotJsonMeta,
        settingsSnapshotJson.isAcceptableOrUnknown(
          data['settings_snapshot_json']!,
          _settingsSnapshotJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {year, month},
  ];
  @override
  MonthlyPeriod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyPeriod(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      lockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}locked_at'],
      ),
      settingsSnapshotJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settings_snapshot_json'],
      ),
    );
  }

  @override
  $MonthlyPeriodsTable createAlias(String alias) {
    return $MonthlyPeriodsTable(attachedDatabase, alias);
  }
}

class MonthlyPeriod extends DataClass implements Insertable<MonthlyPeriod> {
  final int id;
  final int year;
  final int month;
  final String status;
  final DateTime? lockedAt;
  final String? settingsSnapshotJson;
  const MonthlyPeriod({
    required this.id,
    required this.year,
    required this.month,
    required this.status,
    this.lockedAt,
    this.settingsSnapshotJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || lockedAt != null) {
      map['locked_at'] = Variable<DateTime>(lockedAt);
    }
    if (!nullToAbsent || settingsSnapshotJson != null) {
      map['settings_snapshot_json'] = Variable<String>(settingsSnapshotJson);
    }
    return map;
  }

  MonthlyPeriodsCompanion toCompanion(bool nullToAbsent) {
    return MonthlyPeriodsCompanion(
      id: Value(id),
      year: Value(year),
      month: Value(month),
      status: Value(status),
      lockedAt: lockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lockedAt),
      settingsSnapshotJson: settingsSnapshotJson == null && nullToAbsent
          ? const Value.absent()
          : Value(settingsSnapshotJson),
    );
  }

  factory MonthlyPeriod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyPeriod(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      status: serializer.fromJson<String>(json['status']),
      lockedAt: serializer.fromJson<DateTime?>(json['lockedAt']),
      settingsSnapshotJson: serializer.fromJson<String?>(
        json['settingsSnapshotJson'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'status': serializer.toJson<String>(status),
      'lockedAt': serializer.toJson<DateTime?>(lockedAt),
      'settingsSnapshotJson': serializer.toJson<String?>(settingsSnapshotJson),
    };
  }

  MonthlyPeriod copyWith({
    int? id,
    int? year,
    int? month,
    String? status,
    Value<DateTime?> lockedAt = const Value.absent(),
    Value<String?> settingsSnapshotJson = const Value.absent(),
  }) => MonthlyPeriod(
    id: id ?? this.id,
    year: year ?? this.year,
    month: month ?? this.month,
    status: status ?? this.status,
    lockedAt: lockedAt.present ? lockedAt.value : this.lockedAt,
    settingsSnapshotJson: settingsSnapshotJson.present
        ? settingsSnapshotJson.value
        : this.settingsSnapshotJson,
  );
  MonthlyPeriod copyWithCompanion(MonthlyPeriodsCompanion data) {
    return MonthlyPeriod(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      month: data.month.present ? data.month.value : this.month,
      status: data.status.present ? data.status.value : this.status,
      lockedAt: data.lockedAt.present ? data.lockedAt.value : this.lockedAt,
      settingsSnapshotJson: data.settingsSnapshotJson.present
          ? data.settingsSnapshotJson.value
          : this.settingsSnapshotJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyPeriod(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('status: $status, ')
          ..write('lockedAt: $lockedAt, ')
          ..write('settingsSnapshotJson: $settingsSnapshotJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, year, month, status, lockedAt, settingsSnapshotJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyPeriod &&
          other.id == this.id &&
          other.year == this.year &&
          other.month == this.month &&
          other.status == this.status &&
          other.lockedAt == this.lockedAt &&
          other.settingsSnapshotJson == this.settingsSnapshotJson);
}

class MonthlyPeriodsCompanion extends UpdateCompanion<MonthlyPeriod> {
  final Value<int> id;
  final Value<int> year;
  final Value<int> month;
  final Value<String> status;
  final Value<DateTime?> lockedAt;
  final Value<String?> settingsSnapshotJson;
  const MonthlyPeriodsCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.status = const Value.absent(),
    this.lockedAt = const Value.absent(),
    this.settingsSnapshotJson = const Value.absent(),
  });
  MonthlyPeriodsCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    required int month,
    this.status = const Value.absent(),
    this.lockedAt = const Value.absent(),
    this.settingsSnapshotJson = const Value.absent(),
  }) : year = Value(year),
       month = Value(month);
  static Insertable<MonthlyPeriod> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<int>? month,
    Expression<String>? status,
    Expression<DateTime>? lockedAt,
    Expression<String>? settingsSnapshotJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (status != null) 'status': status,
      if (lockedAt != null) 'locked_at': lockedAt,
      if (settingsSnapshotJson != null)
        'settings_snapshot_json': settingsSnapshotJson,
    });
  }

  MonthlyPeriodsCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<int>? month,
    Value<String>? status,
    Value<DateTime?>? lockedAt,
    Value<String?>? settingsSnapshotJson,
  }) {
    return MonthlyPeriodsCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      month: month ?? this.month,
      status: status ?? this.status,
      lockedAt: lockedAt ?? this.lockedAt,
      settingsSnapshotJson: settingsSnapshotJson ?? this.settingsSnapshotJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lockedAt.present) {
      map['locked_at'] = Variable<DateTime>(lockedAt.value);
    }
    if (settingsSnapshotJson.present) {
      map['settings_snapshot_json'] = Variable<String>(
        settingsSnapshotJson.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyPeriodsCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('status: $status, ')
          ..write('lockedAt: $lockedAt, ')
          ..write('settingsSnapshotJson: $settingsSnapshotJson')
          ..write(')'))
        .toString();
  }
}

class $MonthlyInputsTable extends MonthlyInputs
    with TableInfo<$MonthlyInputsTable, MonthlyInput> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MonthlyInputsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _periodIdMeta = const VerificationMeta(
    'periodId',
  );
  @override
  late final GeneratedColumn<int> periodId = GeneratedColumn<int>(
    'period_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES monthly_periods (id)',
    ),
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
    'employee_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employees (id)',
    ),
  );
  static const VerificationMeta _workedDaysMeta = const VerificationMeta(
    'workedDays',
  );
  @override
  late final GeneratedColumn<int> workedDays = GeneratedColumn<int>(
    'worked_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _overtimeHoursMeta = const VerificationMeta(
    'overtimeHours',
  );
  @override
  late final GeneratedColumn<double> overtimeHours = GeneratedColumn<double>(
    'overtime_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nightHoursMeta = const VerificationMeta(
    'nightHours',
  );
  @override
  late final GeneratedColumn<double> nightHours = GeneratedColumn<double>(
    'night_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _holidayHoursMeta = const VerificationMeta(
    'holidayHours',
  );
  @override
  late final GeneratedColumn<double> holidayHours = GeneratedColumn<double>(
    'holiday_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _absenceDaysMeta = const VerificationMeta(
    'absenceDays',
  );
  @override
  late final GeneratedColumn<int> absenceDays = GeneratedColumn<int>(
    'absence_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unpaidLeaveDaysMeta = const VerificationMeta(
    'unpaidLeaveDays',
  );
  @override
  late final GeneratedColumn<int> unpaidLeaveDays = GeneratedColumn<int>(
    'unpaid_leave_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bonusAmountMeta = const VerificationMeta(
    'bonusAmount',
  );
  @override
  late final GeneratedColumn<int> bonusAmount = GeneratedColumn<int>(
    'bonus_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _advanceAmountMeta = const VerificationMeta(
    'advanceAmount',
  );
  @override
  late final GeneratedColumn<int> advanceAmount = GeneratedColumn<int>(
    'advance_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _loanAmountMeta = const VerificationMeta(
    'loanAmount',
  );
  @override
  late final GeneratedColumn<int> loanAmount = GeneratedColumn<int>(
    'loan_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _penaltyAmountMeta = const VerificationMeta(
    'penaltyAmount',
  );
  @override
  late final GeneratedColumn<int> penaltyAmount = GeneratedColumn<int>(
    'penalty_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _manualJsonMeta = const VerificationMeta(
    'manualJson',
  );
  @override
  late final GeneratedColumn<String> manualJson = GeneratedColumn<String>(
    'manual_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodId,
    employeeId,
    workedDays,
    overtimeHours,
    nightHours,
    holidayHours,
    absenceDays,
    unpaidLeaveDays,
    bonusAmount,
    advanceAmount,
    loanAmount,
    penaltyAmount,
    manualJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'monthly_inputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MonthlyInput> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('period_id')) {
      context.handle(
        _periodIdMeta,
        periodId.isAcceptableOrUnknown(data['period_id']!, _periodIdMeta),
      );
    } else if (isInserting) {
      context.missing(_periodIdMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('worked_days')) {
      context.handle(
        _workedDaysMeta,
        workedDays.isAcceptableOrUnknown(data['worked_days']!, _workedDaysMeta),
      );
    }
    if (data.containsKey('overtime_hours')) {
      context.handle(
        _overtimeHoursMeta,
        overtimeHours.isAcceptableOrUnknown(
          data['overtime_hours']!,
          _overtimeHoursMeta,
        ),
      );
    }
    if (data.containsKey('night_hours')) {
      context.handle(
        _nightHoursMeta,
        nightHours.isAcceptableOrUnknown(data['night_hours']!, _nightHoursMeta),
      );
    }
    if (data.containsKey('holiday_hours')) {
      context.handle(
        _holidayHoursMeta,
        holidayHours.isAcceptableOrUnknown(
          data['holiday_hours']!,
          _holidayHoursMeta,
        ),
      );
    }
    if (data.containsKey('absence_days')) {
      context.handle(
        _absenceDaysMeta,
        absenceDays.isAcceptableOrUnknown(
          data['absence_days']!,
          _absenceDaysMeta,
        ),
      );
    }
    if (data.containsKey('unpaid_leave_days')) {
      context.handle(
        _unpaidLeaveDaysMeta,
        unpaidLeaveDays.isAcceptableOrUnknown(
          data['unpaid_leave_days']!,
          _unpaidLeaveDaysMeta,
        ),
      );
    }
    if (data.containsKey('bonus_amount')) {
      context.handle(
        _bonusAmountMeta,
        bonusAmount.isAcceptableOrUnknown(
          data['bonus_amount']!,
          _bonusAmountMeta,
        ),
      );
    }
    if (data.containsKey('advance_amount')) {
      context.handle(
        _advanceAmountMeta,
        advanceAmount.isAcceptableOrUnknown(
          data['advance_amount']!,
          _advanceAmountMeta,
        ),
      );
    }
    if (data.containsKey('loan_amount')) {
      context.handle(
        _loanAmountMeta,
        loanAmount.isAcceptableOrUnknown(data['loan_amount']!, _loanAmountMeta),
      );
    }
    if (data.containsKey('penalty_amount')) {
      context.handle(
        _penaltyAmountMeta,
        penaltyAmount.isAcceptableOrUnknown(
          data['penalty_amount']!,
          _penaltyAmountMeta,
        ),
      );
    }
    if (data.containsKey('manual_json')) {
      context.handle(
        _manualJsonMeta,
        manualJson.isAcceptableOrUnknown(data['manual_json']!, _manualJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {periodId, employeeId},
  ];
  @override
  MonthlyInput map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyInput(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      periodId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_id'],
      )!,
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_id'],
      )!,
      workedDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}worked_days'],
      )!,
      overtimeHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}overtime_hours'],
      )!,
      nightHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}night_hours'],
      )!,
      holidayHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}holiday_hours'],
      )!,
      absenceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}absence_days'],
      )!,
      unpaidLeaveDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unpaid_leave_days'],
      )!,
      bonusAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bonus_amount'],
      )!,
      advanceAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_amount'],
      )!,
      loanAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loan_amount'],
      )!,
      penaltyAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}penalty_amount'],
      )!,
      manualJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manual_json'],
      )!,
    );
  }

  @override
  $MonthlyInputsTable createAlias(String alias) {
    return $MonthlyInputsTable(attachedDatabase, alias);
  }
}

class MonthlyInput extends DataClass implements Insertable<MonthlyInput> {
  final int id;
  final int periodId;
  final int employeeId;
  final int workedDays;
  final double overtimeHours;
  final double nightHours;
  final double holidayHours;
  final int absenceDays;
  final int unpaidLeaveDays;
  final int bonusAmount;
  final int advanceAmount;
  final int loanAmount;
  final int penaltyAmount;
  final String manualJson;
  const MonthlyInput({
    required this.id,
    required this.periodId,
    required this.employeeId,
    required this.workedDays,
    required this.overtimeHours,
    required this.nightHours,
    required this.holidayHours,
    required this.absenceDays,
    required this.unpaidLeaveDays,
    required this.bonusAmount,
    required this.advanceAmount,
    required this.loanAmount,
    required this.penaltyAmount,
    required this.manualJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['period_id'] = Variable<int>(periodId);
    map['employee_id'] = Variable<int>(employeeId);
    map['worked_days'] = Variable<int>(workedDays);
    map['overtime_hours'] = Variable<double>(overtimeHours);
    map['night_hours'] = Variable<double>(nightHours);
    map['holiday_hours'] = Variable<double>(holidayHours);
    map['absence_days'] = Variable<int>(absenceDays);
    map['unpaid_leave_days'] = Variable<int>(unpaidLeaveDays);
    map['bonus_amount'] = Variable<int>(bonusAmount);
    map['advance_amount'] = Variable<int>(advanceAmount);
    map['loan_amount'] = Variable<int>(loanAmount);
    map['penalty_amount'] = Variable<int>(penaltyAmount);
    map['manual_json'] = Variable<String>(manualJson);
    return map;
  }

  MonthlyInputsCompanion toCompanion(bool nullToAbsent) {
    return MonthlyInputsCompanion(
      id: Value(id),
      periodId: Value(periodId),
      employeeId: Value(employeeId),
      workedDays: Value(workedDays),
      overtimeHours: Value(overtimeHours),
      nightHours: Value(nightHours),
      holidayHours: Value(holidayHours),
      absenceDays: Value(absenceDays),
      unpaidLeaveDays: Value(unpaidLeaveDays),
      bonusAmount: Value(bonusAmount),
      advanceAmount: Value(advanceAmount),
      loanAmount: Value(loanAmount),
      penaltyAmount: Value(penaltyAmount),
      manualJson: Value(manualJson),
    );
  }

  factory MonthlyInput.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyInput(
      id: serializer.fromJson<int>(json['id']),
      periodId: serializer.fromJson<int>(json['periodId']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      workedDays: serializer.fromJson<int>(json['workedDays']),
      overtimeHours: serializer.fromJson<double>(json['overtimeHours']),
      nightHours: serializer.fromJson<double>(json['nightHours']),
      holidayHours: serializer.fromJson<double>(json['holidayHours']),
      absenceDays: serializer.fromJson<int>(json['absenceDays']),
      unpaidLeaveDays: serializer.fromJson<int>(json['unpaidLeaveDays']),
      bonusAmount: serializer.fromJson<int>(json['bonusAmount']),
      advanceAmount: serializer.fromJson<int>(json['advanceAmount']),
      loanAmount: serializer.fromJson<int>(json['loanAmount']),
      penaltyAmount: serializer.fromJson<int>(json['penaltyAmount']),
      manualJson: serializer.fromJson<String>(json['manualJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'periodId': serializer.toJson<int>(periodId),
      'employeeId': serializer.toJson<int>(employeeId),
      'workedDays': serializer.toJson<int>(workedDays),
      'overtimeHours': serializer.toJson<double>(overtimeHours),
      'nightHours': serializer.toJson<double>(nightHours),
      'holidayHours': serializer.toJson<double>(holidayHours),
      'absenceDays': serializer.toJson<int>(absenceDays),
      'unpaidLeaveDays': serializer.toJson<int>(unpaidLeaveDays),
      'bonusAmount': serializer.toJson<int>(bonusAmount),
      'advanceAmount': serializer.toJson<int>(advanceAmount),
      'loanAmount': serializer.toJson<int>(loanAmount),
      'penaltyAmount': serializer.toJson<int>(penaltyAmount),
      'manualJson': serializer.toJson<String>(manualJson),
    };
  }

  MonthlyInput copyWith({
    int? id,
    int? periodId,
    int? employeeId,
    int? workedDays,
    double? overtimeHours,
    double? nightHours,
    double? holidayHours,
    int? absenceDays,
    int? unpaidLeaveDays,
    int? bonusAmount,
    int? advanceAmount,
    int? loanAmount,
    int? penaltyAmount,
    String? manualJson,
  }) => MonthlyInput(
    id: id ?? this.id,
    periodId: periodId ?? this.periodId,
    employeeId: employeeId ?? this.employeeId,
    workedDays: workedDays ?? this.workedDays,
    overtimeHours: overtimeHours ?? this.overtimeHours,
    nightHours: nightHours ?? this.nightHours,
    holidayHours: holidayHours ?? this.holidayHours,
    absenceDays: absenceDays ?? this.absenceDays,
    unpaidLeaveDays: unpaidLeaveDays ?? this.unpaidLeaveDays,
    bonusAmount: bonusAmount ?? this.bonusAmount,
    advanceAmount: advanceAmount ?? this.advanceAmount,
    loanAmount: loanAmount ?? this.loanAmount,
    penaltyAmount: penaltyAmount ?? this.penaltyAmount,
    manualJson: manualJson ?? this.manualJson,
  );
  MonthlyInput copyWithCompanion(MonthlyInputsCompanion data) {
    return MonthlyInput(
      id: data.id.present ? data.id.value : this.id,
      periodId: data.periodId.present ? data.periodId.value : this.periodId,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      workedDays: data.workedDays.present
          ? data.workedDays.value
          : this.workedDays,
      overtimeHours: data.overtimeHours.present
          ? data.overtimeHours.value
          : this.overtimeHours,
      nightHours: data.nightHours.present
          ? data.nightHours.value
          : this.nightHours,
      holidayHours: data.holidayHours.present
          ? data.holidayHours.value
          : this.holidayHours,
      absenceDays: data.absenceDays.present
          ? data.absenceDays.value
          : this.absenceDays,
      unpaidLeaveDays: data.unpaidLeaveDays.present
          ? data.unpaidLeaveDays.value
          : this.unpaidLeaveDays,
      bonusAmount: data.bonusAmount.present
          ? data.bonusAmount.value
          : this.bonusAmount,
      advanceAmount: data.advanceAmount.present
          ? data.advanceAmount.value
          : this.advanceAmount,
      loanAmount: data.loanAmount.present
          ? data.loanAmount.value
          : this.loanAmount,
      penaltyAmount: data.penaltyAmount.present
          ? data.penaltyAmount.value
          : this.penaltyAmount,
      manualJson: data.manualJson.present
          ? data.manualJson.value
          : this.manualJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyInput(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('employeeId: $employeeId, ')
          ..write('workedDays: $workedDays, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('nightHours: $nightHours, ')
          ..write('holidayHours: $holidayHours, ')
          ..write('absenceDays: $absenceDays, ')
          ..write('unpaidLeaveDays: $unpaidLeaveDays, ')
          ..write('bonusAmount: $bonusAmount, ')
          ..write('advanceAmount: $advanceAmount, ')
          ..write('loanAmount: $loanAmount, ')
          ..write('penaltyAmount: $penaltyAmount, ')
          ..write('manualJson: $manualJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    periodId,
    employeeId,
    workedDays,
    overtimeHours,
    nightHours,
    holidayHours,
    absenceDays,
    unpaidLeaveDays,
    bonusAmount,
    advanceAmount,
    loanAmount,
    penaltyAmount,
    manualJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyInput &&
          other.id == this.id &&
          other.periodId == this.periodId &&
          other.employeeId == this.employeeId &&
          other.workedDays == this.workedDays &&
          other.overtimeHours == this.overtimeHours &&
          other.nightHours == this.nightHours &&
          other.holidayHours == this.holidayHours &&
          other.absenceDays == this.absenceDays &&
          other.unpaidLeaveDays == this.unpaidLeaveDays &&
          other.bonusAmount == this.bonusAmount &&
          other.advanceAmount == this.advanceAmount &&
          other.loanAmount == this.loanAmount &&
          other.penaltyAmount == this.penaltyAmount &&
          other.manualJson == this.manualJson);
}

class MonthlyInputsCompanion extends UpdateCompanion<MonthlyInput> {
  final Value<int> id;
  final Value<int> periodId;
  final Value<int> employeeId;
  final Value<int> workedDays;
  final Value<double> overtimeHours;
  final Value<double> nightHours;
  final Value<double> holidayHours;
  final Value<int> absenceDays;
  final Value<int> unpaidLeaveDays;
  final Value<int> bonusAmount;
  final Value<int> advanceAmount;
  final Value<int> loanAmount;
  final Value<int> penaltyAmount;
  final Value<String> manualJson;
  const MonthlyInputsCompanion({
    this.id = const Value.absent(),
    this.periodId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.workedDays = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    this.nightHours = const Value.absent(),
    this.holidayHours = const Value.absent(),
    this.absenceDays = const Value.absent(),
    this.unpaidLeaveDays = const Value.absent(),
    this.bonusAmount = const Value.absent(),
    this.advanceAmount = const Value.absent(),
    this.loanAmount = const Value.absent(),
    this.penaltyAmount = const Value.absent(),
    this.manualJson = const Value.absent(),
  });
  MonthlyInputsCompanion.insert({
    this.id = const Value.absent(),
    required int periodId,
    required int employeeId,
    this.workedDays = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    this.nightHours = const Value.absent(),
    this.holidayHours = const Value.absent(),
    this.absenceDays = const Value.absent(),
    this.unpaidLeaveDays = const Value.absent(),
    this.bonusAmount = const Value.absent(),
    this.advanceAmount = const Value.absent(),
    this.loanAmount = const Value.absent(),
    this.penaltyAmount = const Value.absent(),
    this.manualJson = const Value.absent(),
  }) : periodId = Value(periodId),
       employeeId = Value(employeeId);
  static Insertable<MonthlyInput> custom({
    Expression<int>? id,
    Expression<int>? periodId,
    Expression<int>? employeeId,
    Expression<int>? workedDays,
    Expression<double>? overtimeHours,
    Expression<double>? nightHours,
    Expression<double>? holidayHours,
    Expression<int>? absenceDays,
    Expression<int>? unpaidLeaveDays,
    Expression<int>? bonusAmount,
    Expression<int>? advanceAmount,
    Expression<int>? loanAmount,
    Expression<int>? penaltyAmount,
    Expression<String>? manualJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodId != null) 'period_id': periodId,
      if (employeeId != null) 'employee_id': employeeId,
      if (workedDays != null) 'worked_days': workedDays,
      if (overtimeHours != null) 'overtime_hours': overtimeHours,
      if (nightHours != null) 'night_hours': nightHours,
      if (holidayHours != null) 'holiday_hours': holidayHours,
      if (absenceDays != null) 'absence_days': absenceDays,
      if (unpaidLeaveDays != null) 'unpaid_leave_days': unpaidLeaveDays,
      if (bonusAmount != null) 'bonus_amount': bonusAmount,
      if (advanceAmount != null) 'advance_amount': advanceAmount,
      if (loanAmount != null) 'loan_amount': loanAmount,
      if (penaltyAmount != null) 'penalty_amount': penaltyAmount,
      if (manualJson != null) 'manual_json': manualJson,
    });
  }

  MonthlyInputsCompanion copyWith({
    Value<int>? id,
    Value<int>? periodId,
    Value<int>? employeeId,
    Value<int>? workedDays,
    Value<double>? overtimeHours,
    Value<double>? nightHours,
    Value<double>? holidayHours,
    Value<int>? absenceDays,
    Value<int>? unpaidLeaveDays,
    Value<int>? bonusAmount,
    Value<int>? advanceAmount,
    Value<int>? loanAmount,
    Value<int>? penaltyAmount,
    Value<String>? manualJson,
  }) {
    return MonthlyInputsCompanion(
      id: id ?? this.id,
      periodId: periodId ?? this.periodId,
      employeeId: employeeId ?? this.employeeId,
      workedDays: workedDays ?? this.workedDays,
      overtimeHours: overtimeHours ?? this.overtimeHours,
      nightHours: nightHours ?? this.nightHours,
      holidayHours: holidayHours ?? this.holidayHours,
      absenceDays: absenceDays ?? this.absenceDays,
      unpaidLeaveDays: unpaidLeaveDays ?? this.unpaidLeaveDays,
      bonusAmount: bonusAmount ?? this.bonusAmount,
      advanceAmount: advanceAmount ?? this.advanceAmount,
      loanAmount: loanAmount ?? this.loanAmount,
      penaltyAmount: penaltyAmount ?? this.penaltyAmount,
      manualJson: manualJson ?? this.manualJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (periodId.present) {
      map['period_id'] = Variable<int>(periodId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (workedDays.present) {
      map['worked_days'] = Variable<int>(workedDays.value);
    }
    if (overtimeHours.present) {
      map['overtime_hours'] = Variable<double>(overtimeHours.value);
    }
    if (nightHours.present) {
      map['night_hours'] = Variable<double>(nightHours.value);
    }
    if (holidayHours.present) {
      map['holiday_hours'] = Variable<double>(holidayHours.value);
    }
    if (absenceDays.present) {
      map['absence_days'] = Variable<int>(absenceDays.value);
    }
    if (unpaidLeaveDays.present) {
      map['unpaid_leave_days'] = Variable<int>(unpaidLeaveDays.value);
    }
    if (bonusAmount.present) {
      map['bonus_amount'] = Variable<int>(bonusAmount.value);
    }
    if (advanceAmount.present) {
      map['advance_amount'] = Variable<int>(advanceAmount.value);
    }
    if (loanAmount.present) {
      map['loan_amount'] = Variable<int>(loanAmount.value);
    }
    if (penaltyAmount.present) {
      map['penalty_amount'] = Variable<int>(penaltyAmount.value);
    }
    if (manualJson.present) {
      map['manual_json'] = Variable<String>(manualJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyInputsCompanion(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('employeeId: $employeeId, ')
          ..write('workedDays: $workedDays, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('nightHours: $nightHours, ')
          ..write('holidayHours: $holidayHours, ')
          ..write('absenceDays: $absenceDays, ')
          ..write('unpaidLeaveDays: $unpaidLeaveDays, ')
          ..write('bonusAmount: $bonusAmount, ')
          ..write('advanceAmount: $advanceAmount, ')
          ..write('loanAmount: $loanAmount, ')
          ..write('penaltyAmount: $penaltyAmount, ')
          ..write('manualJson: $manualJson')
          ..write(')'))
        .toString();
  }
}

class $PayrollResultsTable extends PayrollResults
    with TableInfo<$PayrollResultsTable, PayrollResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayrollResultsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _periodIdMeta = const VerificationMeta(
    'periodId',
  );
  @override
  late final GeneratedColumn<int> periodId = GeneratedColumn<int>(
    'period_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES monthly_periods (id)',
    ),
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
    'employee_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employees (id)',
    ),
  );
  static const VerificationMeta _grossMeta = const VerificationMeta('gross');
  @override
  late final GeneratedColumn<int> gross = GeneratedColumn<int>(
    'gross',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _insuranceBaseMeta = const VerificationMeta(
    'insuranceBase',
  );
  @override
  late final GeneratedColumn<int> insuranceBase = GeneratedColumn<int>(
    'insurance_base',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employeeInsuranceMeta = const VerificationMeta(
    'employeeInsurance',
  );
  @override
  late final GeneratedColumn<int> employeeInsurance = GeneratedColumn<int>(
    'employee_insurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employerInsuranceMeta = const VerificationMeta(
    'employerInsurance',
  );
  @override
  late final GeneratedColumn<int> employerInsurance = GeneratedColumn<int>(
    'employer_insurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unemploymentInsuranceMeta =
      const VerificationMeta('unemploymentInsurance');
  @override
  late final GeneratedColumn<int> unemploymentInsurance = GeneratedColumn<int>(
    'unemployment_insurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxBaseMeta = const VerificationMeta(
    'taxBase',
  );
  @override
  late final GeneratedColumn<int> taxBase = GeneratedColumn<int>(
    'tax_base',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<int> tax = GeneratedColumn<int>(
    'tax',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _otherDeductionsMeta = const VerificationMeta(
    'otherDeductions',
  );
  @override
  late final GeneratedColumn<int> otherDeductions = GeneratedColumn<int>(
    'other_deductions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _netMeta = const VerificationMeta('net');
  @override
  late final GeneratedColumn<int> net = GeneratedColumn<int>(
    'net',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employerTotalCostMeta = const VerificationMeta(
    'employerTotalCost',
  );
  @override
  late final GeneratedColumn<int> employerTotalCost = GeneratedColumn<int>(
    'employer_total_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breakdownJsonMeta = const VerificationMeta(
    'breakdownJson',
  );
  @override
  late final GeneratedColumn<String> breakdownJson = GeneratedColumn<String>(
    'breakdown_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _manualAdjustedMeta = const VerificationMeta(
    'manualAdjusted',
  );
  @override
  late final GeneratedColumn<bool> manualAdjusted = GeneratedColumn<bool>(
    'manual_adjusted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("manual_adjusted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _adjustmentReasonMeta = const VerificationMeta(
    'adjustmentReason',
  );
  @override
  late final GeneratedColumn<String> adjustmentReason = GeneratedColumn<String>(
    'adjustment_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodId,
    employeeId,
    gross,
    insuranceBase,
    employeeInsurance,
    employerInsurance,
    unemploymentInsurance,
    taxBase,
    tax,
    otherDeductions,
    net,
    employerTotalCost,
    breakdownJson,
    manualAdjusted,
    adjustmentReason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payroll_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<PayrollResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('period_id')) {
      context.handle(
        _periodIdMeta,
        periodId.isAcceptableOrUnknown(data['period_id']!, _periodIdMeta),
      );
    } else if (isInserting) {
      context.missing(_periodIdMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('gross')) {
      context.handle(
        _grossMeta,
        gross.isAcceptableOrUnknown(data['gross']!, _grossMeta),
      );
    } else if (isInserting) {
      context.missing(_grossMeta);
    }
    if (data.containsKey('insurance_base')) {
      context.handle(
        _insuranceBaseMeta,
        insuranceBase.isAcceptableOrUnknown(
          data['insurance_base']!,
          _insuranceBaseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_insuranceBaseMeta);
    }
    if (data.containsKey('employee_insurance')) {
      context.handle(
        _employeeInsuranceMeta,
        employeeInsurance.isAcceptableOrUnknown(
          data['employee_insurance']!,
          _employeeInsuranceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeeInsuranceMeta);
    }
    if (data.containsKey('employer_insurance')) {
      context.handle(
        _employerInsuranceMeta,
        employerInsurance.isAcceptableOrUnknown(
          data['employer_insurance']!,
          _employerInsuranceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employerInsuranceMeta);
    }
    if (data.containsKey('unemployment_insurance')) {
      context.handle(
        _unemploymentInsuranceMeta,
        unemploymentInsurance.isAcceptableOrUnknown(
          data['unemployment_insurance']!,
          _unemploymentInsuranceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unemploymentInsuranceMeta);
    }
    if (data.containsKey('tax_base')) {
      context.handle(
        _taxBaseMeta,
        taxBase.isAcceptableOrUnknown(data['tax_base']!, _taxBaseMeta),
      );
    } else if (isInserting) {
      context.missing(_taxBaseMeta);
    }
    if (data.containsKey('tax')) {
      context.handle(
        _taxMeta,
        tax.isAcceptableOrUnknown(data['tax']!, _taxMeta),
      );
    } else if (isInserting) {
      context.missing(_taxMeta);
    }
    if (data.containsKey('other_deductions')) {
      context.handle(
        _otherDeductionsMeta,
        otherDeductions.isAcceptableOrUnknown(
          data['other_deductions']!,
          _otherDeductionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_otherDeductionsMeta);
    }
    if (data.containsKey('net')) {
      context.handle(
        _netMeta,
        net.isAcceptableOrUnknown(data['net']!, _netMeta),
      );
    } else if (isInserting) {
      context.missing(_netMeta);
    }
    if (data.containsKey('employer_total_cost')) {
      context.handle(
        _employerTotalCostMeta,
        employerTotalCost.isAcceptableOrUnknown(
          data['employer_total_cost']!,
          _employerTotalCostMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employerTotalCostMeta);
    }
    if (data.containsKey('breakdown_json')) {
      context.handle(
        _breakdownJsonMeta,
        breakdownJson.isAcceptableOrUnknown(
          data['breakdown_json']!,
          _breakdownJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_breakdownJsonMeta);
    }
    if (data.containsKey('manual_adjusted')) {
      context.handle(
        _manualAdjustedMeta,
        manualAdjusted.isAcceptableOrUnknown(
          data['manual_adjusted']!,
          _manualAdjustedMeta,
        ),
      );
    }
    if (data.containsKey('adjustment_reason')) {
      context.handle(
        _adjustmentReasonMeta,
        adjustmentReason.isAcceptableOrUnknown(
          data['adjustment_reason']!,
          _adjustmentReasonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {periodId, employeeId},
  ];
  @override
  PayrollResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayrollResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      periodId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_id'],
      )!,
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_id'],
      )!,
      gross: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gross'],
      )!,
      insuranceBase: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}insurance_base'],
      )!,
      employeeInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_insurance'],
      )!,
      employerInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employer_insurance'],
      )!,
      unemploymentInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unemployment_insurance'],
      )!,
      taxBase: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_base'],
      )!,
      tax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax'],
      )!,
      otherDeductions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}other_deductions'],
      )!,
      net: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}net'],
      )!,
      employerTotalCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employer_total_cost'],
      )!,
      breakdownJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breakdown_json'],
      )!,
      manualAdjusted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}manual_adjusted'],
      )!,
      adjustmentReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adjustment_reason'],
      ),
    );
  }

  @override
  $PayrollResultsTable createAlias(String alias) {
    return $PayrollResultsTable(attachedDatabase, alias);
  }
}

class PayrollResult extends DataClass implements Insertable<PayrollResult> {
  final int id;
  final int periodId;
  final int employeeId;
  final int gross;
  final int insuranceBase;
  final int employeeInsurance;
  final int employerInsurance;
  final int unemploymentInsurance;
  final int taxBase;
  final int tax;
  final int otherDeductions;
  final int net;
  final int employerTotalCost;
  final String breakdownJson;
  final bool manualAdjusted;
  final String? adjustmentReason;
  const PayrollResult({
    required this.id,
    required this.periodId,
    required this.employeeId,
    required this.gross,
    required this.insuranceBase,
    required this.employeeInsurance,
    required this.employerInsurance,
    required this.unemploymentInsurance,
    required this.taxBase,
    required this.tax,
    required this.otherDeductions,
    required this.net,
    required this.employerTotalCost,
    required this.breakdownJson,
    required this.manualAdjusted,
    this.adjustmentReason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['period_id'] = Variable<int>(periodId);
    map['employee_id'] = Variable<int>(employeeId);
    map['gross'] = Variable<int>(gross);
    map['insurance_base'] = Variable<int>(insuranceBase);
    map['employee_insurance'] = Variable<int>(employeeInsurance);
    map['employer_insurance'] = Variable<int>(employerInsurance);
    map['unemployment_insurance'] = Variable<int>(unemploymentInsurance);
    map['tax_base'] = Variable<int>(taxBase);
    map['tax'] = Variable<int>(tax);
    map['other_deductions'] = Variable<int>(otherDeductions);
    map['net'] = Variable<int>(net);
    map['employer_total_cost'] = Variable<int>(employerTotalCost);
    map['breakdown_json'] = Variable<String>(breakdownJson);
    map['manual_adjusted'] = Variable<bool>(manualAdjusted);
    if (!nullToAbsent || adjustmentReason != null) {
      map['adjustment_reason'] = Variable<String>(adjustmentReason);
    }
    return map;
  }

  PayrollResultsCompanion toCompanion(bool nullToAbsent) {
    return PayrollResultsCompanion(
      id: Value(id),
      periodId: Value(periodId),
      employeeId: Value(employeeId),
      gross: Value(gross),
      insuranceBase: Value(insuranceBase),
      employeeInsurance: Value(employeeInsurance),
      employerInsurance: Value(employerInsurance),
      unemploymentInsurance: Value(unemploymentInsurance),
      taxBase: Value(taxBase),
      tax: Value(tax),
      otherDeductions: Value(otherDeductions),
      net: Value(net),
      employerTotalCost: Value(employerTotalCost),
      breakdownJson: Value(breakdownJson),
      manualAdjusted: Value(manualAdjusted),
      adjustmentReason: adjustmentReason == null && nullToAbsent
          ? const Value.absent()
          : Value(adjustmentReason),
    );
  }

  factory PayrollResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayrollResult(
      id: serializer.fromJson<int>(json['id']),
      periodId: serializer.fromJson<int>(json['periodId']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      gross: serializer.fromJson<int>(json['gross']),
      insuranceBase: serializer.fromJson<int>(json['insuranceBase']),
      employeeInsurance: serializer.fromJson<int>(json['employeeInsurance']),
      employerInsurance: serializer.fromJson<int>(json['employerInsurance']),
      unemploymentInsurance: serializer.fromJson<int>(
        json['unemploymentInsurance'],
      ),
      taxBase: serializer.fromJson<int>(json['taxBase']),
      tax: serializer.fromJson<int>(json['tax']),
      otherDeductions: serializer.fromJson<int>(json['otherDeductions']),
      net: serializer.fromJson<int>(json['net']),
      employerTotalCost: serializer.fromJson<int>(json['employerTotalCost']),
      breakdownJson: serializer.fromJson<String>(json['breakdownJson']),
      manualAdjusted: serializer.fromJson<bool>(json['manualAdjusted']),
      adjustmentReason: serializer.fromJson<String?>(json['adjustmentReason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'periodId': serializer.toJson<int>(periodId),
      'employeeId': serializer.toJson<int>(employeeId),
      'gross': serializer.toJson<int>(gross),
      'insuranceBase': serializer.toJson<int>(insuranceBase),
      'employeeInsurance': serializer.toJson<int>(employeeInsurance),
      'employerInsurance': serializer.toJson<int>(employerInsurance),
      'unemploymentInsurance': serializer.toJson<int>(unemploymentInsurance),
      'taxBase': serializer.toJson<int>(taxBase),
      'tax': serializer.toJson<int>(tax),
      'otherDeductions': serializer.toJson<int>(otherDeductions),
      'net': serializer.toJson<int>(net),
      'employerTotalCost': serializer.toJson<int>(employerTotalCost),
      'breakdownJson': serializer.toJson<String>(breakdownJson),
      'manualAdjusted': serializer.toJson<bool>(manualAdjusted),
      'adjustmentReason': serializer.toJson<String?>(adjustmentReason),
    };
  }

  PayrollResult copyWith({
    int? id,
    int? periodId,
    int? employeeId,
    int? gross,
    int? insuranceBase,
    int? employeeInsurance,
    int? employerInsurance,
    int? unemploymentInsurance,
    int? taxBase,
    int? tax,
    int? otherDeductions,
    int? net,
    int? employerTotalCost,
    String? breakdownJson,
    bool? manualAdjusted,
    Value<String?> adjustmentReason = const Value.absent(),
  }) => PayrollResult(
    id: id ?? this.id,
    periodId: periodId ?? this.periodId,
    employeeId: employeeId ?? this.employeeId,
    gross: gross ?? this.gross,
    insuranceBase: insuranceBase ?? this.insuranceBase,
    employeeInsurance: employeeInsurance ?? this.employeeInsurance,
    employerInsurance: employerInsurance ?? this.employerInsurance,
    unemploymentInsurance: unemploymentInsurance ?? this.unemploymentInsurance,
    taxBase: taxBase ?? this.taxBase,
    tax: tax ?? this.tax,
    otherDeductions: otherDeductions ?? this.otherDeductions,
    net: net ?? this.net,
    employerTotalCost: employerTotalCost ?? this.employerTotalCost,
    breakdownJson: breakdownJson ?? this.breakdownJson,
    manualAdjusted: manualAdjusted ?? this.manualAdjusted,
    adjustmentReason: adjustmentReason.present
        ? adjustmentReason.value
        : this.adjustmentReason,
  );
  PayrollResult copyWithCompanion(PayrollResultsCompanion data) {
    return PayrollResult(
      id: data.id.present ? data.id.value : this.id,
      periodId: data.periodId.present ? data.periodId.value : this.periodId,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      gross: data.gross.present ? data.gross.value : this.gross,
      insuranceBase: data.insuranceBase.present
          ? data.insuranceBase.value
          : this.insuranceBase,
      employeeInsurance: data.employeeInsurance.present
          ? data.employeeInsurance.value
          : this.employeeInsurance,
      employerInsurance: data.employerInsurance.present
          ? data.employerInsurance.value
          : this.employerInsurance,
      unemploymentInsurance: data.unemploymentInsurance.present
          ? data.unemploymentInsurance.value
          : this.unemploymentInsurance,
      taxBase: data.taxBase.present ? data.taxBase.value : this.taxBase,
      tax: data.tax.present ? data.tax.value : this.tax,
      otherDeductions: data.otherDeductions.present
          ? data.otherDeductions.value
          : this.otherDeductions,
      net: data.net.present ? data.net.value : this.net,
      employerTotalCost: data.employerTotalCost.present
          ? data.employerTotalCost.value
          : this.employerTotalCost,
      breakdownJson: data.breakdownJson.present
          ? data.breakdownJson.value
          : this.breakdownJson,
      manualAdjusted: data.manualAdjusted.present
          ? data.manualAdjusted.value
          : this.manualAdjusted,
      adjustmentReason: data.adjustmentReason.present
          ? data.adjustmentReason.value
          : this.adjustmentReason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayrollResult(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('employeeId: $employeeId, ')
          ..write('gross: $gross, ')
          ..write('insuranceBase: $insuranceBase, ')
          ..write('employeeInsurance: $employeeInsurance, ')
          ..write('employerInsurance: $employerInsurance, ')
          ..write('unemploymentInsurance: $unemploymentInsurance, ')
          ..write('taxBase: $taxBase, ')
          ..write('tax: $tax, ')
          ..write('otherDeductions: $otherDeductions, ')
          ..write('net: $net, ')
          ..write('employerTotalCost: $employerTotalCost, ')
          ..write('breakdownJson: $breakdownJson, ')
          ..write('manualAdjusted: $manualAdjusted, ')
          ..write('adjustmentReason: $adjustmentReason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    periodId,
    employeeId,
    gross,
    insuranceBase,
    employeeInsurance,
    employerInsurance,
    unemploymentInsurance,
    taxBase,
    tax,
    otherDeductions,
    net,
    employerTotalCost,
    breakdownJson,
    manualAdjusted,
    adjustmentReason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayrollResult &&
          other.id == this.id &&
          other.periodId == this.periodId &&
          other.employeeId == this.employeeId &&
          other.gross == this.gross &&
          other.insuranceBase == this.insuranceBase &&
          other.employeeInsurance == this.employeeInsurance &&
          other.employerInsurance == this.employerInsurance &&
          other.unemploymentInsurance == this.unemploymentInsurance &&
          other.taxBase == this.taxBase &&
          other.tax == this.tax &&
          other.otherDeductions == this.otherDeductions &&
          other.net == this.net &&
          other.employerTotalCost == this.employerTotalCost &&
          other.breakdownJson == this.breakdownJson &&
          other.manualAdjusted == this.manualAdjusted &&
          other.adjustmentReason == this.adjustmentReason);
}

class PayrollResultsCompanion extends UpdateCompanion<PayrollResult> {
  final Value<int> id;
  final Value<int> periodId;
  final Value<int> employeeId;
  final Value<int> gross;
  final Value<int> insuranceBase;
  final Value<int> employeeInsurance;
  final Value<int> employerInsurance;
  final Value<int> unemploymentInsurance;
  final Value<int> taxBase;
  final Value<int> tax;
  final Value<int> otherDeductions;
  final Value<int> net;
  final Value<int> employerTotalCost;
  final Value<String> breakdownJson;
  final Value<bool> manualAdjusted;
  final Value<String?> adjustmentReason;
  const PayrollResultsCompanion({
    this.id = const Value.absent(),
    this.periodId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.gross = const Value.absent(),
    this.insuranceBase = const Value.absent(),
    this.employeeInsurance = const Value.absent(),
    this.employerInsurance = const Value.absent(),
    this.unemploymentInsurance = const Value.absent(),
    this.taxBase = const Value.absent(),
    this.tax = const Value.absent(),
    this.otherDeductions = const Value.absent(),
    this.net = const Value.absent(),
    this.employerTotalCost = const Value.absent(),
    this.breakdownJson = const Value.absent(),
    this.manualAdjusted = const Value.absent(),
    this.adjustmentReason = const Value.absent(),
  });
  PayrollResultsCompanion.insert({
    this.id = const Value.absent(),
    required int periodId,
    required int employeeId,
    required int gross,
    required int insuranceBase,
    required int employeeInsurance,
    required int employerInsurance,
    required int unemploymentInsurance,
    required int taxBase,
    required int tax,
    required int otherDeductions,
    required int net,
    required int employerTotalCost,
    required String breakdownJson,
    this.manualAdjusted = const Value.absent(),
    this.adjustmentReason = const Value.absent(),
  }) : periodId = Value(periodId),
       employeeId = Value(employeeId),
       gross = Value(gross),
       insuranceBase = Value(insuranceBase),
       employeeInsurance = Value(employeeInsurance),
       employerInsurance = Value(employerInsurance),
       unemploymentInsurance = Value(unemploymentInsurance),
       taxBase = Value(taxBase),
       tax = Value(tax),
       otherDeductions = Value(otherDeductions),
       net = Value(net),
       employerTotalCost = Value(employerTotalCost),
       breakdownJson = Value(breakdownJson);
  static Insertable<PayrollResult> custom({
    Expression<int>? id,
    Expression<int>? periodId,
    Expression<int>? employeeId,
    Expression<int>? gross,
    Expression<int>? insuranceBase,
    Expression<int>? employeeInsurance,
    Expression<int>? employerInsurance,
    Expression<int>? unemploymentInsurance,
    Expression<int>? taxBase,
    Expression<int>? tax,
    Expression<int>? otherDeductions,
    Expression<int>? net,
    Expression<int>? employerTotalCost,
    Expression<String>? breakdownJson,
    Expression<bool>? manualAdjusted,
    Expression<String>? adjustmentReason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodId != null) 'period_id': periodId,
      if (employeeId != null) 'employee_id': employeeId,
      if (gross != null) 'gross': gross,
      if (insuranceBase != null) 'insurance_base': insuranceBase,
      if (employeeInsurance != null) 'employee_insurance': employeeInsurance,
      if (employerInsurance != null) 'employer_insurance': employerInsurance,
      if (unemploymentInsurance != null)
        'unemployment_insurance': unemploymentInsurance,
      if (taxBase != null) 'tax_base': taxBase,
      if (tax != null) 'tax': tax,
      if (otherDeductions != null) 'other_deductions': otherDeductions,
      if (net != null) 'net': net,
      if (employerTotalCost != null) 'employer_total_cost': employerTotalCost,
      if (breakdownJson != null) 'breakdown_json': breakdownJson,
      if (manualAdjusted != null) 'manual_adjusted': manualAdjusted,
      if (adjustmentReason != null) 'adjustment_reason': adjustmentReason,
    });
  }

  PayrollResultsCompanion copyWith({
    Value<int>? id,
    Value<int>? periodId,
    Value<int>? employeeId,
    Value<int>? gross,
    Value<int>? insuranceBase,
    Value<int>? employeeInsurance,
    Value<int>? employerInsurance,
    Value<int>? unemploymentInsurance,
    Value<int>? taxBase,
    Value<int>? tax,
    Value<int>? otherDeductions,
    Value<int>? net,
    Value<int>? employerTotalCost,
    Value<String>? breakdownJson,
    Value<bool>? manualAdjusted,
    Value<String?>? adjustmentReason,
  }) {
    return PayrollResultsCompanion(
      id: id ?? this.id,
      periodId: periodId ?? this.periodId,
      employeeId: employeeId ?? this.employeeId,
      gross: gross ?? this.gross,
      insuranceBase: insuranceBase ?? this.insuranceBase,
      employeeInsurance: employeeInsurance ?? this.employeeInsurance,
      employerInsurance: employerInsurance ?? this.employerInsurance,
      unemploymentInsurance:
          unemploymentInsurance ?? this.unemploymentInsurance,
      taxBase: taxBase ?? this.taxBase,
      tax: tax ?? this.tax,
      otherDeductions: otherDeductions ?? this.otherDeductions,
      net: net ?? this.net,
      employerTotalCost: employerTotalCost ?? this.employerTotalCost,
      breakdownJson: breakdownJson ?? this.breakdownJson,
      manualAdjusted: manualAdjusted ?? this.manualAdjusted,
      adjustmentReason: adjustmentReason ?? this.adjustmentReason,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (periodId.present) {
      map['period_id'] = Variable<int>(periodId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (gross.present) {
      map['gross'] = Variable<int>(gross.value);
    }
    if (insuranceBase.present) {
      map['insurance_base'] = Variable<int>(insuranceBase.value);
    }
    if (employeeInsurance.present) {
      map['employee_insurance'] = Variable<int>(employeeInsurance.value);
    }
    if (employerInsurance.present) {
      map['employer_insurance'] = Variable<int>(employerInsurance.value);
    }
    if (unemploymentInsurance.present) {
      map['unemployment_insurance'] = Variable<int>(
        unemploymentInsurance.value,
      );
    }
    if (taxBase.present) {
      map['tax_base'] = Variable<int>(taxBase.value);
    }
    if (tax.present) {
      map['tax'] = Variable<int>(tax.value);
    }
    if (otherDeductions.present) {
      map['other_deductions'] = Variable<int>(otherDeductions.value);
    }
    if (net.present) {
      map['net'] = Variable<int>(net.value);
    }
    if (employerTotalCost.present) {
      map['employer_total_cost'] = Variable<int>(employerTotalCost.value);
    }
    if (breakdownJson.present) {
      map['breakdown_json'] = Variable<String>(breakdownJson.value);
    }
    if (manualAdjusted.present) {
      map['manual_adjusted'] = Variable<bool>(manualAdjusted.value);
    }
    if (adjustmentReason.present) {
      map['adjustment_reason'] = Variable<String>(adjustmentReason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayrollResultsCompanion(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('employeeId: $employeeId, ')
          ..write('gross: $gross, ')
          ..write('insuranceBase: $insuranceBase, ')
          ..write('employeeInsurance: $employeeInsurance, ')
          ..write('employerInsurance: $employerInsurance, ')
          ..write('unemploymentInsurance: $unemploymentInsurance, ')
          ..write('taxBase: $taxBase, ')
          ..write('tax: $tax, ')
          ..write('otherDeductions: $otherDeductions, ')
          ..write('net: $net, ')
          ..write('employerTotalCost: $employerTotalCost, ')
          ..write('breakdownJson: $breakdownJson, ')
          ..write('manualAdjusted: $manualAdjusted, ')
          ..write('adjustmentReason: $adjustmentReason')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
    'at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _beforeJsonMeta = const VerificationMeta(
    'beforeJson',
  );
  @override
  late final GeneratedColumn<String> beforeJson = GeneratedColumn<String>(
    'before_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _afterJsonMeta = const VerificationMeta(
    'afterJson',
  );
  @override
  late final GeneratedColumn<String> afterJson = GeneratedColumn<String>(
    'after_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    at,
    action,
    entityType,
    entityId,
    summary,
    beforeJson,
    afterJson,
    reason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('before_json')) {
      context.handle(
        _beforeJsonMeta,
        beforeJson.isAcceptableOrUnknown(data['before_json']!, _beforeJsonMeta),
      );
    }
    if (data.containsKey('after_json')) {
      context.handle(
        _afterJsonMeta,
        afterJson.isAcceptableOrUnknown(data['after_json']!, _afterJsonMeta),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      at: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}at'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      beforeJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}before_json'],
      ),
      afterJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}after_json'],
      ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final DateTime at;
  final String action;
  final String entityType;
  final String? entityId;
  final String summary;
  final String? beforeJson;
  final String? afterJson;
  final String? reason;
  const AuditLog({
    required this.id,
    required this.at,
    required this.action,
    required this.entityType,
    this.entityId,
    required this.summary,
    this.beforeJson,
    this.afterJson,
    this.reason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['at'] = Variable<DateTime>(at);
    map['action'] = Variable<String>(action);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    map['summary'] = Variable<String>(summary);
    if (!nullToAbsent || beforeJson != null) {
      map['before_json'] = Variable<String>(beforeJson);
    }
    if (!nullToAbsent || afterJson != null) {
      map['after_json'] = Variable<String>(afterJson);
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      at: Value(at),
      action: Value(action),
      entityType: Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      summary: Value(summary),
      beforeJson: beforeJson == null && nullToAbsent
          ? const Value.absent()
          : Value(beforeJson),
      afterJson: afterJson == null && nullToAbsent
          ? const Value.absent()
          : Value(afterJson),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      at: serializer.fromJson<DateTime>(json['at']),
      action: serializer.fromJson<String>(json['action']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      summary: serializer.fromJson<String>(json['summary']),
      beforeJson: serializer.fromJson<String?>(json['beforeJson']),
      afterJson: serializer.fromJson<String?>(json['afterJson']),
      reason: serializer.fromJson<String?>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'at': serializer.toJson<DateTime>(at),
      'action': serializer.toJson<String>(action),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String?>(entityId),
      'summary': serializer.toJson<String>(summary),
      'beforeJson': serializer.toJson<String?>(beforeJson),
      'afterJson': serializer.toJson<String?>(afterJson),
      'reason': serializer.toJson<String?>(reason),
    };
  }

  AuditLog copyWith({
    int? id,
    DateTime? at,
    String? action,
    String? entityType,
    Value<String?> entityId = const Value.absent(),
    String? summary,
    Value<String?> beforeJson = const Value.absent(),
    Value<String?> afterJson = const Value.absent(),
    Value<String?> reason = const Value.absent(),
  }) => AuditLog(
    id: id ?? this.id,
    at: at ?? this.at,
    action: action ?? this.action,
    entityType: entityType ?? this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    summary: summary ?? this.summary,
    beforeJson: beforeJson.present ? beforeJson.value : this.beforeJson,
    afterJson: afterJson.present ? afterJson.value : this.afterJson,
    reason: reason.present ? reason.value : this.reason,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      at: data.at.present ? data.at.value : this.at,
      action: data.action.present ? data.action.value : this.action,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      summary: data.summary.present ? data.summary.value : this.summary,
      beforeJson: data.beforeJson.present
          ? data.beforeJson.value
          : this.beforeJson,
      afterJson: data.afterJson.present ? data.afterJson.value : this.afterJson,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('at: $at, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('summary: $summary, ')
          ..write('beforeJson: $beforeJson, ')
          ..write('afterJson: $afterJson, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    at,
    action,
    entityType,
    entityId,
    summary,
    beforeJson,
    afterJson,
    reason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.at == this.at &&
          other.action == this.action &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.summary == this.summary &&
          other.beforeJson == this.beforeJson &&
          other.afterJson == this.afterJson &&
          other.reason == this.reason);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<DateTime> at;
  final Value<String> action;
  final Value<String> entityType;
  final Value<String?> entityId;
  final Value<String> summary;
  final Value<String?> beforeJson;
  final Value<String?> afterJson;
  final Value<String?> reason;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.at = const Value.absent(),
    this.action = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.summary = const Value.absent(),
    this.beforeJson = const Value.absent(),
    this.afterJson = const Value.absent(),
    this.reason = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    this.at = const Value.absent(),
    required String action,
    required String entityType,
    this.entityId = const Value.absent(),
    required String summary,
    this.beforeJson = const Value.absent(),
    this.afterJson = const Value.absent(),
    this.reason = const Value.absent(),
  }) : action = Value(action),
       entityType = Value(entityType),
       summary = Value(summary);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<DateTime>? at,
    Expression<String>? action,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? summary,
    Expression<String>? beforeJson,
    Expression<String>? afterJson,
    Expression<String>? reason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (at != null) 'at': at,
      if (action != null) 'action': action,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (summary != null) 'summary': summary,
      if (beforeJson != null) 'before_json': beforeJson,
      if (afterJson != null) 'after_json': afterJson,
      if (reason != null) 'reason': reason,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? at,
    Value<String>? action,
    Value<String>? entityType,
    Value<String?>? entityId,
    Value<String>? summary,
    Value<String?>? beforeJson,
    Value<String?>? afterJson,
    Value<String?>? reason,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      at: at ?? this.at,
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      summary: summary ?? this.summary,
      beforeJson: beforeJson ?? this.beforeJson,
      afterJson: afterJson ?? this.afterJson,
      reason: reason ?? this.reason,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (beforeJson.present) {
      map['before_json'] = Variable<String>(beforeJson.value);
    }
    if (afterJson.present) {
      map['after_json'] = Variable<String>(afterJson.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('at: $at, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('summary: $summary, ')
          ..write('beforeJson: $beforeJson, ')
          ..write('afterJson: $afterJson, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }
}

class $AppPrefsTable extends AppPrefs with TableInfo<$AppPrefsTable, AppPref> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppPrefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_prefs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppPref> instance, {
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
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppPref map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppPref(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppPrefsTable createAlias(String alias) {
    return $AppPrefsTable(attachedDatabase, alias);
  }
}

class AppPref extends DataClass implements Insertable<AppPref> {
  final String key;
  final String value;
  const AppPref({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppPrefsCompanion toCompanion(bool nullToAbsent) {
    return AppPrefsCompanion(key: Value(key), value: Value(value));
  }

  factory AppPref.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppPref(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppPref copyWith({String? key, String? value}) =>
      AppPref(key: key ?? this.key, value: value ?? this.value);
  AppPref copyWithCompanion(AppPrefsCompanion data) {
    return AppPref(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppPref(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppPref && other.key == this.key && other.value == this.value);
}

class AppPrefsCompanion extends UpdateCompanion<AppPref> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppPrefsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppPrefsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppPref> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppPrefsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppPrefsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppPrefsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CompanyProfileTable companyProfile = $CompanyProfileTable(this);
  late final $AppAuthTable appAuth = $AppAuthTable(this);
  late final $FiscalYearSettingsTable fiscalYearSettings =
      $FiscalYearSettingsTable(this);
  late final $EmployeesTable employees = $EmployeesTable(this);
  late final $PayItemDefinitionsTable payItemDefinitions =
      $PayItemDefinitionsTable(this);
  late final $MonthlyPeriodsTable monthlyPeriods = $MonthlyPeriodsTable(this);
  late final $MonthlyInputsTable monthlyInputs = $MonthlyInputsTable(this);
  late final $PayrollResultsTable payrollResults = $PayrollResultsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $AppPrefsTable appPrefs = $AppPrefsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    companyProfile,
    appAuth,
    fiscalYearSettings,
    employees,
    payItemDefinitions,
    monthlyPeriods,
    monthlyInputs,
    payrollResults,
    auditLogs,
    appPrefs,
  ];
}

typedef $$CompanyProfileTableCreateCompanionBuilder =
    CompanyProfileCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> nationalId,
      Value<String?> economicCode,
      Value<String?> insuranceWorkshopCode,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> logoPath,
      Value<String> displayCurrency,
    });
typedef $$CompanyProfileTableUpdateCompanionBuilder =
    CompanyProfileCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> nationalId,
      Value<String?> economicCode,
      Value<String?> insuranceWorkshopCode,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> logoPath,
      Value<String> displayCurrency,
    });

class $$CompanyProfileTableFilterComposer
    extends Composer<_$AppDatabase, $CompanyProfileTable> {
  $$CompanyProfileTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get economicCode => $composableBuilder(
    column: $table.economicCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insuranceWorkshopCode => $composableBuilder(
    column: $table.insuranceWorkshopCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayCurrency => $composableBuilder(
    column: $table.displayCurrency,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompanyProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $CompanyProfileTable> {
  $$CompanyProfileTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get economicCode => $composableBuilder(
    column: $table.economicCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insuranceWorkshopCode => $composableBuilder(
    column: $table.insuranceWorkshopCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayCurrency => $composableBuilder(
    column: $table.displayCurrency,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompanyProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompanyProfileTable> {
  $$CompanyProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get economicCode => $composableBuilder(
    column: $table.economicCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insuranceWorkshopCode => $composableBuilder(
    column: $table.insuranceWorkshopCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get displayCurrency => $composableBuilder(
    column: $table.displayCurrency,
    builder: (column) => column,
  );
}

class $$CompanyProfileTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompanyProfileTable,
          CompanyProfileData,
          $$CompanyProfileTableFilterComposer,
          $$CompanyProfileTableOrderingComposer,
          $$CompanyProfileTableAnnotationComposer,
          $$CompanyProfileTableCreateCompanionBuilder,
          $$CompanyProfileTableUpdateCompanionBuilder,
          (
            CompanyProfileData,
            BaseReferences<
              _$AppDatabase,
              $CompanyProfileTable,
              CompanyProfileData
            >,
          ),
          CompanyProfileData,
          PrefetchHooks Function()
        > {
  $$CompanyProfileTableTableManager(
    _$AppDatabase db,
    $CompanyProfileTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompanyProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompanyProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompanyProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nationalId = const Value.absent(),
                Value<String?> economicCode = const Value.absent(),
                Value<String?> insuranceWorkshopCode = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> displayCurrency = const Value.absent(),
              }) => CompanyProfileCompanion(
                id: id,
                name: name,
                nationalId: nationalId,
                economicCode: economicCode,
                insuranceWorkshopCode: insuranceWorkshopCode,
                address: address,
                phone: phone,
                logoPath: logoPath,
                displayCurrency: displayCurrency,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nationalId = const Value.absent(),
                Value<String?> economicCode = const Value.absent(),
                Value<String?> insuranceWorkshopCode = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> displayCurrency = const Value.absent(),
              }) => CompanyProfileCompanion.insert(
                id: id,
                name: name,
                nationalId: nationalId,
                economicCode: economicCode,
                insuranceWorkshopCode: insuranceWorkshopCode,
                address: address,
                phone: phone,
                logoPath: logoPath,
                displayCurrency: displayCurrency,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompanyProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompanyProfileTable,
      CompanyProfileData,
      $$CompanyProfileTableFilterComposer,
      $$CompanyProfileTableOrderingComposer,
      $$CompanyProfileTableAnnotationComposer,
      $$CompanyProfileTableCreateCompanionBuilder,
      $$CompanyProfileTableUpdateCompanionBuilder,
      (
        CompanyProfileData,
        BaseReferences<_$AppDatabase, $CompanyProfileTable, CompanyProfileData>,
      ),
      CompanyProfileData,
      PrefetchHooks Function()
    >;
typedef $$AppAuthTableCreateCompanionBuilder =
    AppAuthCompanion Function({
      Value<int> id,
      required String passwordHash,
      required String salt,
      required String recoveryKeyHash,
      Value<DateTime> createdAt,
      Value<bool> onboarded,
    });
typedef $$AppAuthTableUpdateCompanionBuilder =
    AppAuthCompanion Function({
      Value<int> id,
      Value<String> passwordHash,
      Value<String> salt,
      Value<String> recoveryKeyHash,
      Value<DateTime> createdAt,
      Value<bool> onboarded,
    });

class $$AppAuthTableFilterComposer
    extends Composer<_$AppDatabase, $AppAuthTable> {
  $$AppAuthTableFilterComposer({
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

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryKeyHash => $composableBuilder(
    column: $table.recoveryKeyHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppAuthTableOrderingComposer
    extends Composer<_$AppDatabase, $AppAuthTable> {
  $$AppAuthTableOrderingComposer({
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

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryKeyHash => $composableBuilder(
    column: $table.recoveryKeyHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppAuthTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppAuthTable> {
  $$AppAuthTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get salt =>
      $composableBuilder(column: $table.salt, builder: (column) => column);

  GeneratedColumn<String> get recoveryKeyHash => $composableBuilder(
    column: $table.recoveryKeyHash,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get onboarded =>
      $composableBuilder(column: $table.onboarded, builder: (column) => column);
}

class $$AppAuthTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppAuthTable,
          AppAuthData,
          $$AppAuthTableFilterComposer,
          $$AppAuthTableOrderingComposer,
          $$AppAuthTableAnnotationComposer,
          $$AppAuthTableCreateCompanionBuilder,
          $$AppAuthTableUpdateCompanionBuilder,
          (
            AppAuthData,
            BaseReferences<_$AppDatabase, $AppAuthTable, AppAuthData>,
          ),
          AppAuthData,
          PrefetchHooks Function()
        > {
  $$AppAuthTableTableManager(_$AppDatabase db, $AppAuthTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppAuthTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppAuthTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppAuthTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> salt = const Value.absent(),
                Value<String> recoveryKeyHash = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
              }) => AppAuthCompanion(
                id: id,
                passwordHash: passwordHash,
                salt: salt,
                recoveryKeyHash: recoveryKeyHash,
                createdAt: createdAt,
                onboarded: onboarded,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String passwordHash,
                required String salt,
                required String recoveryKeyHash,
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
              }) => AppAuthCompanion.insert(
                id: id,
                passwordHash: passwordHash,
                salt: salt,
                recoveryKeyHash: recoveryKeyHash,
                createdAt: createdAt,
                onboarded: onboarded,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppAuthTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppAuthTable,
      AppAuthData,
      $$AppAuthTableFilterComposer,
      $$AppAuthTableOrderingComposer,
      $$AppAuthTableAnnotationComposer,
      $$AppAuthTableCreateCompanionBuilder,
      $$AppAuthTableUpdateCompanionBuilder,
      (AppAuthData, BaseReferences<_$AppDatabase, $AppAuthTable, AppAuthData>),
      AppAuthData,
      PrefetchHooks Function()
    >;
typedef $$FiscalYearSettingsTableCreateCompanionBuilder =
    FiscalYearSettingsCompanion Function({
      Value<int> id,
      required int year,
      required String settingsJson,
    });
typedef $$FiscalYearSettingsTableUpdateCompanionBuilder =
    FiscalYearSettingsCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<String> settingsJson,
    });

class $$FiscalYearSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $FiscalYearSettingsTable> {
  $$FiscalYearSettingsTableFilterComposer({
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

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingsJson => $composableBuilder(
    column: $table.settingsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FiscalYearSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $FiscalYearSettingsTable> {
  $$FiscalYearSettingsTableOrderingComposer({
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

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingsJson => $composableBuilder(
    column: $table.settingsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FiscalYearSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FiscalYearSettingsTable> {
  $$FiscalYearSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get settingsJson => $composableBuilder(
    column: $table.settingsJson,
    builder: (column) => column,
  );
}

class $$FiscalYearSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FiscalYearSettingsTable,
          FiscalYearSetting,
          $$FiscalYearSettingsTableFilterComposer,
          $$FiscalYearSettingsTableOrderingComposer,
          $$FiscalYearSettingsTableAnnotationComposer,
          $$FiscalYearSettingsTableCreateCompanionBuilder,
          $$FiscalYearSettingsTableUpdateCompanionBuilder,
          (
            FiscalYearSetting,
            BaseReferences<
              _$AppDatabase,
              $FiscalYearSettingsTable,
              FiscalYearSetting
            >,
          ),
          FiscalYearSetting,
          PrefetchHooks Function()
        > {
  $$FiscalYearSettingsTableTableManager(
    _$AppDatabase db,
    $FiscalYearSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FiscalYearSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FiscalYearSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FiscalYearSettingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<String> settingsJson = const Value.absent(),
              }) => FiscalYearSettingsCompanion(
                id: id,
                year: year,
                settingsJson: settingsJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                required String settingsJson,
              }) => FiscalYearSettingsCompanion.insert(
                id: id,
                year: year,
                settingsJson: settingsJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FiscalYearSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FiscalYearSettingsTable,
      FiscalYearSetting,
      $$FiscalYearSettingsTableFilterComposer,
      $$FiscalYearSettingsTableOrderingComposer,
      $$FiscalYearSettingsTableAnnotationComposer,
      $$FiscalYearSettingsTableCreateCompanionBuilder,
      $$FiscalYearSettingsTableUpdateCompanionBuilder,
      (
        FiscalYearSetting,
        BaseReferences<
          _$AppDatabase,
          $FiscalYearSettingsTable,
          FiscalYearSetting
        >,
      ),
      FiscalYearSetting,
      PrefetchHooks Function()
    >;
typedef $$EmployeesTableCreateCompanionBuilder =
    EmployeesCompanion Function({
      Value<int> id,
      required String personnelCode,
      required String nationalId,
      Value<String?> insuranceNumber,
      required String firstName,
      required String lastName,
      Value<String?> fatherName,
      Value<DateTime?> birthDate,
      Value<String> gender,
      Value<bool> married,
      Value<int> childrenCount,
      Value<bool> childAllowanceEligible,
      required DateTime hireDate,
      Value<String> contractType,
      Value<String?> department,
      Value<String?> jobTitle,
      Value<String?> bankName,
      Value<String?> sheba,
      Value<String?> accountNumber,
      required int dailyWage,
      Value<int?> seniorityBases,
      Value<int> jobAllowanceMonthly,
      Value<bool> isHardJob,
      Value<bool> active,
      Value<String?> notes,
    });
typedef $$EmployeesTableUpdateCompanionBuilder =
    EmployeesCompanion Function({
      Value<int> id,
      Value<String> personnelCode,
      Value<String> nationalId,
      Value<String?> insuranceNumber,
      Value<String> firstName,
      Value<String> lastName,
      Value<String?> fatherName,
      Value<DateTime?> birthDate,
      Value<String> gender,
      Value<bool> married,
      Value<int> childrenCount,
      Value<bool> childAllowanceEligible,
      Value<DateTime> hireDate,
      Value<String> contractType,
      Value<String?> department,
      Value<String?> jobTitle,
      Value<String?> bankName,
      Value<String?> sheba,
      Value<String?> accountNumber,
      Value<int> dailyWage,
      Value<int?> seniorityBases,
      Value<int> jobAllowanceMonthly,
      Value<bool> isHardJob,
      Value<bool> active,
      Value<String?> notes,
    });

final class $$EmployeesTableReferences
    extends BaseReferences<_$AppDatabase, $EmployeesTable, Employee> {
  $$EmployeesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MonthlyInputsTable, List<MonthlyInput>>
  _monthlyInputsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.monthlyInputs,
    aliasName: $_aliasNameGenerator(
      db.employees.id,
      db.monthlyInputs.employeeId,
    ),
  );

  $$MonthlyInputsTableProcessedTableManager get monthlyInputsRefs {
    final manager = $$MonthlyInputsTableTableManager(
      $_db,
      $_db.monthlyInputs,
    ).filter((f) => f.employeeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_monthlyInputsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PayrollResultsTable, List<PayrollResult>>
  _payrollResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.payrollResults,
    aliasName: $_aliasNameGenerator(
      db.employees.id,
      db.payrollResults.employeeId,
    ),
  );

  $$PayrollResultsTableProcessedTableManager get payrollResultsRefs {
    final manager = $$PayrollResultsTableTableManager(
      $_db,
      $_db.payrollResults,
    ).filter((f) => f.employeeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_payrollResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EmployeesTableFilterComposer
    extends Composer<_$AppDatabase, $EmployeesTable> {
  $$EmployeesTableFilterComposer({
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

  ColumnFilters<String> get personnelCode => $composableBuilder(
    column: $table.personnelCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insuranceNumber => $composableBuilder(
    column: $table.insuranceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get married => $composableBuilder(
    column: $table.married,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get childrenCount => $composableBuilder(
    column: $table.childrenCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get childAllowanceEligible => $composableBuilder(
    column: $table.childAllowanceEligible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contractType => $composableBuilder(
    column: $table.contractType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sheba => $composableBuilder(
    column: $table.sheba,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyWage => $composableBuilder(
    column: $table.dailyWage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seniorityBases => $composableBuilder(
    column: $table.seniorityBases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jobAllowanceMonthly => $composableBuilder(
    column: $table.jobAllowanceMonthly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHardJob => $composableBuilder(
    column: $table.isHardJob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> monthlyInputsRefs(
    Expression<bool> Function($$MonthlyInputsTableFilterComposer f) f,
  ) {
    final $$MonthlyInputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.monthlyInputs,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyInputsTableFilterComposer(
            $db: $db,
            $table: $db.monthlyInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> payrollResultsRefs(
    Expression<bool> Function($$PayrollResultsTableFilterComposer f) f,
  ) {
    final $$PayrollResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payrollResults,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PayrollResultsTableFilterComposer(
            $db: $db,
            $table: $db.payrollResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmployeesTableOrderingComposer
    extends Composer<_$AppDatabase, $EmployeesTable> {
  $$EmployeesTableOrderingComposer({
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

  ColumnOrderings<String> get personnelCode => $composableBuilder(
    column: $table.personnelCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insuranceNumber => $composableBuilder(
    column: $table.insuranceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get married => $composableBuilder(
    column: $table.married,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get childrenCount => $composableBuilder(
    column: $table.childrenCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get childAllowanceEligible => $composableBuilder(
    column: $table.childAllowanceEligible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contractType => $composableBuilder(
    column: $table.contractType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTitle => $composableBuilder(
    column: $table.jobTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sheba => $composableBuilder(
    column: $table.sheba,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyWage => $composableBuilder(
    column: $table.dailyWage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seniorityBases => $composableBuilder(
    column: $table.seniorityBases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jobAllowanceMonthly => $composableBuilder(
    column: $table.jobAllowanceMonthly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHardJob => $composableBuilder(
    column: $table.isHardJob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmployeesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmployeesTable> {
  $$EmployeesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get personnelCode => $composableBuilder(
    column: $table.personnelCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nationalId => $composableBuilder(
    column: $table.nationalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insuranceNumber => $composableBuilder(
    column: $table.insuranceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<bool> get married =>
      $composableBuilder(column: $table.married, builder: (column) => column);

  GeneratedColumn<int> get childrenCount => $composableBuilder(
    column: $table.childrenCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get childAllowanceEligible => $composableBuilder(
    column: $table.childAllowanceEligible,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hireDate =>
      $composableBuilder(column: $table.hireDate, builder: (column) => column);

  GeneratedColumn<String> get contractType => $composableBuilder(
    column: $table.contractType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobTitle =>
      $composableBuilder(column: $table.jobTitle, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get sheba =>
      $composableBuilder(column: $table.sheba, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyWage =>
      $composableBuilder(column: $table.dailyWage, builder: (column) => column);

  GeneratedColumn<int> get seniorityBases => $composableBuilder(
    column: $table.seniorityBases,
    builder: (column) => column,
  );

  GeneratedColumn<int> get jobAllowanceMonthly => $composableBuilder(
    column: $table.jobAllowanceMonthly,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isHardJob =>
      $composableBuilder(column: $table.isHardJob, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> monthlyInputsRefs<T extends Object>(
    Expression<T> Function($$MonthlyInputsTableAnnotationComposer a) f,
  ) {
    final $$MonthlyInputsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.monthlyInputs,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyInputsTableAnnotationComposer(
            $db: $db,
            $table: $db.monthlyInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> payrollResultsRefs<T extends Object>(
    Expression<T> Function($$PayrollResultsTableAnnotationComposer a) f,
  ) {
    final $$PayrollResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payrollResults,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PayrollResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.payrollResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmployeesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmployeesTable,
          Employee,
          $$EmployeesTableFilterComposer,
          $$EmployeesTableOrderingComposer,
          $$EmployeesTableAnnotationComposer,
          $$EmployeesTableCreateCompanionBuilder,
          $$EmployeesTableUpdateCompanionBuilder,
          (Employee, $$EmployeesTableReferences),
          Employee,
          PrefetchHooks Function({
            bool monthlyInputsRefs,
            bool payrollResultsRefs,
          })
        > {
  $$EmployeesTableTableManager(_$AppDatabase db, $EmployeesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> personnelCode = const Value.absent(),
                Value<String> nationalId = const Value.absent(),
                Value<String?> insuranceNumber = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String?> fatherName = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<bool> married = const Value.absent(),
                Value<int> childrenCount = const Value.absent(),
                Value<bool> childAllowanceEligible = const Value.absent(),
                Value<DateTime> hireDate = const Value.absent(),
                Value<String> contractType = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> sheba = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                Value<int> dailyWage = const Value.absent(),
                Value<int?> seniorityBases = const Value.absent(),
                Value<int> jobAllowanceMonthly = const Value.absent(),
                Value<bool> isHardJob = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => EmployeesCompanion(
                id: id,
                personnelCode: personnelCode,
                nationalId: nationalId,
                insuranceNumber: insuranceNumber,
                firstName: firstName,
                lastName: lastName,
                fatherName: fatherName,
                birthDate: birthDate,
                gender: gender,
                married: married,
                childrenCount: childrenCount,
                childAllowanceEligible: childAllowanceEligible,
                hireDate: hireDate,
                contractType: contractType,
                department: department,
                jobTitle: jobTitle,
                bankName: bankName,
                sheba: sheba,
                accountNumber: accountNumber,
                dailyWage: dailyWage,
                seniorityBases: seniorityBases,
                jobAllowanceMonthly: jobAllowanceMonthly,
                isHardJob: isHardJob,
                active: active,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String personnelCode,
                required String nationalId,
                Value<String?> insuranceNumber = const Value.absent(),
                required String firstName,
                required String lastName,
                Value<String?> fatherName = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<bool> married = const Value.absent(),
                Value<int> childrenCount = const Value.absent(),
                Value<bool> childAllowanceEligible = const Value.absent(),
                required DateTime hireDate,
                Value<String> contractType = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> jobTitle = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> sheba = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                required int dailyWage,
                Value<int?> seniorityBases = const Value.absent(),
                Value<int> jobAllowanceMonthly = const Value.absent(),
                Value<bool> isHardJob = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => EmployeesCompanion.insert(
                id: id,
                personnelCode: personnelCode,
                nationalId: nationalId,
                insuranceNumber: insuranceNumber,
                firstName: firstName,
                lastName: lastName,
                fatherName: fatherName,
                birthDate: birthDate,
                gender: gender,
                married: married,
                childrenCount: childrenCount,
                childAllowanceEligible: childAllowanceEligible,
                hireDate: hireDate,
                contractType: contractType,
                department: department,
                jobTitle: jobTitle,
                bankName: bankName,
                sheba: sheba,
                accountNumber: accountNumber,
                dailyWage: dailyWage,
                seniorityBases: seniorityBases,
                jobAllowanceMonthly: jobAllowanceMonthly,
                isHardJob: isHardJob,
                active: active,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmployeesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({monthlyInputsRefs = false, payrollResultsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (monthlyInputsRefs) db.monthlyInputs,
                    if (payrollResultsRefs) db.payrollResults,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (monthlyInputsRefs)
                        await $_getPrefetchedData<
                          Employee,
                          $EmployeesTable,
                          MonthlyInput
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeesTableReferences
                              ._monthlyInputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeesTableReferences(
                                db,
                                table,
                                p0,
                              ).monthlyInputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (payrollResultsRefs)
                        await $_getPrefetchedData<
                          Employee,
                          $EmployeesTable,
                          PayrollResult
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeesTableReferences
                              ._payrollResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeesTableReferences(
                                db,
                                table,
                                p0,
                              ).payrollResultsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeeId == item.id,
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

typedef $$EmployeesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmployeesTable,
      Employee,
      $$EmployeesTableFilterComposer,
      $$EmployeesTableOrderingComposer,
      $$EmployeesTableAnnotationComposer,
      $$EmployeesTableCreateCompanionBuilder,
      $$EmployeesTableUpdateCompanionBuilder,
      (Employee, $$EmployeesTableReferences),
      Employee,
      PrefetchHooks Function({bool monthlyInputsRefs, bool payrollResultsRefs})
    >;
typedef $$PayItemDefinitionsTableCreateCompanionBuilder =
    PayItemDefinitionsCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String kind,
      required String calcMethod,
      required bool subjectToInsurance,
      required bool subjectToTax,
      Value<int?> exemptionCap,
      Value<bool> needsReview,
      Value<bool> isSystem,
      Value<bool> active,
      Value<int> sortOrder,
    });
typedef $$PayItemDefinitionsTableUpdateCompanionBuilder =
    PayItemDefinitionsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> kind,
      Value<String> calcMethod,
      Value<bool> subjectToInsurance,
      Value<bool> subjectToTax,
      Value<int?> exemptionCap,
      Value<bool> needsReview,
      Value<bool> isSystem,
      Value<bool> active,
      Value<int> sortOrder,
    });

class $$PayItemDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $PayItemDefinitionsTable> {
  $$PayItemDefinitionsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get subjectToInsurance => $composableBuilder(
    column: $table.subjectToInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get subjectToTax => $composableBuilder(
    column: $table.subjectToTax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exemptionCap => $composableBuilder(
    column: $table.exemptionCap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needsReview => $composableBuilder(
    column: $table.needsReview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PayItemDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PayItemDefinitionsTable> {
  $$PayItemDefinitionsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get subjectToInsurance => $composableBuilder(
    column: $table.subjectToInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get subjectToTax => $composableBuilder(
    column: $table.subjectToTax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exemptionCap => $composableBuilder(
    column: $table.exemptionCap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needsReview => $composableBuilder(
    column: $table.needsReview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PayItemDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PayItemDefinitionsTable> {
  $$PayItemDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get subjectToInsurance => $composableBuilder(
    column: $table.subjectToInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get subjectToTax => $composableBuilder(
    column: $table.subjectToTax,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exemptionCap => $composableBuilder(
    column: $table.exemptionCap,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get needsReview => $composableBuilder(
    column: $table.needsReview,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$PayItemDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PayItemDefinitionsTable,
          PayItemDefinition,
          $$PayItemDefinitionsTableFilterComposer,
          $$PayItemDefinitionsTableOrderingComposer,
          $$PayItemDefinitionsTableAnnotationComposer,
          $$PayItemDefinitionsTableCreateCompanionBuilder,
          $$PayItemDefinitionsTableUpdateCompanionBuilder,
          (
            PayItemDefinition,
            BaseReferences<
              _$AppDatabase,
              $PayItemDefinitionsTable,
              PayItemDefinition
            >,
          ),
          PayItemDefinition,
          PrefetchHooks Function()
        > {
  $$PayItemDefinitionsTableTableManager(
    _$AppDatabase db,
    $PayItemDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayItemDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayItemDefinitionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayItemDefinitionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> calcMethod = const Value.absent(),
                Value<bool> subjectToInsurance = const Value.absent(),
                Value<bool> subjectToTax = const Value.absent(),
                Value<int?> exemptionCap = const Value.absent(),
                Value<bool> needsReview = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => PayItemDefinitionsCompanion(
                id: id,
                code: code,
                name: name,
                kind: kind,
                calcMethod: calcMethod,
                subjectToInsurance: subjectToInsurance,
                subjectToTax: subjectToTax,
                exemptionCap: exemptionCap,
                needsReview: needsReview,
                isSystem: isSystem,
                active: active,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String kind,
                required String calcMethod,
                required bool subjectToInsurance,
                required bool subjectToTax,
                Value<int?> exemptionCap = const Value.absent(),
                Value<bool> needsReview = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => PayItemDefinitionsCompanion.insert(
                id: id,
                code: code,
                name: name,
                kind: kind,
                calcMethod: calcMethod,
                subjectToInsurance: subjectToInsurance,
                subjectToTax: subjectToTax,
                exemptionCap: exemptionCap,
                needsReview: needsReview,
                isSystem: isSystem,
                active: active,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PayItemDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PayItemDefinitionsTable,
      PayItemDefinition,
      $$PayItemDefinitionsTableFilterComposer,
      $$PayItemDefinitionsTableOrderingComposer,
      $$PayItemDefinitionsTableAnnotationComposer,
      $$PayItemDefinitionsTableCreateCompanionBuilder,
      $$PayItemDefinitionsTableUpdateCompanionBuilder,
      (
        PayItemDefinition,
        BaseReferences<
          _$AppDatabase,
          $PayItemDefinitionsTable,
          PayItemDefinition
        >,
      ),
      PayItemDefinition,
      PrefetchHooks Function()
    >;
typedef $$MonthlyPeriodsTableCreateCompanionBuilder =
    MonthlyPeriodsCompanion Function({
      Value<int> id,
      required int year,
      required int month,
      Value<String> status,
      Value<DateTime?> lockedAt,
      Value<String?> settingsSnapshotJson,
    });
typedef $$MonthlyPeriodsTableUpdateCompanionBuilder =
    MonthlyPeriodsCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<int> month,
      Value<String> status,
      Value<DateTime?> lockedAt,
      Value<String?> settingsSnapshotJson,
    });

final class $$MonthlyPeriodsTableReferences
    extends BaseReferences<_$AppDatabase, $MonthlyPeriodsTable, MonthlyPeriod> {
  $$MonthlyPeriodsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MonthlyInputsTable, List<MonthlyInput>>
  _monthlyInputsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.monthlyInputs,
    aliasName: $_aliasNameGenerator(
      db.monthlyPeriods.id,
      db.monthlyInputs.periodId,
    ),
  );

  $$MonthlyInputsTableProcessedTableManager get monthlyInputsRefs {
    final manager = $$MonthlyInputsTableTableManager(
      $_db,
      $_db.monthlyInputs,
    ).filter((f) => f.periodId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_monthlyInputsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PayrollResultsTable, List<PayrollResult>>
  _payrollResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.payrollResults,
    aliasName: $_aliasNameGenerator(
      db.monthlyPeriods.id,
      db.payrollResults.periodId,
    ),
  );

  $$PayrollResultsTableProcessedTableManager get payrollResultsRefs {
    final manager = $$PayrollResultsTableTableManager(
      $_db,
      $_db.payrollResults,
    ).filter((f) => f.periodId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_payrollResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MonthlyPeriodsTableFilterComposer
    extends Composer<_$AppDatabase, $MonthlyPeriodsTable> {
  $$MonthlyPeriodsTableFilterComposer({
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

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lockedAt => $composableBuilder(
    column: $table.lockedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingsSnapshotJson => $composableBuilder(
    column: $table.settingsSnapshotJson,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> monthlyInputsRefs(
    Expression<bool> Function($$MonthlyInputsTableFilterComposer f) f,
  ) {
    final $$MonthlyInputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.monthlyInputs,
      getReferencedColumn: (t) => t.periodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyInputsTableFilterComposer(
            $db: $db,
            $table: $db.monthlyInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> payrollResultsRefs(
    Expression<bool> Function($$PayrollResultsTableFilterComposer f) f,
  ) {
    final $$PayrollResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payrollResults,
      getReferencedColumn: (t) => t.periodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PayrollResultsTableFilterComposer(
            $db: $db,
            $table: $db.payrollResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MonthlyPeriodsTableOrderingComposer
    extends Composer<_$AppDatabase, $MonthlyPeriodsTable> {
  $$MonthlyPeriodsTableOrderingComposer({
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

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lockedAt => $composableBuilder(
    column: $table.lockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingsSnapshotJson => $composableBuilder(
    column: $table.settingsSnapshotJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MonthlyPeriodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MonthlyPeriodsTable> {
  $$MonthlyPeriodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get lockedAt =>
      $composableBuilder(column: $table.lockedAt, builder: (column) => column);

  GeneratedColumn<String> get settingsSnapshotJson => $composableBuilder(
    column: $table.settingsSnapshotJson,
    builder: (column) => column,
  );

  Expression<T> monthlyInputsRefs<T extends Object>(
    Expression<T> Function($$MonthlyInputsTableAnnotationComposer a) f,
  ) {
    final $$MonthlyInputsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.monthlyInputs,
      getReferencedColumn: (t) => t.periodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyInputsTableAnnotationComposer(
            $db: $db,
            $table: $db.monthlyInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> payrollResultsRefs<T extends Object>(
    Expression<T> Function($$PayrollResultsTableAnnotationComposer a) f,
  ) {
    final $$PayrollResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payrollResults,
      getReferencedColumn: (t) => t.periodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PayrollResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.payrollResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MonthlyPeriodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MonthlyPeriodsTable,
          MonthlyPeriod,
          $$MonthlyPeriodsTableFilterComposer,
          $$MonthlyPeriodsTableOrderingComposer,
          $$MonthlyPeriodsTableAnnotationComposer,
          $$MonthlyPeriodsTableCreateCompanionBuilder,
          $$MonthlyPeriodsTableUpdateCompanionBuilder,
          (MonthlyPeriod, $$MonthlyPeriodsTableReferences),
          MonthlyPeriod,
          PrefetchHooks Function({
            bool monthlyInputsRefs,
            bool payrollResultsRefs,
          })
        > {
  $$MonthlyPeriodsTableTableManager(
    _$AppDatabase db,
    $MonthlyPeriodsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MonthlyPeriodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MonthlyPeriodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MonthlyPeriodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> lockedAt = const Value.absent(),
                Value<String?> settingsSnapshotJson = const Value.absent(),
              }) => MonthlyPeriodsCompanion(
                id: id,
                year: year,
                month: month,
                status: status,
                lockedAt: lockedAt,
                settingsSnapshotJson: settingsSnapshotJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                required int month,
                Value<String> status = const Value.absent(),
                Value<DateTime?> lockedAt = const Value.absent(),
                Value<String?> settingsSnapshotJson = const Value.absent(),
              }) => MonthlyPeriodsCompanion.insert(
                id: id,
                year: year,
                month: month,
                status: status,
                lockedAt: lockedAt,
                settingsSnapshotJson: settingsSnapshotJson,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MonthlyPeriodsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({monthlyInputsRefs = false, payrollResultsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (monthlyInputsRefs) db.monthlyInputs,
                    if (payrollResultsRefs) db.payrollResults,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (monthlyInputsRefs)
                        await $_getPrefetchedData<
                          MonthlyPeriod,
                          $MonthlyPeriodsTable,
                          MonthlyInput
                        >(
                          currentTable: table,
                          referencedTable: $$MonthlyPeriodsTableReferences
                              ._monthlyInputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MonthlyPeriodsTableReferences(
                                db,
                                table,
                                p0,
                              ).monthlyInputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.periodId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (payrollResultsRefs)
                        await $_getPrefetchedData<
                          MonthlyPeriod,
                          $MonthlyPeriodsTable,
                          PayrollResult
                        >(
                          currentTable: table,
                          referencedTable: $$MonthlyPeriodsTableReferences
                              ._payrollResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MonthlyPeriodsTableReferences(
                                db,
                                table,
                                p0,
                              ).payrollResultsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.periodId == item.id,
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

typedef $$MonthlyPeriodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MonthlyPeriodsTable,
      MonthlyPeriod,
      $$MonthlyPeriodsTableFilterComposer,
      $$MonthlyPeriodsTableOrderingComposer,
      $$MonthlyPeriodsTableAnnotationComposer,
      $$MonthlyPeriodsTableCreateCompanionBuilder,
      $$MonthlyPeriodsTableUpdateCompanionBuilder,
      (MonthlyPeriod, $$MonthlyPeriodsTableReferences),
      MonthlyPeriod,
      PrefetchHooks Function({bool monthlyInputsRefs, bool payrollResultsRefs})
    >;
typedef $$MonthlyInputsTableCreateCompanionBuilder =
    MonthlyInputsCompanion Function({
      Value<int> id,
      required int periodId,
      required int employeeId,
      Value<int> workedDays,
      Value<double> overtimeHours,
      Value<double> nightHours,
      Value<double> holidayHours,
      Value<int> absenceDays,
      Value<int> unpaidLeaveDays,
      Value<int> bonusAmount,
      Value<int> advanceAmount,
      Value<int> loanAmount,
      Value<int> penaltyAmount,
      Value<String> manualJson,
    });
typedef $$MonthlyInputsTableUpdateCompanionBuilder =
    MonthlyInputsCompanion Function({
      Value<int> id,
      Value<int> periodId,
      Value<int> employeeId,
      Value<int> workedDays,
      Value<double> overtimeHours,
      Value<double> nightHours,
      Value<double> holidayHours,
      Value<int> absenceDays,
      Value<int> unpaidLeaveDays,
      Value<int> bonusAmount,
      Value<int> advanceAmount,
      Value<int> loanAmount,
      Value<int> penaltyAmount,
      Value<String> manualJson,
    });

final class $$MonthlyInputsTableReferences
    extends BaseReferences<_$AppDatabase, $MonthlyInputsTable, MonthlyInput> {
  $$MonthlyInputsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MonthlyPeriodsTable _periodIdTable(_$AppDatabase db) =>
      db.monthlyPeriods.createAlias(
        $_aliasNameGenerator(db.monthlyInputs.periodId, db.monthlyPeriods.id),
      );

  $$MonthlyPeriodsTableProcessedTableManager get periodId {
    final $_column = $_itemColumn<int>('period_id')!;

    final manager = $$MonthlyPeriodsTableTableManager(
      $_db,
      $_db.monthlyPeriods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_periodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EmployeesTable _employeeIdTable(_$AppDatabase db) =>
      db.employees.createAlias(
        $_aliasNameGenerator(db.monthlyInputs.employeeId, db.employees.id),
      );

  $$EmployeesTableProcessedTableManager get employeeId {
    final $_column = $_itemColumn<int>('employee_id')!;

    final manager = $$EmployeesTableTableManager(
      $_db,
      $_db.employees,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MonthlyInputsTableFilterComposer
    extends Composer<_$AppDatabase, $MonthlyInputsTable> {
  $$MonthlyInputsTableFilterComposer({
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

  ColumnFilters<int> get workedDays => $composableBuilder(
    column: $table.workedDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get overtimeHours => $composableBuilder(
    column: $table.overtimeHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nightHours => $composableBuilder(
    column: $table.nightHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get holidayHours => $composableBuilder(
    column: $table.holidayHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get absenceDays => $composableBuilder(
    column: $table.absenceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unpaidLeaveDays => $composableBuilder(
    column: $table.unpaidLeaveDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bonusAmount => $composableBuilder(
    column: $table.bonusAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get loanAmount => $composableBuilder(
    column: $table.loanAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get penaltyAmount => $composableBuilder(
    column: $table.penaltyAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manualJson => $composableBuilder(
    column: $table.manualJson,
    builder: (column) => ColumnFilters(column),
  );

  $$MonthlyPeriodsTableFilterComposer get periodId {
    final $$MonthlyPeriodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableFilterComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableFilterComposer get employeeId {
    final $$EmployeesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableFilterComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MonthlyInputsTableOrderingComposer
    extends Composer<_$AppDatabase, $MonthlyInputsTable> {
  $$MonthlyInputsTableOrderingComposer({
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

  ColumnOrderings<int> get workedDays => $composableBuilder(
    column: $table.workedDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get overtimeHours => $composableBuilder(
    column: $table.overtimeHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nightHours => $composableBuilder(
    column: $table.nightHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get holidayHours => $composableBuilder(
    column: $table.holidayHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get absenceDays => $composableBuilder(
    column: $table.absenceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unpaidLeaveDays => $composableBuilder(
    column: $table.unpaidLeaveDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bonusAmount => $composableBuilder(
    column: $table.bonusAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get loanAmount => $composableBuilder(
    column: $table.loanAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get penaltyAmount => $composableBuilder(
    column: $table.penaltyAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manualJson => $composableBuilder(
    column: $table.manualJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$MonthlyPeriodsTableOrderingComposer get periodId {
    final $$MonthlyPeriodsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableOrderingComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableOrderingComposer get employeeId {
    final $$EmployeesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableOrderingComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MonthlyInputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MonthlyInputsTable> {
  $$MonthlyInputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get workedDays => $composableBuilder(
    column: $table.workedDays,
    builder: (column) => column,
  );

  GeneratedColumn<double> get overtimeHours => $composableBuilder(
    column: $table.overtimeHours,
    builder: (column) => column,
  );

  GeneratedColumn<double> get nightHours => $composableBuilder(
    column: $table.nightHours,
    builder: (column) => column,
  );

  GeneratedColumn<double> get holidayHours => $composableBuilder(
    column: $table.holidayHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get absenceDays => $composableBuilder(
    column: $table.absenceDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unpaidLeaveDays => $composableBuilder(
    column: $table.unpaidLeaveDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bonusAmount => $composableBuilder(
    column: $table.bonusAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get advanceAmount => $composableBuilder(
    column: $table.advanceAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get loanAmount => $composableBuilder(
    column: $table.loanAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get penaltyAmount => $composableBuilder(
    column: $table.penaltyAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get manualJson => $composableBuilder(
    column: $table.manualJson,
    builder: (column) => column,
  );

  $$MonthlyPeriodsTableAnnotationComposer get periodId {
    final $$MonthlyPeriodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableAnnotationComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableAnnotationComposer get employeeId {
    final $$EmployeesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableAnnotationComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MonthlyInputsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MonthlyInputsTable,
          MonthlyInput,
          $$MonthlyInputsTableFilterComposer,
          $$MonthlyInputsTableOrderingComposer,
          $$MonthlyInputsTableAnnotationComposer,
          $$MonthlyInputsTableCreateCompanionBuilder,
          $$MonthlyInputsTableUpdateCompanionBuilder,
          (MonthlyInput, $$MonthlyInputsTableReferences),
          MonthlyInput,
          PrefetchHooks Function({bool periodId, bool employeeId})
        > {
  $$MonthlyInputsTableTableManager(_$AppDatabase db, $MonthlyInputsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MonthlyInputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MonthlyInputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MonthlyInputsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> periodId = const Value.absent(),
                Value<int> employeeId = const Value.absent(),
                Value<int> workedDays = const Value.absent(),
                Value<double> overtimeHours = const Value.absent(),
                Value<double> nightHours = const Value.absent(),
                Value<double> holidayHours = const Value.absent(),
                Value<int> absenceDays = const Value.absent(),
                Value<int> unpaidLeaveDays = const Value.absent(),
                Value<int> bonusAmount = const Value.absent(),
                Value<int> advanceAmount = const Value.absent(),
                Value<int> loanAmount = const Value.absent(),
                Value<int> penaltyAmount = const Value.absent(),
                Value<String> manualJson = const Value.absent(),
              }) => MonthlyInputsCompanion(
                id: id,
                periodId: periodId,
                employeeId: employeeId,
                workedDays: workedDays,
                overtimeHours: overtimeHours,
                nightHours: nightHours,
                holidayHours: holidayHours,
                absenceDays: absenceDays,
                unpaidLeaveDays: unpaidLeaveDays,
                bonusAmount: bonusAmount,
                advanceAmount: advanceAmount,
                loanAmount: loanAmount,
                penaltyAmount: penaltyAmount,
                manualJson: manualJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int periodId,
                required int employeeId,
                Value<int> workedDays = const Value.absent(),
                Value<double> overtimeHours = const Value.absent(),
                Value<double> nightHours = const Value.absent(),
                Value<double> holidayHours = const Value.absent(),
                Value<int> absenceDays = const Value.absent(),
                Value<int> unpaidLeaveDays = const Value.absent(),
                Value<int> bonusAmount = const Value.absent(),
                Value<int> advanceAmount = const Value.absent(),
                Value<int> loanAmount = const Value.absent(),
                Value<int> penaltyAmount = const Value.absent(),
                Value<String> manualJson = const Value.absent(),
              }) => MonthlyInputsCompanion.insert(
                id: id,
                periodId: periodId,
                employeeId: employeeId,
                workedDays: workedDays,
                overtimeHours: overtimeHours,
                nightHours: nightHours,
                holidayHours: holidayHours,
                absenceDays: absenceDays,
                unpaidLeaveDays: unpaidLeaveDays,
                bonusAmount: bonusAmount,
                advanceAmount: advanceAmount,
                loanAmount: loanAmount,
                penaltyAmount: penaltyAmount,
                manualJson: manualJson,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MonthlyInputsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({periodId = false, employeeId = false}) {
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
                    if (periodId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.periodId,
                                referencedTable: $$MonthlyInputsTableReferences
                                    ._periodIdTable(db),
                                referencedColumn: $$MonthlyInputsTableReferences
                                    ._periodIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (employeeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.employeeId,
                                referencedTable: $$MonthlyInputsTableReferences
                                    ._employeeIdTable(db),
                                referencedColumn: $$MonthlyInputsTableReferences
                                    ._employeeIdTable(db)
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

typedef $$MonthlyInputsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MonthlyInputsTable,
      MonthlyInput,
      $$MonthlyInputsTableFilterComposer,
      $$MonthlyInputsTableOrderingComposer,
      $$MonthlyInputsTableAnnotationComposer,
      $$MonthlyInputsTableCreateCompanionBuilder,
      $$MonthlyInputsTableUpdateCompanionBuilder,
      (MonthlyInput, $$MonthlyInputsTableReferences),
      MonthlyInput,
      PrefetchHooks Function({bool periodId, bool employeeId})
    >;
typedef $$PayrollResultsTableCreateCompanionBuilder =
    PayrollResultsCompanion Function({
      Value<int> id,
      required int periodId,
      required int employeeId,
      required int gross,
      required int insuranceBase,
      required int employeeInsurance,
      required int employerInsurance,
      required int unemploymentInsurance,
      required int taxBase,
      required int tax,
      required int otherDeductions,
      required int net,
      required int employerTotalCost,
      required String breakdownJson,
      Value<bool> manualAdjusted,
      Value<String?> adjustmentReason,
    });
typedef $$PayrollResultsTableUpdateCompanionBuilder =
    PayrollResultsCompanion Function({
      Value<int> id,
      Value<int> periodId,
      Value<int> employeeId,
      Value<int> gross,
      Value<int> insuranceBase,
      Value<int> employeeInsurance,
      Value<int> employerInsurance,
      Value<int> unemploymentInsurance,
      Value<int> taxBase,
      Value<int> tax,
      Value<int> otherDeductions,
      Value<int> net,
      Value<int> employerTotalCost,
      Value<String> breakdownJson,
      Value<bool> manualAdjusted,
      Value<String?> adjustmentReason,
    });

final class $$PayrollResultsTableReferences
    extends BaseReferences<_$AppDatabase, $PayrollResultsTable, PayrollResult> {
  $$PayrollResultsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MonthlyPeriodsTable _periodIdTable(_$AppDatabase db) =>
      db.monthlyPeriods.createAlias(
        $_aliasNameGenerator(db.payrollResults.periodId, db.monthlyPeriods.id),
      );

  $$MonthlyPeriodsTableProcessedTableManager get periodId {
    final $_column = $_itemColumn<int>('period_id')!;

    final manager = $$MonthlyPeriodsTableTableManager(
      $_db,
      $_db.monthlyPeriods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_periodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EmployeesTable _employeeIdTable(_$AppDatabase db) =>
      db.employees.createAlias(
        $_aliasNameGenerator(db.payrollResults.employeeId, db.employees.id),
      );

  $$EmployeesTableProcessedTableManager get employeeId {
    final $_column = $_itemColumn<int>('employee_id')!;

    final manager = $$EmployeesTableTableManager(
      $_db,
      $_db.employees,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PayrollResultsTableFilterComposer
    extends Composer<_$AppDatabase, $PayrollResultsTable> {
  $$PayrollResultsTableFilterComposer({
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

  ColumnFilters<int> get gross => $composableBuilder(
    column: $table.gross,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get insuranceBase => $composableBuilder(
    column: $table.insuranceBase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get employeeInsurance => $composableBuilder(
    column: $table.employeeInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get employerInsurance => $composableBuilder(
    column: $table.employerInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unemploymentInsurance => $composableBuilder(
    column: $table.unemploymentInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxBase => $composableBuilder(
    column: $table.taxBase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get otherDeductions => $composableBuilder(
    column: $table.otherDeductions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get net => $composableBuilder(
    column: $table.net,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get employerTotalCost => $composableBuilder(
    column: $table.employerTotalCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breakdownJson => $composableBuilder(
    column: $table.breakdownJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get manualAdjusted => $composableBuilder(
    column: $table.manualAdjusted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adjustmentReason => $composableBuilder(
    column: $table.adjustmentReason,
    builder: (column) => ColumnFilters(column),
  );

  $$MonthlyPeriodsTableFilterComposer get periodId {
    final $$MonthlyPeriodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableFilterComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableFilterComposer get employeeId {
    final $$EmployeesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableFilterComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PayrollResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $PayrollResultsTable> {
  $$PayrollResultsTableOrderingComposer({
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

  ColumnOrderings<int> get gross => $composableBuilder(
    column: $table.gross,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get insuranceBase => $composableBuilder(
    column: $table.insuranceBase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get employeeInsurance => $composableBuilder(
    column: $table.employeeInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get employerInsurance => $composableBuilder(
    column: $table.employerInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unemploymentInsurance => $composableBuilder(
    column: $table.unemploymentInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxBase => $composableBuilder(
    column: $table.taxBase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get otherDeductions => $composableBuilder(
    column: $table.otherDeductions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get net => $composableBuilder(
    column: $table.net,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get employerTotalCost => $composableBuilder(
    column: $table.employerTotalCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breakdownJson => $composableBuilder(
    column: $table.breakdownJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get manualAdjusted => $composableBuilder(
    column: $table.manualAdjusted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adjustmentReason => $composableBuilder(
    column: $table.adjustmentReason,
    builder: (column) => ColumnOrderings(column),
  );

  $$MonthlyPeriodsTableOrderingComposer get periodId {
    final $$MonthlyPeriodsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableOrderingComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableOrderingComposer get employeeId {
    final $$EmployeesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableOrderingComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PayrollResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PayrollResultsTable> {
  $$PayrollResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gross =>
      $composableBuilder(column: $table.gross, builder: (column) => column);

  GeneratedColumn<int> get insuranceBase => $composableBuilder(
    column: $table.insuranceBase,
    builder: (column) => column,
  );

  GeneratedColumn<int> get employeeInsurance => $composableBuilder(
    column: $table.employeeInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get employerInsurance => $composableBuilder(
    column: $table.employerInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unemploymentInsurance => $composableBuilder(
    column: $table.unemploymentInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxBase =>
      $composableBuilder(column: $table.taxBase, builder: (column) => column);

  GeneratedColumn<int> get tax =>
      $composableBuilder(column: $table.tax, builder: (column) => column);

  GeneratedColumn<int> get otherDeductions => $composableBuilder(
    column: $table.otherDeductions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get net =>
      $composableBuilder(column: $table.net, builder: (column) => column);

  GeneratedColumn<int> get employerTotalCost => $composableBuilder(
    column: $table.employerTotalCost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breakdownJson => $composableBuilder(
    column: $table.breakdownJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get manualAdjusted => $composableBuilder(
    column: $table.manualAdjusted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get adjustmentReason => $composableBuilder(
    column: $table.adjustmentReason,
    builder: (column) => column,
  );

  $$MonthlyPeriodsTableAnnotationComposer get periodId {
    final $$MonthlyPeriodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.periodId,
      referencedTable: $db.monthlyPeriods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MonthlyPeriodsTableAnnotationComposer(
            $db: $db,
            $table: $db.monthlyPeriods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeesTableAnnotationComposer get employeeId {
    final $$EmployeesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employees,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeesTableAnnotationComposer(
            $db: $db,
            $table: $db.employees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PayrollResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PayrollResultsTable,
          PayrollResult,
          $$PayrollResultsTableFilterComposer,
          $$PayrollResultsTableOrderingComposer,
          $$PayrollResultsTableAnnotationComposer,
          $$PayrollResultsTableCreateCompanionBuilder,
          $$PayrollResultsTableUpdateCompanionBuilder,
          (PayrollResult, $$PayrollResultsTableReferences),
          PayrollResult,
          PrefetchHooks Function({bool periodId, bool employeeId})
        > {
  $$PayrollResultsTableTableManager(
    _$AppDatabase db,
    $PayrollResultsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayrollResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayrollResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayrollResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> periodId = const Value.absent(),
                Value<int> employeeId = const Value.absent(),
                Value<int> gross = const Value.absent(),
                Value<int> insuranceBase = const Value.absent(),
                Value<int> employeeInsurance = const Value.absent(),
                Value<int> employerInsurance = const Value.absent(),
                Value<int> unemploymentInsurance = const Value.absent(),
                Value<int> taxBase = const Value.absent(),
                Value<int> tax = const Value.absent(),
                Value<int> otherDeductions = const Value.absent(),
                Value<int> net = const Value.absent(),
                Value<int> employerTotalCost = const Value.absent(),
                Value<String> breakdownJson = const Value.absent(),
                Value<bool> manualAdjusted = const Value.absent(),
                Value<String?> adjustmentReason = const Value.absent(),
              }) => PayrollResultsCompanion(
                id: id,
                periodId: periodId,
                employeeId: employeeId,
                gross: gross,
                insuranceBase: insuranceBase,
                employeeInsurance: employeeInsurance,
                employerInsurance: employerInsurance,
                unemploymentInsurance: unemploymentInsurance,
                taxBase: taxBase,
                tax: tax,
                otherDeductions: otherDeductions,
                net: net,
                employerTotalCost: employerTotalCost,
                breakdownJson: breakdownJson,
                manualAdjusted: manualAdjusted,
                adjustmentReason: adjustmentReason,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int periodId,
                required int employeeId,
                required int gross,
                required int insuranceBase,
                required int employeeInsurance,
                required int employerInsurance,
                required int unemploymentInsurance,
                required int taxBase,
                required int tax,
                required int otherDeductions,
                required int net,
                required int employerTotalCost,
                required String breakdownJson,
                Value<bool> manualAdjusted = const Value.absent(),
                Value<String?> adjustmentReason = const Value.absent(),
              }) => PayrollResultsCompanion.insert(
                id: id,
                periodId: periodId,
                employeeId: employeeId,
                gross: gross,
                insuranceBase: insuranceBase,
                employeeInsurance: employeeInsurance,
                employerInsurance: employerInsurance,
                unemploymentInsurance: unemploymentInsurance,
                taxBase: taxBase,
                tax: tax,
                otherDeductions: otherDeductions,
                net: net,
                employerTotalCost: employerTotalCost,
                breakdownJson: breakdownJson,
                manualAdjusted: manualAdjusted,
                adjustmentReason: adjustmentReason,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PayrollResultsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({periodId = false, employeeId = false}) {
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
                    if (periodId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.periodId,
                                referencedTable: $$PayrollResultsTableReferences
                                    ._periodIdTable(db),
                                referencedColumn:
                                    $$PayrollResultsTableReferences
                                        ._periodIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (employeeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.employeeId,
                                referencedTable: $$PayrollResultsTableReferences
                                    ._employeeIdTable(db),
                                referencedColumn:
                                    $$PayrollResultsTableReferences
                                        ._employeeIdTable(db)
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

typedef $$PayrollResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PayrollResultsTable,
      PayrollResult,
      $$PayrollResultsTableFilterComposer,
      $$PayrollResultsTableOrderingComposer,
      $$PayrollResultsTableAnnotationComposer,
      $$PayrollResultsTableCreateCompanionBuilder,
      $$PayrollResultsTableUpdateCompanionBuilder,
      (PayrollResult, $$PayrollResultsTableReferences),
      PayrollResult,
      PrefetchHooks Function({bool periodId, bool employeeId})
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<DateTime> at,
      required String action,
      required String entityType,
      Value<String?> entityId,
      required String summary,
      Value<String?> beforeJson,
      Value<String?> afterJson,
      Value<String?> reason,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<DateTime> at,
      Value<String> action,
      Value<String> entityType,
      Value<String?> entityId,
      Value<String> summary,
      Value<String?> beforeJson,
      Value<String?> afterJson,
      Value<String?> reason,
    });

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
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

  ColumnFilters<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get beforeJson => $composableBuilder(
    column: $table.beforeJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get afterJson => $composableBuilder(
    column: $table.afterJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get beforeJson => $composableBuilder(
    column: $table.beforeJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get afterJson => $composableBuilder(
    column: $table.afterJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get beforeJson => $composableBuilder(
    column: $table.beforeJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get afterJson =>
      $composableBuilder(column: $table.afterJson, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
          AuditLog,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> at = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String?> beforeJson = const Value.absent(),
                Value<String?> afterJson = const Value.absent(),
                Value<String?> reason = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                at: at,
                action: action,
                entityType: entityType,
                entityId: entityId,
                summary: summary,
                beforeJson: beforeJson,
                afterJson: afterJson,
                reason: reason,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> at = const Value.absent(),
                required String action,
                required String entityType,
                Value<String?> entityId = const Value.absent(),
                required String summary,
                Value<String?> beforeJson = const Value.absent(),
                Value<String?> afterJson = const Value.absent(),
                Value<String?> reason = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                at: at,
                action: action,
                entityType: entityType,
                entityId: entityId,
                summary: summary,
                beforeJson: beforeJson,
                afterJson: afterJson,
                reason: reason,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
      AuditLog,
      PrefetchHooks Function()
    >;
typedef $$AppPrefsTableCreateCompanionBuilder =
    AppPrefsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppPrefsTableUpdateCompanionBuilder =
    AppPrefsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppPrefsTableFilterComposer
    extends Composer<_$AppDatabase, $AppPrefsTable> {
  $$AppPrefsTableFilterComposer({
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

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppPrefsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppPrefsTable> {
  $$AppPrefsTableOrderingComposer({
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

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppPrefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppPrefsTable> {
  $$AppPrefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppPrefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppPrefsTable,
          AppPref,
          $$AppPrefsTableFilterComposer,
          $$AppPrefsTableOrderingComposer,
          $$AppPrefsTableAnnotationComposer,
          $$AppPrefsTableCreateCompanionBuilder,
          $$AppPrefsTableUpdateCompanionBuilder,
          (AppPref, BaseReferences<_$AppDatabase, $AppPrefsTable, AppPref>),
          AppPref,
          PrefetchHooks Function()
        > {
  $$AppPrefsTableTableManager(_$AppDatabase db, $AppPrefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppPrefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppPrefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppPrefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppPrefsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppPrefsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppPrefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppPrefsTable,
      AppPref,
      $$AppPrefsTableFilterComposer,
      $$AppPrefsTableOrderingComposer,
      $$AppPrefsTableAnnotationComposer,
      $$AppPrefsTableCreateCompanionBuilder,
      $$AppPrefsTableUpdateCompanionBuilder,
      (AppPref, BaseReferences<_$AppDatabase, $AppPrefsTable, AppPref>),
      AppPref,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CompanyProfileTableTableManager get companyProfile =>
      $$CompanyProfileTableTableManager(_db, _db.companyProfile);
  $$AppAuthTableTableManager get appAuth =>
      $$AppAuthTableTableManager(_db, _db.appAuth);
  $$FiscalYearSettingsTableTableManager get fiscalYearSettings =>
      $$FiscalYearSettingsTableTableManager(_db, _db.fiscalYearSettings);
  $$EmployeesTableTableManager get employees =>
      $$EmployeesTableTableManager(_db, _db.employees);
  $$PayItemDefinitionsTableTableManager get payItemDefinitions =>
      $$PayItemDefinitionsTableTableManager(_db, _db.payItemDefinitions);
  $$MonthlyPeriodsTableTableManager get monthlyPeriods =>
      $$MonthlyPeriodsTableTableManager(_db, _db.monthlyPeriods);
  $$MonthlyInputsTableTableManager get monthlyInputs =>
      $$MonthlyInputsTableTableManager(_db, _db.monthlyInputs);
  $$PayrollResultsTableTableManager get payrollResults =>
      $$PayrollResultsTableTableManager(_db, _db.payrollResults);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$AppPrefsTableTableManager get appPrefs =>
      $$AppPrefsTableTableManager(_db, _db.appPrefs);
}
