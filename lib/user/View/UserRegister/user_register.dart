import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/View/UserRegister/registerwidget.dart';
import 'package:mobile_servies/user/View/UserRegister/validationrgister.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 40,
            top: 60,
            child: text(
              TextConstants.create,
              Colors.white,
              30,
              FontWeight.bold,
            ),
          ),
          Positioned(
            left: 40,
            top: 100,
            child: text(
              TextConstants.yrac,
              Colors.white,
              30,
              FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Consumer<UserAuthProvider>(
                  builder: (context, authProvider, child) {
                    final password = authProvider.passwordController.text;

                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Gap(30),
                          buildTextField(
                            label: 'Name',
                            controller: authProvider.nameController,
                            hint: 'Name',
                            validator: (val) =>
                                SimpleValidator.validateName(val ?? ''),
                          ),
                          const Gap(10),
                          buildTextField(
                            label: 'UserName',
                            controller: authProvider.userNameController,
                            hint: 'UserName',
                            validator: (val) =>
                                SimpleValidator.validateUsername(val ?? ''),
                          ),
                          const Gap(10),
                          buildTextField(
                            label: 'Phone',
                            controller: authProvider.phoneController,
                            hint: 'Phone',
                            validator: (val) =>
                                SimpleValidator.validatePhone(val ?? ''),
                          ),
                          const Gap(10),
                          buildTextField(
                            label: 'Email',
                            controller: authProvider.emailController,
                            hint: 'Email',
                            validator: (val) =>
                                SimpleValidator.validateEmail(val ?? ''),
                          ),
                          const Gap(10),
                          buildTextField(
                            label: 'Password',
                            controller: authProvider.passwordController,
                            obscureText: true,
                            validator: (val) =>
                                SimpleValidator.validatePassword(val ?? ''),
                            isPasswordHidden: authProvider.isPasswordHidden,
                            onTogglePassword:
                                authProvider.togglePasswordVisibility,
                          ),
                          const Gap(10),
                          buildTextField(
                            label: 'Confirm Password',
                            controller: authProvider.confirmPasswordController,
                            obscureText: true,
                            validator: (val) =>
                                SimpleValidator.validateConfirmPassword(
                              password,
                              val ?? '',
                            ),
                            isPasswordHidden:
                                authProvider.isConfirmPasswordHidden,
                            onTogglePassword:
                                authProvider.toggleConfirmPasswordVisibility,
                          ),
                          const Gap(10),
                          if (authProvider.errorMessage.isNotEmpty)
                            Text(
                              authProvider.errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          const Gap(10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.green,
                          Color.fromARGB(255, 41, 41, 41)
                                ],
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    final response = await authProvider
                                        .registerUser(context);
                                    if (response == 'success') {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserLogin(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(response),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please fix the errors in red before submitting.'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: Center(
                                  child: authProvider.isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : text(
                                          TextConstants.sighup,
                                          Colors.white,
                                          18,
                                          FontWeight.bold,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(
                                TextConstants.alreadysign,
                                Colors.black,
                                15,
                                FontWeight.normal,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserLogin(),
                                    ),
                                  );
                                },
                                child: text(
                                  TextConstants.sin,
                                  Colors.blue,
                                  18,
                                  FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
