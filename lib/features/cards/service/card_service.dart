import 'package:expense_tracker/features/cards/model/card_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardService {
  final Box<CardModel> _box = Hive.box<CardModel>("card");

  Future<void> getAddCard(CardModel card) async {
    await _box.add(card);
  }

  List<CardModel> getAllCard() {
    return _box.values.toList();
  }

  Future<void> getDeletedCard(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> getUpdateCard(CardModel card, int index) async {
    final key = _box.keyAt(index);
    await _box.put(key, card);
  }
}
