import 'package:meta/meta.dart';
import 'dart:convert';

TransactionModels transactionModelsFromJson(String str) =>
    TransactionModels.fromJson(json.decode(str));

String transactionModelsToJson(TransactionModels data) =>
    json.encode(data.toJson());

class TransactionModels {
  TransactionModels({
    required this.name,
    required this.time,
    required this.transactionModelsIn,
    required this.out,
  });

  String name;
  String time;
  String transactionModelsIn;
  String out;

  factory TransactionModels.fromJson(Map<String, dynamic> json) =>
      TransactionModels(
        name: json["name"],
        time: json["time"],
        transactionModelsIn: json["in"],
        out: json["out"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
        "in": transactionModelsIn,
        "out": out,
      };
}
