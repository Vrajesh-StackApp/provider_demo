import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/provider_page.dart';

class Student {
  int? id;
  String? firstname;
  String? lastname;

  Student({this.id, this.firstname, this.lastname});

}


class Employee extends ChangeNotifier{
  List<Student> studentList = [];
  List<Student> emptyStudentList = [];

  List<Student> get studentData {
    return studentList;
  }

  set students(List<Student> newStudents) {
    studentList = newStudents;
    notifyListeners();
  }

  void addStudent(Student student, String from, int index){
    if(from == 'mainList')
      {
        emptyStudentList.add(student);
        studentList.removeAt(index);
      }
    else{
      studentList.add(student);
      emptyStudentList.removeAt(index);
    }
    notifyListeners();
  }



}
