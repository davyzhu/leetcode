class Solution {
  int longestValidParentheses(String s) {
    var l = s.split('').map((e) => (e == '(') ? 1 : -1);
    var stack = List<int>.empty(growable: true);
    for (var e in l) {
      if (stack.isEmpty) {
        stack.add(e);
      } else {
        if (e == -1) {
          if (stack.last == 1) {
            // '(' ')'
            stack.removeLast();
            if (stack.isNotEmpty && stack.last >= 2) {
              stack.last += 2;
            } else {
              stack.add(2);
            }
          } else if (stack.length >= 2 &&
              stack[stack.length - 2] == 1 &&
              stack.last >= 2) {
            var temp = stack.removeLast();
            stack.last = temp + 2;
            if (stack.length >= 2 && stack[stack.length - 2] >= 2) {
              var temp2 = stack.removeLast();
              stack.last += temp2;
            }
          } else {
            stack.add(e);
          }
        } else {
          stack.add(e);
        }
      }
    }
    var longest = 0;
    for (var e in stack) {
      if (e != 1 && e != -1 && e > longest) {
        longest = e;
      }
    }
    return longest;
  }
}
