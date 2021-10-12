// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_abc/provider/user_data.dart';
import 'package:project_abc/widgets/finalSpin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var amount;
  var _isLoading = true;

  void shared() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      final extractedUserData =
          json.decode(prefs.getString('userData')!) as Map<String, Object>;
      print(extractedUserData);
    }
  }

  void initState() {
    Provider.of<UserData>(context, listen: false)
        .fetchAndSetAmount('Sufyan')
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });

    shared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    amount = Provider.of<UserData>(context).userbalance;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF9408C2),
            Color(0xFF313D8A),
            Color(0xFF15002C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.01,
            0.3,
            0.8,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Current balance: $amount Rs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 400,
                    width: double.infinity,
                    child: Spinner(),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.amber,
          hoverElevation: 30,
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              _isLoading = true;
            });
            Provider.of<UserData>(context, listen: false)
                .sendAmount('Sufyan', 60 + amount)
                .then((_) {
              setState(() {
                _isLoading = false;
              });
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Load Rs',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
