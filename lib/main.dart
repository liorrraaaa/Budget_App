import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:budget_app_two_point_oh/screens/results_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:budget_app_two_point_oh/Costs.dart';

void main() => runApp(BudgetApp());

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int weeklyBudget = 60,
        diningTotal = 40,
        transportTotal = 20,
        entertainTotal = 20,
        dining = 40,
        transport = 20,
        entertain = 20;

    return new MaterialApp(
      home: ResultsPage(
          value: User(
              weeklyBudget: weeklyBudget,
              diningTotal: diningTotal,
              transportTotal: transportTotal,
              entertainTotal: entertainTotal,
              dining: dining,
              transport: transport,
              entertain: entertain)),
    );
  }
}

//weeklyBudget
Future<bool> saveWeeklyBudgetPref(int weeklyBudget) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("weeklyBudget", weeklyBudget);
  return prefs.commit();
}

Future<int> getWeeklyBudgetPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int weeklyBudget = (prefs.getInt("weeklyBudget") ?? 60);
  return weeklyBudget;
}

//diningTotal
Future<bool> saveDiningTotalPref(int diningTotal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("diningTotal", diningTotal);
  return prefs.commit();
}

Future<int> getDiningTotalPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int diningTotal = (prefs.getInt("diningTotal") ?? 20);
  return diningTotal;
}

//transportTotal
Future<bool> saveTransportTotalPref(int transportTotal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("transportTotal", transportTotal);
  return prefs.commit();
}

Future<int> getTransportTotalPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int transportTotal = (prefs.getInt("transportTotal") ?? 20);
  return transportTotal;
}

//entertainTotal
Future<bool> saveEntertainTotalPref(int entertainTotal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("entertainTotal", entertainTotal);
  return prefs.commit();
}

Future<int> getEntertainTotalPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int entertainTotal = (prefs.getInt("entertainTotal") ?? 20);
  return entertainTotal;
}

//dining
Future<bool> saveDiningPref(int dining) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("dining", dining);
  return prefs.commit();
}

Future<int> getDiningPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int dining = (prefs.getInt("dining") ?? 20);
  return dining;
}

//transport
Future<bool> saveTransportPref(int transport) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("transport", transport);
  return prefs.commit();
}

Future<int> getTransportPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int transport = (prefs.getInt("transport") ?? 20);
  return transport;
}

//entertain
Future<bool> saveEntertainPref(int entertain) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("entertain", entertain);
  return prefs.commit();
}

Future<int> getEntertainPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int entertain = (prefs.getInt("entertain") ?? 20);
  return entertain;
}
