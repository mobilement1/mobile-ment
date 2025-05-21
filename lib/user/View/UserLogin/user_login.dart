import 'package:flutter/material.dart';
import 'package:mobile_servies/user/View/UserRegister/registerwidget.dart';
import 'package:provider/provider.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:mobile_servies/user/View/UserBottom/user_bottom.dart';
import 'package:mobile_servies/user/View/UserRegister/user_register.dart';
import 'package:mobile_servies/user/View/UserRegister/validationrgister.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserAuthProvider>(context);

    return Scaffold(
      
      body: Stack(
        children: [
          // Hello Sign In Text
          const Positioned(
            left: 50,
            top: 100,
            child: Text(
              'Hello\nSign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),

          // Bottom Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),

                      /// Username
                     buildTextField(
                            label: 'UserName',
                            controller: authProvider.userNameController,
                            hint: 'UserName',
                            validator: (val) => SimpleValidator.validateUsername(val ?? ''),
                          ),
                      const SizedBox(height: 20),

                      /// Password
                      buildTextField(
                            label: 'Password',
                            controller: authProvider.passwordController,
                            obscureText: true,
                            validator: (val) => SimpleValidator.validatePassword(val ?? ''),
                            isPasswordHidden: authProvider.isPasswordHidden,
                          onTogglePassword: authProvider.togglePasswordVisibility,
                          ),
                      const SizedBox(height: 20),

                      /// Error Message
                      if (authProvider.errorMessage.isNotEmpty)
                        Text(
                          authProvider.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),

                      const SizedBox(height: 20),

                      /// Sign In Button
                      authProvider.isLoading
                          ?  CircularProgressIndicator()
                          : Container(
                              width: double.infinity,
                              height: 50,
                              decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF2980B9), Color(0xFF2C3E50)],
          ),
        ), child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () async {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState?.validate() ?? false) {
                authProvider.setLoading(true);
                final result = await authProvider.loginUser(context);
                authProvider.setLoading(false);

                if (result == 'success') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const UserBottom()),
                  );
                                    } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
                        child: const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
        

                      /// Navigate to Register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              authProvider.clearAllFields();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UserRegister()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
