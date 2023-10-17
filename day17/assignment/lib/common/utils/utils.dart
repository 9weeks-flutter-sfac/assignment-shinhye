class Utils {
  static String getTimeDiffFromCreatedTime(String data) {
    var diffMinutes = DateTime.now().difference(DateTime.parse(data)).inMinutes;
    if (diffMinutes == 0) {
      return '지금';
    } else if (diffMinutes < 60) {
      return '$diffMinutes분 전';
    } else if (diffMinutes / 60 < 24) {
      return '${diffMinutes ~/ 60}시간 전';
    }
    return '${diffMinutes ~/ 60 ~/ 24}일 전';
  }
}
