import 'package:test/test.dart';
import 'package:leetcode/726_atoms.dart';

void main() {
  test('726 atoms #1', () async {
    var s = Solution();
    var formula = 'H2O';
    expect(s.countOfAtoms(formula), equals('H2O'));
  });
  test('726 atoms #2', () async {
    var s = Solution();
    var formula = 'Mg(OH)2';
    expect(s.countOfAtoms(formula), equals('H2MgO2'));
  });
  test('726 atoms #3', () async {
    var s = Solution();
    var formula = 'K4(ON(SO3)2)2';
    expect(s.countOfAtoms(formula), equals('K4N2O14S4'));
  });
}
