import 'package:leetcode/740_delete_earn.dart';
import 'package:test/test.dart';

void main() {
  test('740 delete #1', () async {
    var s = Solution();
    var nums = [3, 4, 2];
    expect(s.deleteAndEarn(nums), equals(6));
  });

  test('740 delete #2', () async {
    var s = Solution();
    var nums = [2, 2, 3, 3, 3, 4];
    expect(s.deleteAndEarn(nums), equals(9));
  });
}
