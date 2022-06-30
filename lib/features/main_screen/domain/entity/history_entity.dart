import 'package:floor/floor.dart';

@Entity()
@TypeConverters([DateTimeConverter])
class HistoryEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final DateTime whenCreated;
  final String pathtToFile;

  HistoryEntity({required this.id, required this.pathtToFile, required this.whenCreated});
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}