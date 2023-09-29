import 'package:test/test.dart';
import 'package:leetcode/2296_editor.dart';
void main() {
  test('2296 editor ...', () async {
    var textEditor = TextEditor(); 
    textEditor.addText("leetcode"); // "leetcode|"
    expect( textEditor.deleteText(4), equals(4)); // "leet|"
    textEditor.addText("practice"); // "leetpractice|"
    expect(textEditor.cursorRight(3), equals('etpractice')); //"leetpractice|", cannot move to the right
    expect(textEditor.cursorLeft(8) , equals("leet")); //"leet|practice"
    expect(textEditor.deleteText(10), equals(4)); //"|practice"
    expect(textEditor.cursorLeft(2), equals('')); //"|practice"
    expect(textEditor.cursorRight(6), equals('practi')); //"practi|ce"
  });
}