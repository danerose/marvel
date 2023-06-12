import 'package:equatable/equatable.dart';
import 'package:marvel/core/utils/validators.util.dart';

class Item extends Equatable {
  final String resourceURI;
  final String name;
  final String type;

  const Item({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  const Item.empty()
      : resourceURI = '',
        name = '',
        type = '';

  factory Item.fromJson(Map<String, dynamic>? json) {
    return Item(
      resourceURI: ValidatorUtils.containsKey(json, 'resourceURI', ''),
      name: ValidatorUtils.containsKey(json, 'name', ''),
      type: ValidatorUtils.containsKey(json, 'type', ''),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'resourceURI': resourceURI,
      'name': name,
      'type': type,
    };
  }

  @override
  List<Object?> get props => [resourceURI, name, type];
}
