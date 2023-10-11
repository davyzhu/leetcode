import 'dart:collection';

enum Type { let, add, mul, end, name, val }

class Token {
  final Type type;
  final String? name;
  final int? val;

  Token(this.type, {this.name, this.val});
}

class Solution {
  /// Three kinds of tokens:
  /// command: '(let', '(add','(mult',')'
  /// variable: [a-z][a-z0-9]*
  /// integer: -?[1-9][0-9]*
  /// An expression is either an integer, let expression, add expression, mult expression, or an assigned variable.
  /// Expressions always evaluate to a single integer.
  final re = RegExp(
      r'(?<cmd>\(let|\(add|\(mult|\))|(?<v>[a-z][a-z0-9]*)|(?<num>-?[1-9][0-9]*)');
  final List<Token> tokens = [];
  var index = 0;
  final List<HashMap<String, int>> stack = [];
  int evaluate(String expression) {
    parse(expression);
    return expr();
  }

  void parse(String expression) {
    for (var m in re.allMatches(expression)) {
      var cmd = m.namedGroup('cmd');
      var name = m.namedGroup('v');
      var t = m.namedGroup('num');
      var val = (t == null) ? null : int.parse(t);
      if (cmd != null) {
        switch (cmd) {
          case '(let':
            tokens.add(Token(Type.let));
            break;
          case '(add':
            tokens.add(Token(Type.add));
            break;
          case '(mult':
            tokens.add(Token(Type.mul));
            break;
          case ')':
            tokens.add(Token(Type.end));
            break;
          default:
            assert(false, 'unknown command');
        }
      }
      if (name != null) {
        tokens.add(Token(Type.name, name: name));
      }
      if (val != null) {
        tokens.add(Token(Type.val, val: val));
      }
    }
  }

  int expr() {
    switch (tokens[index].type) {
      case Type.add:
        index++;
        var result = expr() + expr();
        assert(tokens[index++].type == Type.end, 'error: add without end');
        return result;
      case Type.mul:
        index++;
        var result = expr() * expr();
        assert(tokens[index++].type == Type.end, 'error: mul without end');
        return result;
      case Type.let:
        // let [name expr]+ expr end
        stack.add(HashMap());
        index++;
        do {
          var n = tokens[index];
          assert(tokens[index++].type == Type.name,
              'error: first token is not a name');
          var v = expr();
          stack.last[n.name!] = v;
        } while (tokens[index].type == Type.name &&
            tokens[index + 1].type != Type.end);
        var result = expr();
        assert(tokens[index].type == Type.end, 'error: try without end');
        stack.removeLast();
        return result;
      case Type.val:
        return tokens[index++].val!;
      case Type.name:
        for (var i = stack.length - 1; i >= 0; i--) {
          if (stack[i].containsKey(tokens[index].name)) {
            return stack[i][tokens[index++].name]!;
          }
        }
        break;
      default:
        assert(false, "Unexpected token type: ${tokens[index].type}");
        return 0;
    }
    assert(false, "did not finish in switch");
    return 0;
  }
}
