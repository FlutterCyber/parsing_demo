import 'package:flutter/material.dart';
import 'package:network_get_post_put_del/models/emp_model.dart';
import 'package:network_get_post_put_del/models/empone_model.dart';
import 'package:network_get_post_put_del/pages/home_page.dart';
import 'package:network_get_post_put_del/services/http_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String information1 = "";
  String information2 = "";
  String information3 = "";
  String information4 = "";

  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showresponse(response!),
            });
  }

  void _showresponse(String response) {
    EmpOne empOne = Network.parseEmpOne(response);
    print(empOne.data.employee_salary);
    information1 = empOne.data.employee_name.toString();
    information2 = empOne.data.employee_age.toString();
    information3 = empOne.data.employee_salary.toString();
    information4 = empOne.data.id.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Text(
                "name= $information1 \nage= $information2 \nsalary= $information3\nid=  $information4  ",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Text("previous page"),
            ),
          ],
        ),
      ),
    );
  }
}
