class Sys {
  int _id;
  int _type;
  double _message;
  String _country;
  int _sunrise;
  int _sunset;

  Sys(parsedJson){
    _id = parsedJson['id'];
    _type = parsedJson['type'];
    _message = parsedJson['message'];
    _country = parsedJson['country'];
    _sunrise = parsedJson['sunrise'];
    _sunset = parsedJson['sunset'];
  }

  int get sunset => _sunset;

  set sunset(int value) {
    _sunset = value;
  }

  int get sunrise => _sunrise;

  set sunrise(int value) {
    _sunrise = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  double get message => _message;

  set message(double value) {
    _message = value;
  }

  int get type => _type;

  set type(int value) {
    _type = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}