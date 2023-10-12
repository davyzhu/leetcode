import 'package:test/test.dart';
import 'package:leetcode/1146_snapshot.dart';

void main() {
  test('1146 snapshot ...', () async {
    var s = SnapshotArray(3);
    s.set(0, 5);
    expect(s.snap(), equals(0));
    s.set(0, 6);
    expect(s.get(0, 0), 5);
  });
}
