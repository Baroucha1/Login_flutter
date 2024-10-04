import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/my_button.dart';
import 'package:login_app/components/my_textfield.dart';
import 'package:login_app/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  // sign user in method
  void signUserUp() async{
    // show loading circle
    showDialog(context: context, barrierDismissible: false, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      ) ;
    });
    void _showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
    try {
      if(passwordController.text == passwordConfirmController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      }else{
        _showErrorDialog(context, "password not matching");
      }
      // pop the loading circle
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      _showErrorDialog(context, "Error: ${e.code}");
    } catch (e) {
      Navigator.of(context).pop();
      _showErrorDialog(context, "An unexpected error occurred: $e");

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 30,),
                  // logo
                  const Icon(Icons.lock_outlined, size: 100,),
                  const SizedBox(height: 30,),

                  // welcome back , you've been missed !
                  Text('let\'s create an account for you',
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

                  // password textfield
                  MyTextfield(controller: passwordConfirmController, hintText: 'Confirm Password',obscureText: true,),
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
                  MyButton(onTap: signUserUp , text: "Sign User Up",),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagepath: 'lib/images/google.png')
                    ],),

                  const SizedBox(height: 30,),
                  // not a member ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('already a member?'),
                      const SizedBox(width: 5,),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text('Login  Now',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                    ],
                  )
                ]

            ),
          ),
        ),
      ),
    );
  }


}

