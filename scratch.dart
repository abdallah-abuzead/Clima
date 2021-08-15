import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// String task2() {
//   Duration threeSeconds = Duration(seconds: 3);

//synchronous: sleep awhile, then execute the rest of the code
// sleep(threeSeconds);
/*
  * output:
  * task 1 complete
  * sleep 3 seconds
  * task 2 complete
  * task 3 complete*/

//====================================================

//Asynchronous: sleep awhile in the background, then execute the callback function
// Future.delayed(threeSeconds, () {
//   String result = 'task 2 data';
//   print('Task 2 complete');
// });
/*
  * output:
  * task 1 complete
  * task 3 complete
  * sleep 3 seconds in the background
  * task 2 complete*/

//=====================================================

//Asynchronous: sleep awhile in the background, then execute the callback function
//but we need the result of the function
// String result;
// Future.delayed(threeSeconds, () {
//   result = 'task 2 data';
//   print('Task 2 complete');
// });
// return result;
/* output:
  * task 1 complete
  * task 3 complete with null
  * sleep 3 seconds in the background
  * task 2 complete*/
// }

//Asynchronous with await: sleep awhile in the background, then execute the callback function
//and wait till it ends it's execution and use its result
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

  /* output:
  * task 1 complete
  * sleep 3 seconds in the background
  * task 2 complete
  * task 3 complete with task 2 data
  */
// }
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
