extension NumberFormatExtension on String {
  String formatWithThousandsSeparator() {
    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return replaceAllMapped(regex, (Match match) => '${match[1]} ');
  }
}