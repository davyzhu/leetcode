import 'package:test/test.dart';
import 'package:leetcode/895_freq_stack.dart';

void main() {
  test('895 freq stack ...', () async {
    var freqStack = FreqStack();
    freqStack.push(5); // The stack is [5]
    freqStack.push(7); // The stack is [5,7]
    freqStack.push(5); // The stack is [5,7,5]
    freqStack.push(7); // The stack is [5,7,5,7]
    freqStack.push(4); // The stack is [5,7,5,7,4]
    freqStack.push(5); // The stack is [5,7,5,7,4,5]
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(5));
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(7));
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(5));
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(4));
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(7));
    print(freqStack.freqTimeSet);
    expect(freqStack.pop(), equals(5));
  });
}
