void main() {
  var s = '()()';
  var s2 = s.split('').map((e) => (e == '(') ? 1 : -1);
  for (var e in s2) {
    print(e);
  }
}
