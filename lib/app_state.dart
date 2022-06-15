import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _color1 = prefs.getString('ff_color1') ?? _color1;
    _color2 = prefs.getString('ff_color2') ?? _color2;
    _color4 = prefs.getString('ff_color4') ?? _color4;
    _color5 = prefs.getString('ff_color5') ?? _color5;
    _color6 = prefs.getString('ff_color6') ?? _color6;
    _color7 = prefs.getString('ff_color7') ?? _color7;
    _color8 = prefs.getString('ff_color8') ?? _color8;
    _color9 = prefs.getString('ff_color9') ?? _color9;
    _categoriaSelected =
        prefs.getString('ff_categoriaSelected') ?? _categoriaSelected;
  }

  SharedPreferences prefs;

  DocumentReference Selected;

  DateTime fecha;

  String option = '';

  String colorSelect = '';

  String _color1 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-bitter-lime-solid-color-background.jpg';
  String get color1 => _color1;
  set color1(String _value) {
    _color1 = _value;
    prefs.setString('ff_color1', _value);
  }

  String _color2 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-cotton-candy-solid-color-background.jpg';
  String get color2 => _color2;
  set color2(String _value) {
    _color2 = _value;
    prefs.setString('ff_color2', _value);
  }

  String color3 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-tiffany-blue-solid-color-background.jpg';

  String _color4 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-sunray-solid-color-background.jpg';
  String get color4 => _color4;
  set color4(String _value) {
    _color4 = _value;
    prefs.setString('ff_color4', _value);
  }

  String _color5 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-vivid-cerise-solid-color-background.jpg';
  String get color5 => _color5;
  set color5(String _value) {
    _color5 = _value;
    prefs.setString('ff_color5', _value);
  }

  String _color6 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-midnight-green-solid-color-background.jpg';
  String get color6 => _color6;
  set color6(String _value) {
    _color6 = _value;
    prefs.setString('ff_color6', _value);
  }

  String _color7 =
      'https://www.solidbackgrounds.com/images/125x125/125x125-rose-red-solid-color-background.jpg';
  String get color7 => _color7;
  set color7(String _value) {
    _color7 = _value;
    prefs.setString('ff_color7', _value);
  }

  String _color8 =
      'https://www.solidbackgrounds.com/images/1280x800/1280x800-lemon-glacier-solid-color-background.jpg';
  String get color8 => _color8;
  set color8(String _value) {
    _color8 = _value;
    prefs.setString('ff_color8', _value);
  }

  String _color9 =
      'https://www.solidbackgrounds.com/images/2880x1800/2880x1800-aero-solid-color-background.jpg';
  String get color9 => _color9;
  set color9(String _value) {
    _color9 = _value;
    prefs.setString('ff_color9', _value);
  }

  String _categoriaSelected = '';
  String get categoriaSelected => _categoriaSelected;
  set categoriaSelected(String _value) {
    _categoriaSelected = _value;
    prefs.setString('ff_categoriaSelected', _value);
  }

  List<String> listaphotos = [
    'https://picsum.photos/seed/758/600',
    'https://picsum.photos/seed/283/600',
    'https://picsum.photos/seed/380/600'
  ];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
