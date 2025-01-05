import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'admin_dashboard.dart';



class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({Key? key}) : super(key: key);
  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final TextEditingController _departmentNameController = TextEditingController();
  final TextEditingController _departmentCodeController = TextEditingController();
  final TextEditingController _reportingHeadController = TextEditingController();

  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _joiningDateController = TextEditingController();

  String? _selectedDepartment;
  String? _selectedRole;

  final List<String> departments = [
    'HR',
    'Web Development',
    'Flutter Development',
    'Marketing'];
  final List<String> roles = [
    'Manager',
    'Developer',
    'Designer',
    'Marketer'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _joiningDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text('Add'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Add Department'),
              Tab(text: 'Add Employee'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _departmentNameController,
                    decoration:  InputDecoration(
                      labelText: 'Department name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                   SizedBox(height: 16),
                  TextField(
                    controller: _departmentCodeController,
                    decoration:  InputDecoration(
                      labelText: 'Department code',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                   SizedBox(height: 16),
                  TextField(
                    controller: _reportingHeadController,
                    decoration:  InputDecoration(
                      labelText: 'Reporting head',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                   Spacer(),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF007BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 58),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _employeeNameController,
                      decoration:  InputDecoration(
                        labelText: 'Employee name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    TextField(
                      controller: _employeeIdController,
                      decoration:  InputDecoration(
                        labelText: 'Employee ID',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    TextField(
                      controller: _phoneController,
                      decoration:  InputDecoration(
                        labelText: 'Phone number',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    TextField(
                      controller: _addressController,
                      decoration:  InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedDepartment,
                      items: departments.map((department) {
                        return DropdownMenuItem(
                          value: department,
                          child: Text(department),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDepartment = value;
                        });
                      },
                      decoration:  InputDecoration(
                        labelText: 'Department',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      items: roles.map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                      decoration:  InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                     SizedBox(height: 16),
                    TextField(
                      controller: _joiningDateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration:  InputDecoration(
                        labelText: 'Joining date',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                     SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF007BFF), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(double.infinity, 58), // Button height
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}