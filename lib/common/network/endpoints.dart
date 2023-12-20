class Endpoints {
  Endpoints._();

  static const String key = 'MGs5owEZ4ViPanqnkmYGEzVExSa7C4u9';

  static String getMostPopular(int period) {
    return "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/$period.json?api-key=$key";
  }
}
