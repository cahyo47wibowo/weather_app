class Cloud{
  int _all;

  Cloud(parsedJson){
    _all = parsedJson['all'];
  }

  int get all => _all;

  set all(int value) {
    _all = value;
  }
}