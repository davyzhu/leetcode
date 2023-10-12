import 'package:test/test.dart';
import 'package:leetcode/1172_dinner_plate_stacks.dart';

void main() {
  test('1172 dinner plate stacks #1', () async {
    var D = DinnerPlates(2);
    D.push(1);
    D.push(2);
    D.push(3);
    D.push(4);
    D.push(5);
    expect(D.popAtStack(0), 2);
    D.push(20);
    D.push(21);
    expect(D.popAtStack(0), 20);
    expect(D.popAtStack(2), 21);
    expect(D.pop(), 5);
    expect(D.pop(), 4);
    expect(D.pop(), 3);
    expect(D.pop(), 1);
    expect(D.pop(), -1);
  });
}
