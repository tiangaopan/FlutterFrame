int maxLength = 340;

void printLong(String log) {
  if (log.length < maxLength) {
    print(log);
  } else {
    while (log.length > maxLength) {
      print(log.substring(0, maxLength));
      log = log.substring(maxLength);
    }
    //打印剩余部分
    print(log);
  }
}