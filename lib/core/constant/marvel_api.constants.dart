class MarvelApiConstants {
  static const characters = '/characters';
  static String characterComicsById(String id) => '/characters/$id/comics';
  static String characterEventsById(String id) => '/characters/$id/events';
  static String characterSeriesById(String id) => '/characters/$id/series';
  static String characterStoriesById(String id) => '/characters/$id/stories';
}
