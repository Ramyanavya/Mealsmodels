import 'package:flutter/material.dart';


class AttendanceScreen extends StatefulWidget {
   AttendanceScreen({super.key, required this.departmentName});
  final String departmentName;
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.departmentName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.blue,
          tabs:  [
            Tab(text: 'Present'),
            Tab(text: 'Absent'),
            Tab(text: 'Requests'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          PresentTab(),
          AbsentTab(),
          RequestsTab(),
        ],
      ),

    );
  }
}

class PresentTab extends StatelessWidget {
  const PresentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user_placeholder.png'),
            ),
            title: const Text('Arun Kumar'),
            subtitle: const Text('Emp ID: 001234'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('10:00 AM'),
                Icon(Icons.arrow_forward),
                Text('10:00 PM'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AbsentTab extends StatelessWidget {
  const AbsentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user_placeholder.png'),
            ),
            title: const Text('Kiran Kumar'),
            subtitle: const Text('Emp ID: 001234'),
          ),
        );
      },
    );
  }
}

class RequestsTab extends StatelessWidget {
  const RequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Userinfo()));
        },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/user_placeholder.png'),
                    ),
                    title: Text('Kiran Kumar'),
                    subtitle: Text('Emp ID: 001234'),
                    trailing: Text('Attendance: 75%'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Leave Request: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('From: 12 Oct 2024 To: 14 Oct 2024'),
                      Text('3 days'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Deny'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                          onPressed: () {},
                          child: const Text('Approve'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



class Userinfo extends StatelessWidget {
  const Userinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/user_placeholder.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Kiran Kumar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Emp ID: 001234', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Attendance: 75%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Remaining Leaves: 4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
               SizedBox(height: 16),
               Divider(),
               SizedBox(height: 16),
               Row(
                 children: [
                   Text('Department', style: TextStyle(fontSize: 16,color: Colors.grey)),
                   Text(': Design',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                 ],
               ),
               Row(
                 children: [
                   Text('Role', style: TextStyle(fontSize: 16,color: Colors.grey)),
                   Text("    : UX Designer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                 ],
               ),
               SizedBox(height: 16),
               Text('From: 12 Oct 2024 To: 14 Oct 2024', style: TextStyle(fontSize: 16)),
               Text('3 days', style: TextStyle(fontSize: 16)),
               SizedBox(height: 16),
               Divider(),
               SizedBox(height: 16),
               Text('Total Attendance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
               SizedBox(height: 8),
              Row(
                children:  [
                  AttendanceCard(month: 'Aug', percentage: '80%'),
                  AttendanceCard(month: 'Sep', percentage: '82%'),
                  AttendanceCard(month: 'Oct', percentage: '75%'),
                ],
              ),
               SizedBox(height: 16),
               Divider(),
               SizedBox(height: 16),
               Text(
                'Leave Request',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child:  Text('Deny',style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {},
                      child: const Text('Approve',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final String month;
  final String percentage;

  const AttendanceCard({required this.month, required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        width: 100,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Text(month, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(percentage, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
