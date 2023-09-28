import 'dart:collection';

void main() {
  var baseMap = {1:1,3:2,5:1,7:1};
  var map = SplayTreeMap.of(baseMap);
  var total = 0;
  for (var key in map.keys) {
    final v = map[key]! + total;
    map[key] = v ;
    total = v;
  }
  print(map);
}
