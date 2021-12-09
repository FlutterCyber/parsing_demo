import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:network_get_post_put_del/models/emp_model.dart';
import 'package:network_get_post_put_del/models/emplist_model.dart';
import 'package:network_get_post_put_del/models/empone_model.dart';
import 'package:network_get_post_put_del/models/post_model.dart';
import 'package:network_get_post_put_del/pages/detail_page.dart';
import 'package:network_get_post_put_del/services/http_service.dart';


class HomePage extends StatefulWidget {
  static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  String id = "";
  List<Employee> items = [];

// employeelarni listini chiqaarish un
  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

// bitta employeeni chiqarish un
  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    if (response != null) {
      //Employee id = Network.parseEmpOne()
      Emplist emplist = Network.parseList(response);
      setState(() {
        items = emplist.data;

      });
    } else {
      print("Try again");
    }

    // //print("Ismi: ${emplist.data.length}");
    // EmpOne empOne = Network.parseEmpOne(response);
    // print("ISMI: ${empOne.data.employee_name}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee list"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          }),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, DetailPage.id);

      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              emp.id.toString()+"  " +emp.employee_name +  "(" + emp.employee_age.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
