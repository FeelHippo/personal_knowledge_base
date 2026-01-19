// https://www.spiceworks.com/tech/devops/articles/what-is-dynamic-programming/
void main() {
  // Count number of ways to cover a distance
  // Given a distance 'dist', count total number of ways to cover the distance with 1, 2 and 3 steps.
  // Before making a recursive call, we first check if the result for the current distance has already been computed and stored in the memo[] array. 
  // If it has, we directly return the stored result, avoiding the recursive call.
  // This significantly reduces the number of recursive calls and improves the performance of the algorithm, especially for larger distances.
  // Once the result for the current distance is computed, we store it in the memo[] array for future reference.


  // Function to calculate the count of ways with memoization
  print(countWays(3));
  print(countWays(12));


  // Given a string, return the number of ways to split it into two parts,
  // such that at least one of the parts has an equal number of 'x's and 'y's
  // https://brainly.com/question/48085400
  print(countWaysString('ayxbx'));
}

int countWaysString(String s) {
  return recursiveStringCounter(s, 0, s.length - 1);
}

int recursiveStringCounter(String s, int result, int pointer) {
  if (pointer == 0) return result;
  final String left = s.substring(0, pointer);
  final String right = s.substring(pointer, s.length);
  if (containsChar(left) && containsChar(right)) result++;

  return recursiveStringCounter(s, result, pointer - 1);
} 


bool containsChar(String substring) {
  return substring.contains('x')
    || substring.contains('X')
    || substring.contains('y')
    || substring.contains('Y');
} 

// MEMOIZATION
int countWays(int dist) {
  // Initialize memoization array with -1 to indicate not computed yet
  List<int> memoization = List.generate(dist + 1, (int i) => -1);
  return recursiveCounter(memoization, dist);
}

int recursiveCounter(List<int> memoization, int dist) {
  // short circuits
  if (dist < 0) return 0;
  if (dist == 0) return 1; // return 1 as it is the starting position

  // Check if the value for 'dist' is already computed
  // if so, avoid computation and return memoized value
  if (memoization[dist] != -1) {
    return memoization[dist];
  }
  // Recur for all previous 3 and add the results
  // this way, we compute all distances lower than "dist":
  // e.g dist == 10 => 9 + 1 steps + 8 + 2 steps + 7 + 3 steps == "n"

  int ways =
    recursiveCounter(memoization, dist - 1)
    + recursiveCounter(memoization, dist - 2)
    + recursiveCounter(memoization, dist - 3);

  // Afterwards, the result is memoized:
  // memoization[10] == "n"
  memoization[dist] = ways;

  print('memoization[$dist] => $ways');
  return ways;
}