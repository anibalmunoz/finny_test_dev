class Formatters {
  static String minutesToHours(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (hours > 0) {
      return remainingMinutes > 0 ? '$hours horas $remainingMinutes minutos' : '$hours horas';
    } else {
      return '$remainingMinutes minutos';
    }
  }

  static String subjects(List<String>? subjects) {
    if (subjects == null || subjects.isEmpty) return '';
    final first = subjects.first;
    final capitalizedFirst = first[0].toUpperCase() + first.substring(1);
    final rest = subjects.skip(1).join(', ');
    final subject = rest.isNotEmpty ? '$capitalizedFirst, $rest' : capitalizedFirst;
    return subject.replaceAll('-', ' ');
  }

  static String moduleName(String original) {
    int lastDot = original.lastIndexOf('.');
    String name = (lastDot != -1) ? original.substring(lastDot + 1) : original;
    name = name.replaceAll('-', ' ');
    if (name.isNotEmpty) {
      name = name[0].toUpperCase() + name.substring(1);
    }
    return name;
  }

  static String reviews(int reviews) {
    if (reviews >= 1000000) {
      double value = reviews / 1000000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}M';
    } else if (reviews >= 1000) {
      double value = reviews / 1000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}K';
    } else {
      return reviews.toString();
    }
  }
}
