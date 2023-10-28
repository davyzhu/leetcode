import 'package:test/test.dart';
import 'package:leetcode/838_push_dominoes.dart';

void main() {
  group('length=1', () {
    test('L', () async {
      var dominoes = "L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "L");
    });
    test('R', () async {
      var dominoes = "R";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "R");
    });
    test('.', () async {
      var dominoes = ".";
      var s = Solution();
      expect(s.pushDominoes(dominoes), ".");
    });
  });

  group('length=2', () {
    test('..', () async {
      var dominoes = "..";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "..");
    });
    test('.L', () async {
      var dominoes = ".L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LL");
    });
    test('.R', () async {
      var dominoes = ".R";
      var s = Solution();
      expect(s.pushDominoes(dominoes), ".R");
    });
    test('L.', () async {
      var dominoes = "L.";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "L.");
    });
    test('LL', () async {
      var dominoes = "LL";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LL");
    });
    test('LR', () async {
      var dominoes = "LR";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LR");
    });
    test('R.', () async {
      var dominoes = "R.";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RR");
    });
    test('RL', () async {
      var dominoes = "RL";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RL");
    });
    test('RR', () async {
      var dominoes = "RR";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RR");
    });
  });

  group('middle', () {
    test('L.R', () async {
      var dominoes = "L.R";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "L.R");
    });
    test('R.L', () async {
      var dominoes = "R.L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "R.L");
    });
    test('R..L', () async {
      var dominoes = "R..L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RRLL");
    });
    test('R...L', () async {
      var dominoes = "R...L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RR.LL");
    });
    test('R....L', () async {
      var dominoes = "R....L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RRRLLL");
    });
  });

  group('leetcode test', () {
    test('.R.L', () async {
      var dominoes = ".R.L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), ".R.L");
    });
    test('LR.L', () async {
      var dominoes = "LR.L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LR.L");
    });
    test('RR.L', () async {
      var dominoes = "RR.L";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "RR.L");
    });
    test('.L.R', () async {
      var dominoes = ".L.R";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LL.R");
    });
    
    test('.L.R.', () async {
      var dominoes = ".L.R.";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LL.RR");
    });
    test('.L.R...LR..L..', () async {
      var dominoes = ".L.R...LR..L..";
      var s = Solution();
      expect(s.pushDominoes(dominoes), "LL.RR.LLRRLL..");
    });
  });
}
