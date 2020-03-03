void main() {  
  no1();
  print('---------------------');
  no2();
  print('---------------------');
  no3();
  print('---------------------');
  no4();
  print('---------------------');
  no5();
  print('---------------------');
  no6();
  print('---------------------');
  no7();
  print('---------------------');
  no8();
  print('---------------------');
}

void no1(){ 
  String int2Text(int x , int y){
    var data;
    return data = '$x $y';
  }
  print(int2Text(2,3));
}

void no2(){
  
}

void no3(){
  var iterable = ['salad' , 'popcorn' , 'toast'];
  for (var element in iterable){
//     print(element);
  }
//   print(iterable[0]);
//   print(iterable[iterable.length-1]);
  
  print(iterable.first);
  print(iterable.last);
}

void no4(){
  int a = 10;
  int b = int.parse('10');
  print('a b = a + b ');
  print('$a + $b = ${a+b}');
  String c = a.toString();
  print(c);
}

void no5(){
  String a = 'Hello' + 'World';
  String b = 'Hello''World';
  String c = '''
      Hello
      World
    ''';
  print(b);
}

void no6(){
  List data = [1,2,3,4];
  List list = ['One','Two','Three'];
  print(list[0]);
  print(data.elementAt(0));
}

void no7(){
  Map data = {
    'code':'007'
  };
  print(data['test']);
  Map key = Map();
  key['code'] = '008';
  print(key['test']);
}

void no8(){
  const prefix = 'Hello';
  Data d = Data('value1');
  print('$prefix${d.value}');
}

class Data{
  final value;
  Data(this.value);
}