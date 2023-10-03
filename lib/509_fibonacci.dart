class Solution {
  int fib(int n) {
    var memory = List.filled(31, 0);
    memory[1] = 1;
    if (n > 1) {
      for (var i = 2; i <= n; i++) {
        memory[i] = memory[i - 1] + memory[i-2];
      }
    }
    return memory[n];
  }
}