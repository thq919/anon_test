// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HistoryListDAO? _historyListDaoInstance;

  HistoryEntityDAO? _historyEntityDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HistoryListEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `list` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HistoryEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `whenCreated` INTEGER NOT NULL, `pathtToFile` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HistoryListDAO get historyListDao {
    return _historyListDaoInstance ??=
        _$HistoryListDAO(database, changeListener);
  }

  @override
  HistoryEntityDAO get historyEntityDAO {
    return _historyEntityDAOInstance ??=
        _$HistoryEntityDAO(database, changeListener);
  }
}

class _$HistoryListDAO extends HistoryListDAO {
  _$HistoryListDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _historyListEntityInsertionAdapter = InsertionAdapter(
            database,
            'HistoryListEntity',
            (HistoryListEntity item) => <String, Object?>{
                  'id': item.id,
                  'list': _listHistoryModelConverter.encode(item.list)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HistoryListEntity> _historyListEntityInsertionAdapter;

  @override
  Future<HistoryListEntity?> getHistoryListModel() async {
    return _queryAdapter.query('SELECT * FROM HistoryListEntity',
        mapper: (Map<String, Object?> row) => HistoryListEntity(
            id: row['id'] as int,
            list: _listHistoryModelConverter.decode(row['list'] as String)));
  }

  @override
  Future<void> insertHistoryListModel(HistoryListEntity model) async {
    await _historyListEntityInsertionAdapter.insert(
        model, OnConflictStrategy.abort);
  }
}

class _$HistoryEntityDAO extends HistoryEntityDAO {
  _$HistoryEntityDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _historyEntityInsertionAdapter = InsertionAdapter(
            database,
            'HistoryEntity',
            (HistoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'whenCreated': _dateTimeConverter.encode(item.whenCreated),
                  'pathtToFile': item.pathtToFile
                }),
        _historyEntityDeletionAdapter = DeletionAdapter(
            database,
            'HistoryEntity',
            ['id'],
            (HistoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'whenCreated': _dateTimeConverter.encode(item.whenCreated),
                  'pathtToFile': item.pathtToFile
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HistoryEntity> _historyEntityInsertionAdapter;

  final DeletionAdapter<HistoryEntity> _historyEntityDeletionAdapter;

  @override
  Future<HistoryEntity?> getHistoryEntity() async {
    return _queryAdapter.query('SELECT * FROM HistoryEntity',
        mapper: (Map<String, Object?> row) => HistoryEntity(
            id: row['id'] as int,
            pathtToFile: row['pathtToFile'] as String,
            whenCreated: _dateTimeConverter.decode(row['whenCreated'] as int)));
  }

  @override
  Future<void> insertHistoryEntity(HistoryEntity model) async {
    await _historyEntityInsertionAdapter.insert(
        model, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteHistoryEntity(HistoryEntity model) async {
    await _historyEntityDeletionAdapter.delete(model);
  }
}

// ignore_for_file: unused_element
final _listHistoryModelConverter = ListHistoryModelConverter();
final _dateTimeConverter = DateTimeConverter();
