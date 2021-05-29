import 'dart:async';

Stream<int> iterateSumUsingStream(int num) async* {
  int sum = 0;
  for (int i = 1; i <= num; i++) {
    sum = sum + i;
    yield sum;
  }
}

void main() {
  var stream = iterateSumUsingStream(10);
  stream.listen(
    (data) {
      print('Data: $data');
    },
    onError: (err) {
      print('Error: ${err}');
    },
    cancelOnError: false,
    onDone: () {
      print('Done!');
    },
  );
}
