import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfication_model.freezed.dart';
part 'transfication_model.g.dart';

@freezed
class TransficationModel with _$TransficationModel {
  const factory TransficationModel({
    required String title,
    required String date,
    required double amount,
    required String iconPath,
    @Default('INR') String currency,
    @Default(true) bool isExpense,
    String? logoUrl,

    @Default(Colors.black) Color itemColor,
  }) = _TransficationModel;

  factory TransficationModel.fromJson(Map<String, dynamic> json) =>
      _$TransficationModelFromJson(json);
}
