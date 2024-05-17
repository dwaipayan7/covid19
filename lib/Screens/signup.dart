import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email,String password) async{
    try{
        Response response = await post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': email,
            'password': password
          }
        );

        if(response.statusCode == 200){

          var data =
          jsonDecode(response.body.toString());

          print(data['token']);
          
            print('Login successfully');
        }else{
          print("failed");
        }

    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextFormField(
          //   controller: emailController,
          //   decoration: InputDecoration(
          //     hintText: "Email",
          //   ),
          // ),

          Container(
            child: Image.asset('assets/images.png'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
                filled: true,
                fillColor: Colors.grey[200], // Background color
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22), // Rounded corners
                  borderSide: BorderSide.none, // No border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22), // Rounded corners
                  borderSide: BorderSide(color: Colors.blueAccent), // Border color when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2), // Border color when focused
                ),
                prefixIcon: Icon(Icons.email, color: Colors.blueAccent), // Icon at the start
              ),
            ),
          ),

          SizedBox(height: 5,),

          // TextFormField(
          //   controller: passwordController,
          //   decoration: InputDecoration(
          //     hintText: "Password",
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
                filled: true,
                fillColor: Colors.grey[200], // Background color
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22), // Rounded corners
                  borderSide: BorderSide.none, // No border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22), // Rounded corners
                  borderSide: const BorderSide(color: Colors.blueAccent), // Border color when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2), // Border color when focused
                ),
                prefixIcon: Icon(Icons.password, color: Colors.blueAccent), // Icon at the start
              ),
            ),
          ),


          const SizedBox(height: 25,),

          GestureDetector(
            onTap: (){
              login(emailController.text.toString(),
              passwordController.text.toString());
            },
         child:  Padding(
           padding: const EdgeInsets.all(5.0),
           child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.blueAccent
              ),
              child: Center(
                child: Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),

              ),
            ),
         ),
          )

        ],
      ),
    );
  }
}
