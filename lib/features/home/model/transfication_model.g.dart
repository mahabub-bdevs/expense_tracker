// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransficationModelImpl _$$TransficationModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransficationModelImpl(
  title: json['title'] as String,
  date: json['date'] as String,
  amount: (json['amount'] as num).toDouble(),
  iconPath: json['iconPath'] as String,
  currency: json['currency'] as String? ?? 'INR',
  isExpense: json['isExpense'] as bool? ?? true,
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$$TransficationModelImplToJson(
  _$TransficationModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'date': instance.date,
  'amount': instance.amount,
  'iconPath': instance.iconPath,
  'currency': instance.currency,
  'isExpense': instance.isExpense,
  'logoUrl': instance.logoUrl,
};
