import 'package:test/test.dart';
import 'package:leetcode/498_diagonal_1.dart';

void main() {
  group('leetcode', () {
    test('1x1', () async {
      var mat = [
        [1],
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1]);
    });
    test('3x3', () async {
      var mat = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 4, 7, 5, 3, 6, 8, 9]);
    });
    test('2x3', () async {
      var mat = [
        [1, 2, 3],
        [4, 5, 6]
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 4, 5, 3, 6]);
    });
    test('3x2', () async {
      var mat = [
        [1, 2],
        [4, 5],
        [7, 8]
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 4, 7, 5, 8]);
    });
    test('2x2', () async {
      var mat = [
        [1, 2],
        [3, 4]
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 3, 4]);
    });
    test('1x5', () async {
      var mat = [
        [1, 2, 3, 4, 5],
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 3, 4, 5]);
    });
    test('5x1', () async {
      var mat = [
        [1],
        [2],
        [3],
        [4],
        [5]
      ];
      var s = Solution();
      expect(s.findDiagonalOrder(mat), [1, 2, 3, 4, 5]);
    });
  });
}
