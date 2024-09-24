import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/material.dart';

void main() {
  final apiClient = AhcApiClient.dev(gzipUrls: []);
  final authClient = AuthClient(apiClient);

  runApp(MyApp(authClient));
}

class MyApp extends StatelessWidget {
  final AuthClient authClient;

  const MyApp(this.authClient, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Client Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen(authClient: authClient),
    );
  }
}

class SignupScreen extends StatefulWidget {
  final AuthClient authClient;

  const SignupScreen({required this.authClient, super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String resposneString = '';

  void _signup() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final request = VitalSummaryRequest.fromJson(const {
        "personId": "61bf9a70-eb53-415f-8607-ce4185e87ea4",
        "patientId": "61bf9a70-eb53-415f-8607-ce5085e87ea4"
      });

      final response = await widget.authClient.fetchVitalSummaryData(request);

      log('Signup success: ${response.toJson()}');
      setState(() => resposneString = response.toJson().toString());

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Signup successful!'),
      ));
    } catch (e) {
      log('Signup failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Signup failed.'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _signup,
                    child: const Text('Signup'),
                  ),
            const SizedBox(height: 50),
            Text(resposneString),
          ],
        ),
      ),
    );
  }
}
