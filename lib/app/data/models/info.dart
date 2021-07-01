abstract class Info {
  final String name;
  final String imageUrl;
  final String description;
  final double? rate;
  Info({
    required this.name,
    required this.imageUrl,
    required this.description,
    this.rate,
  });
}
