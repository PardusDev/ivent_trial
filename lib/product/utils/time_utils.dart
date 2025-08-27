class TimeUtils {
  TimeUtils._();

  /// Formats total seconds into MM:SS string (e.g., 180 -> 03:00)
  static String formatSecondsToMinutesSeconds(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    final String mm = minutes.toString().padLeft(2, '0');
    final String ss = seconds.toString().padLeft(2, '0');
    return '$mm:$ss';
  }
}
