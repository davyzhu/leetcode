import 'dart:collection';

class Solution {
  final List<HashMap<String, int>> mapStack = [];
  final re = RegExp(
      r'(?<eName>[A-Z][a-z]*)(?<eCount>\d*)|(?<lP>\()|(?<rP>\))(?<rPCount>\d*)');

  /// Three kinds of tokens: element'Mg3', left'(', right')2'
  /// element:   add element name and count to hashmap
  /// left'(':   push a new hashmap to stack
  /// right')2': multiply all element on top of stack with count,
  ///            pop top hashmap (add element to next hashmap on stack)
  String countOfAtoms(String formula) {
    mapStack.add(HashMap());
    for (var m in re.allMatches(formula)) {
      final eName = m.namedGroup('eName');
      final lP = m.namedGroup('lP');
      final rP = m.namedGroup('rP');
      if (lP != null) {
        mapStack.add(HashMap());
      } else if (rP != null) {
        final int rPCount = parseInt(m.namedGroup('rPCount'));
        final topMap = mapStack.removeLast();
        topMap.forEach((key, value) {
          if (mapStack.last.containsKey(key)) {
            mapStack.last[key] = mapStack.last[key]! + value * rPCount;
          } else {
            mapStack.last[key] = value * rPCount;
          }
        });
      } else {
        final int eCount = parseInt(m.namedGroup('eCount'));
        var map = mapStack.last;
        if (map.containsKey(eName)) {
          map[eName!] = map[eName]! + eCount;
        } else {
          map[eName!] = eCount;
        }
      }
    }
    return SplayTreeMap.of(mapStack.single).entries.fold(
        '', (pv, e) => pv + e.key + ((e.value != 1) ? e.value.toString() : ''));
  }

  int parseInt(String? str) {
    return (str != null && str.isNotEmpty) ? int.parse(str) : 1;
  }
}
