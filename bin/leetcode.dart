void main() {
  var s = 'abcd';
  var x = '$s{$s';
  for (var i = 0; i < s.length; i++) {
    print(x.substring(i));
  }

}
