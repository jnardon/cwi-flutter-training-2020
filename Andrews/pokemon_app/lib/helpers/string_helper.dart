class StringHelper {
  static String capitalizeFirstLetter(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  static String setToDisplayPattern(String str) {
    str.trim();
    List<String> words = str.split(RegExp(r'[\s-]+'));
    words = words.map((w) => '${w[0].toUpperCase()}${w.substring(1)}').toList();
    return words.join(' ');
  }
}
