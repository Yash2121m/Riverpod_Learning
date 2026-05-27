void main(){
  Person person = Person(name: "Yash Patil", age: 21);

  print(person.name);
  print(person.age);

  person = person.copyWith(name: "Ajit");
  print(person.name);
  print(person.age);
}

class Person{
  final String name;
  final int age;

  Person({required this.name, required this.age});

  Person copyWith({String? name, int? age}){
    return Person(name: name ?? this.name , age: age ?? this.age);
  }
}