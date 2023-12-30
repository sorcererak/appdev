import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MaterialDesign(),
      initialRoute: '/',
      routes: {
        '/':(context) => MaterialDesign(),
        '/first': (context) => const firstRoute(),
      },
    );
  }
}

class MaterialDesign extends StatefulWidget {
  @override
  _MaterialDesignState createState() => _MaterialDesignState();
  
}

class _MaterialDesignState extends State<MaterialDesign> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
        ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        backgroundColor: Colors.blue,
        title: Text('My App Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 16.0),


              AppBar(
                title: Text('Input User Details'),
                backgroundColor: Colors.lightBlue[100],
            ),


            SizedBox(height: 16.0),


            Card(
              child: Container(
                color: Color.fromARGB(255, 243, 33, 226),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                    children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Input Name:',
                        labelStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Input Email:',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: rollNoController,
                      decoration: InputDecoration(
                        labelText: 'Input Roll No:',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Input Phone Number:',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),

          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              child: Text('Show Details'),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/first',
                    arguments: {
                      'name': nameController.text,
                      'email': emailController.text,
                      'rollNo': rollNoController.text,
                      'phoneNumber': phoneNumberController.text,
                    },
                  );
              },
            ),
          )
            
           

          ],
        ),
      ),
    );
  }
}

class firstRoute extends StatelessWidget {
  const firstRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final Map<String, String> userDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Are'),
        backgroundColor: Color.fromARGB(255, 76, 175, 87),
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 16.0,),

            Card(
              child:Container(
                color: Color.fromARGB(255, 243, 33, 226),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHE4vcD6O1-GAxEU2CDLEQlD140pQI94q5qA&usqp=CAU')
                        ),
                      ),
                      Text(
                        'Name: ${userDetails['name']}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),

                      SizedBox(height: 16.0,),  

                      Text(
                        'Email: ${userDetails['email']}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        ),

                      SizedBox(height: 16.0,),

                      Text(
                        'Roll No: ${userDetails['rollNo']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),

                      SizedBox(height: 16.0,),

                      Text(
                        'Phone Number: ${userDetails['phoneNumber']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 16.0,),

                    ]
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Center(
                        child: ElevatedButton(
                                child: const Text('Go back'),
                                onPressed: () {
                                  Navigator.pop(context);
                                   showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                      title: Text('Dialog Title'),
                                      content: Text('User {${userDetails['name']}} Logged out'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                          Navigator.pop(context);
                                          },
                                        child: Text('Close'),
                                        )
                                      ]
                                      );
                                    }
                                   );
                                },
                              ),
                      )
                  ],
                ),
              ),
            );
  }
}
