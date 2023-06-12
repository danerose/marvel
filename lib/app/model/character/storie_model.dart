import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';
import 'package:marvel/app/model/character/item_model.dart';

class Storie extends Equatable {
  final int available;
  final String collectionURI;
  final List<Item> items;
  final int returned;

  const Storie({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  const Storie.empty()
      : available = 0,
        collectionURI = '',
        items = const [],
        returned = 0;

  factory Storie.fromJson(Map<String, dynamic>? json) {
    return Storie(
      available: ValidatorUtils.containsKey<int>(json, 'available', 0),
      collectionURI: ValidatorUtils.containsKey(json, 'collectionURI', ''),
      items: List.from(ValidatorUtils.containsKey(json, 'items', []).map(
        (e) => Item.fromJson(e),
      )),
      returned: ValidatorUtils.containsKey<int>(json, 'returned', 0),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'available': available,
      'collectionURI': collectionURI,
      'items': items.map((i) => i.toJson()).toList(),
      'returned': returned,
    };
  }

  @override
  List<Object?> get props => [
        available,
        collectionURI,
        items,
        returned,
      ];
}
