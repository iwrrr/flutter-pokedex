class EvolutionStep {
  final String fromName;
  final String toName;
  final String fromImage;
  final String toImage;
  final int? minLevel;

  const EvolutionStep({
    required this.fromName,
    required this.toName,
    required this.fromImage,
    required this.toImage,
    this.minLevel,
  });
}
