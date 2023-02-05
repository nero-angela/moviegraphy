mixin TimeHelper {
  static bool get isDaytime {
    final int hour = DateTime.now().hour;
    return hour > 6 && hour < 18;
  }
}
