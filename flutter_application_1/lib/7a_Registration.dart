
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _formKey = GlobalKey<FormState>();

  // ScaffoldMessenger key to show SnackBars
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Fix for "No ScaffoldMessenger widget found"
      scaffoldMessengerKey: _scaffoldMessengerKey,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Application'),
        ),

        body: Form(
          key: _formKey,

          child: ListView(
            padding: const EdgeInsets.all(8),

            children: <Widget>[
              // Image
              Center(
                child: Image.asset(
                  'assets/baymax-wave.jpg',
                  width: 100,
                  height: 100,

                  // Prevent the app from crashing if the asset is missing
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 100,
                    );
                  },
                ),
              ),

              // First Name
              CustomTextField(
                controller: _firstNameController,
                label: 'First Name',

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter first name';
                  }

                  if (value.trim().length < 2) {
                    return 'First name must be at least 2 characters';
                  }

                  return null;
                },
              ),

              // Last Name
              CustomTextField(
                controller: _lastNameController,
                label: 'Last Name',

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter last name';
                  }

                  if (value.trim().length < 2) {
                    return 'Last name must be at least 2 characters';
                  }

                  return null;
                },
              ),

              // Email
              CustomTextField(
                controller: _emailController,
                label: 'Email',

                suffixText: '@mlritm.ac.in',

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final email = value.trim();

                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(email)) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              // Phone Number
              CustomTextField(
                controller: _phoneController,
                prefixText: '+91 ',
                label: 'Phone Number',
                keyboardType: TextInputType.phone,
                maxLength: 10,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter phone number';
                  }

                  if (!RegExp(
                    r'^[0-9]{10}$',
                  ).hasMatch(value.trim())) {
                    return 'Phone number must contain 10 digits';
                  }

                  return null;
                },

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),

              const Divider(
                indent: 8,
                endIndent: 8,
              ),

              // Username
              CustomTextField(
                controller: _usernameController,
                label: 'Username',

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter username';
                  }

                  if (value.trim().length < 4) {
                    return 'Username must be at least 4 characters';
                  }

                  return null;
                },
              ),

              // Password
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }

                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }

                  return null;
                },
              ),

              // Confirm Password
              CustomTextField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                obscureText: true,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm password';
                  }

                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _scaffoldMessengerKey.currentState?.showSnackBar(
                      const SnackBar(
                        content: Text('Registration successful'),
                      ),
                    );
                  }
                },

                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// Custom Text Field
class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String? prefixText;
  final String? suffixText;

  final int? maxLength;

  final TextEditingController? controller;

  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,

    required this.label,

    this.controller,
    this.keyboardType,

    this.suffixText,
    this.prefixText,

    this.maxLength,

    this.obscureText = false,

    this.validator,

    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),

      child: TextFormField(
        controller: controller,

        keyboardType: keyboardType,

        obscureText: obscureText,

        validator: validator,

        inputFormatters:
            inputFormatters ??
            (maxLength != null
                ? [
                    LengthLimitingTextInputFormatter(maxLength!),
                  ]
                : null),

        decoration: InputDecoration(
          border: const OutlineInputBorder(),

          labelText: label,

          suffixText: suffixText,

          prefixText: prefixText,
        ),
      ),
    );
  }
}
