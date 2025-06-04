import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:provider/provider.dart';
import 'package:mobile_servies/user/View/UserRegister/registerwidget.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:mobile_servies/user/View/UserBottom/user_bottom.dart';
import 'package:mobile_servies/user/View/UserRegister/user_register.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(builder: (context, authProvider, child) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final success = authProvider.successMessage;
        if (success.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(success),
              backgroundColor: Colors.green,
            ),
          );
          authProvider.clearMessages();
        }
      });
      return Scaffold(
        body: Stack(
          children: [
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
                          controller: authProvider.loginUserNameController,
                          hint: 'UserName',
                        ),
                        const SizedBox(height: 20),

                        /// Password
                        buildTextField(
                          label: 'Password',
                          controller: authProvider.loginPasswordController,
                          hint: "Password",
                          obscureText: true,
                          isPasswordHidden: authProvider.isPasswordHidden,
                          onTogglePassword:
                              authProvider.togglePasswordVisibility,
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
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [Colors.green,
                          Color.fromARGB(255, 41, 41, 41)],
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  authProvider.setLoading(true);
                                  final result =
                                      await authProvider.loginUser(context);
                                  authProvider.setLoading(false);
                                  if (!context.mounted) return;
                                  if (result == 'success') {
                                    if (authProvider.isAdmin) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  Dashbordpage()));
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => UserBottom()),
                                      );
                                    }
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
                              child: Center(
                                child: authProvider.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
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
                        const SizedBox(height: 20),

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
                                    builder: (_) => const UserRegister(),
                                  ),
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
    });
  }
}
