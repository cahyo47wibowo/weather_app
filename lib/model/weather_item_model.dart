class WeatherItem {
  int _id;
  String _main;
  String _desc;
  String _icon;

  WeatherItem(parsedJson){
    _id = parsedJson['id'];
    _main = parsedJson['main'];
    _desc = parsedJson['description'];
    _icon = parsedJson['icon'];
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get main => _main;

  set main(String value) {
    _main = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}