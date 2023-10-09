import 'dart:collection';

class Solution {
  int deleteAndEarn(List<int> nums) {
    final numPointHashMap = HashMap<int, int>();
    for (var n in nums) {
      if (numPointHashMap.containsKey(n)) {
        numPointHashMap[n] = numPointHashMap[n]! + n;
      } else {
        numPointHashMap[n] = n;
      }
    }
    final numPointList = SplayTreeMap.of(numPointHashMap).entries.toList();
    final pointList = List<int>.filled(numPointList.last.key + 1, 0);
    for (var np in numPointList) {
      pointList[np.key] = np.value;
    }
    var r = Robber();
    return r.rob(pointList);
  }
}

class Robber {
  int rob(List<int> nums) {
    final solution = List<int>.filled(nums.length, 0);
    for (var i = 0; i < nums.length; i++) {
      if (i == 0) {
        solution[0] = nums[0];
      } else if (i == 1) {
        solution[1] = _max(nums[1], nums[0]);
      } else if (i == 2) {
        solution[2] = _max(solution[0] + nums[2], nums[1]);
      } else {
        solution[i] =
            _max(solution[i - 2] + nums[i], solution[i - 3] + nums[i - 1]);
      }
    }
    return solution.last;
  }

  int _max(int i, int j) {
    return (i < j) ? j : i;
  }
}
