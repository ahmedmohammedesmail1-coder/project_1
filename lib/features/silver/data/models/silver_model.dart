class SilverModel {
  final String name;
  final double price;
  final String symbol;
  final DateTime updatedAt;
  final String updatedAtReadable;
  SilverModel({
    required this.price,
    required this.name,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });
  factory SilverModel.fromJson(Map<String, dynamic> json) {
    return SilverModel(
      price: (json['price'] as num).toDouble(),
      name: json['name'],
      symbol: json['symbol'],
      updatedAt: DateTime.parse(json['updated_at']),
      updatedAtReadable: json['updated_at_readable'],
    );
  }
}
