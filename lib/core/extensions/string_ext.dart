extension StringExtension on String {
  String removeExtraSpaces() {
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  String capitalizeWord() {
    return split(RegExp(r'[\s-]+'))
        .map((word) {
          if (word.isEmpty) return '';
          return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
        })
        .join(' ');
  }
}
