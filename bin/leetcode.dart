import 'dart:collection';

void main() {
  var s = 'leetcode';
  var s2 = s.split('').map((e) => StringBuffer(e));
  var q = Queue.of(s2);
  for (var e in q) {
    print(e.runtimeType);
  }
}
