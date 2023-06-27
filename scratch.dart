// import 'dart:io';
import 'package:http/http.dart'as http;

/*void main(){
  runtask();
}
void runtask() {
  run1();
  String result2 =  run2().toString();
  run3(result2);
}

void run1(){
  print('task1');
}

Future<String> run2() async{
  Duration duration = const Duration(seconds: 3);
  // sleep(duration);
  String? result;
  await Future.delayed(duration);
    result='task2 data.';
    print('task 2 is complete');
  return result;
}

void run3(String result2) async{
  print('task3 is completed with the $result2 data');
}*/
void main(){
  display();
}
void display() async {
  http.Response  response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
  print(response.body);
}