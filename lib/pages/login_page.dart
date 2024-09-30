import 'package:flutter/material.dart';
import 'package:login_app/components/my_button.dart';
import 'package:login_app/components/my_textfield.dart';
import 'package:login_app/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 50,),
              // logo
              const Icon(Icons.lock_outlined, size: 100,),
              const SizedBox(height: 50,),

              // welcome back , you've been missed !
              Text('Weclome back you\'ve been missed!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
              ),
              const SizedBox(height: 50,),

              // username textfield
              MyTextfield(controller: usernameController,hintText: 'Username',obscureText: false,),

              const SizedBox(height: 25,),
              // password textfield
              MyTextfield(controller: passwordController, hintText: 'Password',obscureText: true,),
              const SizedBox(height: 25,),
              // forgot password ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password ?',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                   ),]
                ),
              ),

              const SizedBox(height: 25,),

              // sign in button
              MyButton(onTap: signUserIn,),
              // or continue with
              const SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child:
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or continue with', style: TextStyle(color: Colors.grey[700]),)),
                    Expanded(
                        child:
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                    ),]
                ),
              ),

              const SizedBox(height: 25,),

              // google sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SquareTile(imagepath: 'lib/images/google.png')
              ],),

              const SizedBox(height: 30,),
              // not a member ? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  const SizedBox(width: 5,),
                  Text('Register Now',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                ],
              )
              ]

          ),
        ),
      ),
    );
  }
}

