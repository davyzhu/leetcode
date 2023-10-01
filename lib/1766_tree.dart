const maxNum = 50; // 1 <= num <= 50

class Solution {
  List<int>? coprimeAncestors;
  final List<List<int>> adjNodes = [];
  List<int>? nums;
  int timer = 0;
  List<int>? visitTime;
  final List<List<int>> coprime = [];
  List<int> mainStack = [];
  final List<List<int>> fiftyStack = [];

  List<int> getCoprimes(final List<int> nums, final List<List<int>> edges) {
    coprimeAncestors = List<int>.filled(nums.length, -1);
    this.nums = nums;
    visitTime = List<int>.filled(nums.length, -1);
    for (var i = 0; i < nums.length; i++) {
      adjNodes.add(List<int>.empty(growable: true));
    }
    for (var i = 0; i < maxNum; i++) {
      fiftyStack.add(List<int>.empty(growable: true));
    }
    for (final e in edges) {
      adjNodes[e[0]].add(e[1]);
      adjNodes[e[1]].add(e[0]);
    }
    for (var i = 1; i <= maxNum; i++) {
      coprime.add(List<int>.empty(growable: true));
      for (var j = 1; j <= maxNum; j++) {
        if (i.gcd(j) == 1) {
          coprime[i - 1].add(j - 1);
        }
      }
    }

    // dfs(0);
    dfs2();
    return coprimeAncestors!;
  }

  void dfs(final int node, [int layer = 0]) {
    // print('layer: $layer');
    /// node on the top of coprime stack with the largest timer is the nearest coprime ancestor
    if (node != 0) {
      var latestTime = -1;
      for (var p in coprime[nums![node] - 1]) {
        if (fiftyStack[p].isNotEmpty) {
          var n = fiftyStack[p].last;
          if (visitTime![n] > latestTime) {
            coprimeAncestors![node] = n;
            latestTime = visitTime![n];
          }
        }
      }
    }

    visitTime![node] = timer++;
    fiftyStack[nums![node] - 1].add(node);
    for (var adjNode in adjNodes[node]) {
      if (visitTime![adjNode] == -1) {
        dfs(adjNode, layer + 1);
      }
    }
    var n = fiftyStack[nums![node] - 1].removeLast();
    assert(n == node);
  }

  void dfs2PushStack(int n) {
    mainStack.add(n);
    fiftyStack[nums![n] - 1].add(n);
  }

  void dfs2PopStack(int n) {
    var i = mainStack.removeLast();
    var j = fiftyStack[nums![n] - 1].removeLast();
    assert(i == n && j == n);
  }

  void dfs2() {
    /// dfs without recursion to avoid stack overflow
    var visitCounter = 0;
    dfs2PushStack(0);

    while (visitCounter != nums!.length - 1) {
      assert(mainStack.isNotEmpty);
      // get node on the top of stack
      var node = mainStack.last;
      assert(node == fiftyStack[nums![node] - 1].last);
      // if this node is not visited, visit it, and calculate nearest coprime ancestor
      if (node != 0 && visitTime![node] == -1) {
        visitCounter++;
        visitTime![node] = ++timer;

        var latestTime = -2;
        var temp = fiftyStack[nums![node] - 1].removeLast();

        for (var p in coprime[nums![node] - 1]) {
          if (fiftyStack[p].isNotEmpty) {
            var n = fiftyStack[p].last;
            if (visitTime![n] > latestTime) {
              coprimeAncestors![node] = n;
              latestTime = visitTime![n];
            }
          }
        }
        fiftyStack[nums![node] - 1].add(temp);
      }
      // if this node has a unvisited child, push this child onto mainStack and fiftyStack
      // else (don't have any unvisited child), remove node from mainStack and fiftyStack
      var hasUnvisitedChild = false;
      for (var adjNode in adjNodes[node]) {
        if (visitTime![adjNode] == -1 && adjNode != 0) {
          dfs2PushStack(adjNode);
          hasUnvisitedChild = true;
          break;
        }
      }
      if (!hasUnvisitedChild) {
        dfs2PopStack(node);
      }
    }
  }
}
