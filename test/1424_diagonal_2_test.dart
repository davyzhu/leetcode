import 'package:test/test.dart';
import 'package:leetcode/1424_diagonal_2.dart';

void main() {
  group('leetcode', () {
    test('#1', () async {
      var nums = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      var output = [1, 4, 2, 7, 5, 3, 8, 6, 9];
      var s = Solution();
      expect(s.findDiagonalOrder(nums), output);
    });
    test('#2', () async {
      var nums = [
        [1, 2, 3, 4, 5],
        [6, 7],
        [8],
        [9, 10, 11],
        [12, 13, 14, 15, 16]
      ];
      var output = [1, 6, 2, 8, 7, 3, 9, 4, 12, 10, 5, 13, 11, 14, 15, 16];
      var s = Solution();
      expect(s.findDiagonalOrder(nums), output);
    });
  });
}
