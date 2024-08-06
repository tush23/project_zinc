extension StringCapitalization on String {
  /// Capitalizes the first letter of the string.
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
