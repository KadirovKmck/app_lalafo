// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:university/src/data/FirebaseData/FirebaseData.dart';
import 'package:university/src/data/data.dart';
import 'package:university/src/presentation/four/page/ProfaelPage.dart';

class Four extends StatefulWidget {
  const Four({Key? key}) : super(key: key);

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerName = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Overview',
              ),
              Tab(text: 'Specifications'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/faesbook.png'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/gooogle.png'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/odnoclassnici.png'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/wk.png'),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: controllerName,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controllerEmail,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controllerPassword,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseData().registerFirebase(controllerName.text,
                                controllerEmail.text, controllerPassword.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilPage(),
                              ),
                            );
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.all(16.0),
                  child: Center(child: Text('Specifications tab')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
