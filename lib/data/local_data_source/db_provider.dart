import 'dart:async';

import 'package:commmercial_directory_seller/domain/entities/location_entity/city_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/country_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/location_entity/region_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/standard_entity/standar_response.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "gogesh.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Service ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "has_sections INTEGER"
            ")");
        await db.execute("CREATE TABLE Section ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "services_id INTEGER"
            ")");
        await db.execute("CREATE TABLE Activity ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT"
            "sector_id INTEGER"
            ")");
        await db.execute("CREATE TABLE Specialization ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "activity_id INTEGER"
            ")");
        await db.execute("CREATE TABLE Occasion ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT"
            ")");
        await db.execute("CREATE TABLE Country ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT"
            ")");
        await db.execute("CREATE TABLE Region ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "city_id INTEGER"
            ")");
        await db.execute("CREATE TABLE City ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "country_id INTEGER"
            ")");
      },
    );
  }

  Future saveCountries(List<Datacountry> countries) async {
    final db = await database;
    final batch = db?.batch();

    for (final element in countries) {
      batch?.insert("Country", element.toJson());
    }
    await batch?.commit();
  }

  Future saveRegions(List<DataRegion> region) async {
    final db = await database;
    final batch = db?.batch();

    for (final element in region) {
      batch?.insert("Region", element.toJson());
    }
    await batch?.commit();
  }

  Future saveCities(List<Datacity> countries) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in countries) {
      batch?.insert("City", element.toJson());
    }
    await batch?.commit();
  }

  Future saveServices(List<StandarEntity> services) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in services) {
      batch?.insert("Service", {
        "id": element.id,
        "name": element.name,
        "has_sections": (element.hasSections ?? false) ? 1 : 0
      });
    }
    await batch?.commit();
  }

  Future saveSections(List<StandarEntity> sections) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in sections) {
      batch?.insert("Section", element.toJson());
    }
    await batch?.commit();
  }

  Future saveActivities(List<StandarEntity> activities) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in activities) {
      batch?.insert("Activity", element.toJson());
    }
    await batch?.commit();
  }

  Future saveSpecialities(List<StandarEntity> specialities) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in specialities) {
      batch?.insert("Specialization", element.toJson());
    }
    await batch?.commit();
  }

  Future saveOccasion(List<StandarEntity> specialities) async {
    final db = await database;
    final batch = db?.batch();
    for (final element in specialities) {
      batch?.insert("Occasion", element.toJson());
    }
    await batch?.commit();
  }

  Future<List<Datacountry>> getCountries({String? name}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null) {
      list = await db
          ?.query("Country", where: '"name" LIKE ? ', whereArgs: ["$name%"]);
    } else {
      list = await db?.query("Country");
    }

    List<Datacountry> countries = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        countries.add(Datacountry.fromJson(element));
      }
    }
    return countries;
  }

  Future<List<DataRegion>> getRegions(
      {required int countryId, String? name}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null) {
      list = await db?.query("Region",
          where: "city_id = ? AND name LIKE ? ",
          whereArgs: [countryId, "$name%"]);
    } else {
      list = await db
          ?.query("Region", where: "city_id = ? ", whereArgs: [countryId]);
    }

    List<DataRegion> regions = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        regions.add(DataRegion.fromJson(element));
      }
    }
    return regions;
  }

  Future<List<Datacity>> getCities(
      {required int regionId, String? name}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null) {
      list = await db?.query("City",
          where: "country_id = ? AND name LIKE ? ",
          whereArgs: [regionId, "$name%"]);
    } else {
      list = await db
          ?.query("City", where: "country_id = ? ", whereArgs: [regionId]);
    }
    List<Datacity> cities = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        cities.add(Datacity.fromJson(element));
      }
    }
    return cities;
  }

  Future<List<StandarEntity>> getServices({String? name, int page = 1}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null && name.isNotEmpty) {
      list = await db?.query(
        "Service",
        where: "name LIKE ? ",
        whereArgs: ["$name%"],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else {
      list = await db?.query(
        "Service",
        limit: 15,
        offset: (page - 1) * 15,
      );
    }
    List<StandarEntity> services = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        final j = {
          "name": element["name"],
          "id": element["id"],
          "has_sections": element["has_sections"] == 1 ? true : false
        };
        services.add(StandarEntity.fromJson(j));
      }
    }

    return services;
  }

  Future<List<StandarEntity>> getSections(
      {required int serviceId, String? name, int page = 1}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null && name.isNotEmpty) {
      list = await db?.query(
        "Section",
        where: "services_id = ? AND name LIKE ? ",
        whereArgs: [serviceId, "$name%"],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else {
      list = await db?.query(
        "Section",
        where: "services_id = ? ",
        whereArgs: [serviceId],
        limit: 15,
        offset: (page - 1) * 15,
      );
    }

    List<StandarEntity> cities = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        cities.add(StandarEntity.fromJson(element));
      }
    }

    return cities;
  }

  Future<List<StandarEntity>> getActivities(
      {String? name, int page = 1, int? sectorId}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null && name.isNotEmpty && sectorId != null) {
      list = await db?.query(
        "Activity",
        where: "sector_id = ? AND name LIKE ? ",
        whereArgs: [sectorId, "$name%"],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else if (sectorId != null) {
      list = await db?.query(
        "Activity",
        where: "sector_id = ? ",
        whereArgs: [sectorId],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else if (name != null && name.isNotEmpty) {
      list = await db?.query(
        "Activity",
        where: "name = ? ",
        whereArgs: [name],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else {
      list = await db?.query(
        "Activity",
        limit: 15,
        offset: (page - 1) * 15,
      );
    }

    List<StandarEntity> cities = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        cities.add(StandarEntity.fromJson(element));
      }
    }

    return cities;
  }

  Future<List<StandarEntity>> getSpecialities(
      {int? activityId, String? name, int page = 1}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null && name.isNotEmpty && activityId != null) {
      list = await db?.query(
        "Specialization",
        where: "activity_id = ? AND name LIKE ? ",
        whereArgs: [activityId, "$name%"],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else if (activityId != null) {
      list = await db?.query(
        "Specialization",
        where: "activity_id = ? ",
        whereArgs: [activityId],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else if (name != null && name.isNotEmpty) {
      list = await db?.query(
        "Specialization",
        where: "name = ? ",
        whereArgs: [name],
        limit: 15,
        offset: (page - 1) * 15,
      );
    } else {
      list = await db?.query(
        "Specialization",
        limit: 15,
        offset: (page - 1) * 15,
      );
    }
    List<StandarEntity> cities = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        cities.add(StandarEntity.fromJson(element));
      }
    }

    return cities;
  }

  Future<List<StandarEntity>> getOccasion({String? name, int page = 1}) async {
    final db = await database;
    List<Map<String, Object?>>? list = [];
    if (name != null && name.isNotEmpty) {
      list = await db?.query(
        "Occasion",
        where: "name LIKE ? ",
        whereArgs: ["$name%"],
        limit: 15,
        offset: (page - 1) * 15,
      );
    }
    list = await db?.query(
      "Occasion",
      limit: 15,
      offset: (page - 1) * 15,
    );
    List<StandarEntity> cities = [];
    if (list != null && list.isNotEmpty) {
      for (var element in list) {
        cities.add(StandarEntity.fromJson(element));
      }
    }

    return cities;
  }

  Future<void> clear() async {
    final db = await database;
    await db?.delete("Country");
    await db?.delete("City");
    await db?.delete("Region");
    await db?.delete("Service");
    await db?.delete("Section");
    await db?.delete("Activity");
    await db?.delete("Specialization");
    await db?.delete("Occasion");
  }
}
