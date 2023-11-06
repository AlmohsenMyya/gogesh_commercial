import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ServiceTypeEnum {
  all('all'),
  approved('approved'),
  pending('pending'),
  rejected('rejected'),
  notPaid('Not_Paid');

  const ServiceTypeEnum(this.name);

  final String name;
}

enum Gender { Male, Female }

class TypeCompanty {
  TypeCompanty({required this.name, required this.type, this.icon});
  final Type type;
  final String? name;
  final Icon? icon;
}

enum Type { Company, Personal }

enum Delevery { accept, revuse }
