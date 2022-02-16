import 'dart:convert';
import 'dart:typed_data';

class Converter {
  static List convert(Uint8List data) {
    var temp = data;
    var list = List.from(temp);
    return list;
  }

  static List<int> convertString(String data) {
    List<int> list = [];
    for (int i = 0; i < data.length; i++) {
      var temp = ascii.encode(data[i]);
      List<int> tempList = List.from(temp);
      list.addAll(tempList);
    }
    return list;
  }
}
