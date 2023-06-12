import 'dart:io';

String readCharacterListJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/character_list_response.json',
  ).readAsStringSync();
}

String readComicDetailJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/comic_detail_response.json',
  ).readAsStringSync();
}

String readSerieDetailJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/serie_detail_response.json',
  ).readAsStringSync();
}

String readEventDetailJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/event_detail_response.json',
  ).readAsStringSync();
}
