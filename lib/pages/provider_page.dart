import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/data/model/student.dart';
import 'package:provider_demo/utils/app_string.dart';
import 'package:provider_demo/widget/listtile_widget.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  ProviderPageState createState() => ProviderPageState();
}

class ProviderPageState extends State<ProviderPage> {
  void _getStudentDetails() {
    Employee employee = Provider.of(context, listen: false);
    print(employee.emptyStudentList);
    if (employee.emptyStudentList.isEmpty) {
      employee.studentList = data;
    }
  }

  // List<Student> studentList = [];
  // List<Student> emptyStudentList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getStudentDetails();
    return WillPopScope(
      onWillPop: () => _back(),
      child: SafeArea(
          child: Scaffold(
        appBar: _appBar(),
        body: _providerBody(),
      )),
    );
  }

  _back() {
    Modular.to.navigate(AppString.homePage);
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.changeProvideAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => _back(),
        ),
      );

  Widget _providerBody() => Column(
        children: [
          Expanded(
            child: Consumer<Employee>(
              builder: (context, model, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTileWidget(
                      index: index,
                      id: model.studentData[index].id,
                      firstName: model.studentData[index].firstname,
                      lastName: model.studentData[index].lastname,
                      model: model.studentData[index],
                      from: 'mainList',
                      consumerModel: model,
                      onTap: onTap,
                    );
                  },
                  primary: false,
                  itemCount: model.studentData.length,
                );
              },
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 2.5,
            color: Colors.blue,
          ),
          Expanded(
            child: Consumer<Employee>(
              builder: (context, model, child) {
                return model.emptyStudentList.isEmpty
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTileWidget(
                            index: index,
                            id: model.emptyStudentList[index].id,
                            firstName: model.emptyStudentList[index].firstname,
                            lastName: model.emptyStudentList[index].lastname,
                            model: model.emptyStudentList[index],
                            from: 'emptyList',
                            consumerModel: model,
                            onTap: onTap,
                          );
                        },
                        primary: false,
                        itemCount: model.emptyStudentList.length,
                      );
              },
            ),
          ),
        ],
      );

  List<Student> data = [
    Student(id: 1, firstname: 'Vrajesh', lastname: 'Kanjariya'),
    Student(id: 2, firstname: 'Ketan', lastname: 'Kanjariya'),
    Student(id: 3, firstname: 'Ashok', lastname: 'Sisara'),
    Student(id: 4, firstname: 'Chintan', lastname: 'Gajera'),
    Student(id: 5, firstname: 'Sagar', lastname: 'Anghan')
  ];

  // _getStudentData() {
  //   studentList
  //       .add(Student(id: 1, firstname: 'Vrajesh', lastname: 'Kanjariya'));
  //   studentList.add(Student(id: 2, firstname: 'Ketan', lastname: 'Kanjariya'));
  //   studentList.add(Student(id: 3, firstname: 'Ashok', lastname: 'Sisara'));
  //   studentList.add(Student(id: 4, firstname: 'Chintan', lastname: 'Gajera'));
  //   studentList.add(Student(id: 5, firstname: 'Sagar', lastname: 'Anghan'));
  // }

  /*Function? onTap(int index, Student student, String from) {
    print("From ===> $from");
    if (from == "mainList") {
      emptyStudentList.add(student);
      studentList.removeAt(index);
    } else {
      studentList.add(student);
      emptyStudentList.removeAt(index);
    }
    setState(() {});
  }*/

  Function? onTap(int index, Student student, String from, Employee employee) {
    employee.addStudent(student, from, index);
  }
}
