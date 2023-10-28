class Solution {
  String pushDominoes(String dominoes) {
    var lastPush = 'L';
    var lastPushIndex = -1;
    final pushs = dominoes.split('');
    for (var i = 0; i < pushs.length; i++) {
      if (pushs[i] == 'L') {
        if (lastPush == 'L') {
          // 'L'..'L'
          // change all left '.' to 'L'
          for (var j = lastPushIndex + 1; j < i; j++) {
            pushs[j] = 'L';
          }
        } else if (lastPush == 'R') {
          // 'R'..'L'
          // meet in the middle
          final span = i - lastPushIndex;
          if (span.isEven) {
            final middle = lastPushIndex + (span >> 1);
            for (var j = lastPushIndex + 1; j < middle; j++) {
              pushs[j] = 'R';
            }
            for (var j = middle + 1; j < i; j++) {
              pushs[j] = 'L';
            }
          } else {
            // span is odd
            if (span >= 3) {
              final middleRight = lastPushIndex + ((span + 1) >> 1);
              for (var j = lastPushIndex + 1; j < middleRight; j++) {
                pushs[j] = 'R';
              }
              for (var j = middleRight; j < i; j++) {
                pushs[j] = 'L';
              }
            }
          }
        } else {
          assert(false);
        }
        lastPush = pushs[i];
        lastPushIndex = i;
      } else if (pushs[i] == 'R') {
        if (lastPush == 'L') {
          // 'L'..'R'
          // do nothing
        } else if (lastPush == 'R') {
          // 'R'..'R'
          // change all left '.' to 'R'
          for (var j = lastPushIndex + 1; j < i; j++) {
            pushs[j] = 'R';
          }
        } else {
          assert(false);
        }
        lastPush = pushs[i];
        lastPushIndex = i;
      }
    }
    if (lastPush == 'R' && pushs.length > lastPushIndex + 1) {
      for (var i = lastPushIndex + 1; i < pushs.length; i++) {
        pushs[i] = 'R';
      }
    }

    return pushs.join('');
  }
}
