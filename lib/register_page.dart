import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                keyboardType: TextInputType.name,
                maxLength: 30,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your full name',
                ),
                validator: (fullNameValue) {
                  if (fullNameValue == null || fullNameValue.trim().isEmpty) {
                    return 'Please Enter your Full Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                maxLength: 30,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
                validator: (emailValue) {
                  if (emailValue == null || emailValue.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  final regex = RegExp(_emailRegexPattern);
                  if (!regex.hasMatch(emailValue)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 20,
                obscureText: true,
                //making non visible password
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
                validator: (passwordValue) {
                  if (passwordValue == null || passwordValue.trim().isEmpty) {
                    return 'Please Enter password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                maxLength: 20,
                maxLines: 4,
                //lines or height of box
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your address',
                ),
                validator: (streetAddressValue) {
                  if (streetAddressValue == null ||
                      streetAddressValue.trim().isEmpty) {
                    return 'Please Enter address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print('{$_fullNameController}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
