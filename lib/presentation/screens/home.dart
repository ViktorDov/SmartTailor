import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Tailor'),
        centerTitle: true,
      ),
      body: Center(
        child: const HomeButtonFormWidget(),
      ),
    );
  }
}

class HomeButtonFormWidget extends StatelessWidget {
  const HomeButtonFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Login'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
