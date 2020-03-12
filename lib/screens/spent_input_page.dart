import 'package:flutter/material.dart';
import 'package:budget_app_two_point_oh/constants.dart';
import 'package:budget_app_two_point_oh/components/reusable_card.dart';
import 'package:budget_app_two_point_oh/components/bottom_button.dart';
import 'package:budget_app_two_point_oh/Costs.dart';
import 'package:budget_app_two_point_oh/screens/results_page.dart';
import 'package:budget_app_two_point_oh/main.dart';

class SpentPage extends StatefulWidget {
  final User value;

  SpentPage({Key key, this.value}) : super(key: key);

  @override
  _SpentPageState createState() => _SpentPageState();
}

class _SpentPageState extends State<SpentPage> {
  TextEditingController userInputWeeklyBudget = TextEditingController();
  int _value = 0;
  int weeklyBudget = 0;
  int dining = 0;
  int transport = 0;
  int entertain = 0;
  String selectedCategory = 'Dining';
  int selectedValue = 0;

  @override
  void initState() {
    getWeeklyBudgetPref().then(updateWeeklyBudget);
    getDiningPref().then(updateDining);
    getTransportPref().then(updateTransport);
    getEntertainPref().then(updateEntertain);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // SafeArea(child: MyThreeOptions()),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    children: <Widget>[
                      ChoiceChip(
                        pressElevation: 5.0,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey[100],
                        label: Text("Dining",
                            style: TextStyle(color: Colors.black)),
                        selected: _value == 0,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? 0 : null;
                            selectedCategory = 'Dining';
                            selectedValue = dining;
                          });
                        },
                      ),
                      ChoiceChip(
                        pressElevation: 0.0,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey[100],
                        label: Text("Transport",
                            style: TextStyle(color: Colors.black)),
                        selected: _value == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? 1 : null;
                            selectedCategory = 'Transport';
                            selectedValue = transport;
                          });
                        },
                      ),
                      ChoiceChip(
                        pressElevation: 0.0,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey[100],
                        label: Text("Entertainment",
                            style: TextStyle(color: Colors.black)),
                        selected: _value == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? 2 : null;
                            selectedCategory = 'Entertain';
                            selectedValue = entertain;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('Enter Amount :'),
                  TextField(
                    onSubmitted: (userInputWeeklyBudget) {
                      setState(() {
                        if (_value == 0) {
                          //subtract from dining
                          dining = dining - int.parse(userInputWeeklyBudget);
                          saveDiningPref(dining);
                        } else if (_value == 1) {
                          //subtract from transport
                          transport =
                              transport - int.parse(userInputWeeklyBudget);
                          saveTransportPref(transport);
                        } else if (_value == 2) {
                          //subtract from entertainment
                          entertain =
                              entertain - int.parse(userInputWeeklyBudget);
                          saveEntertainPref(entertain);
                        }
                        weeklyBudget =
                            weeklyBudget - int.parse(userInputWeeklyBudget);
                        saveWeeklyBudgetPref(weeklyBudget);
                      });
                    },
                    controller:
                        userInputWeeklyBudget, //inputted value to be subtracted from total and category
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.0),
                  BottomButton(
                    buttonTitle: 'HOME',
                    onTap: () {
                      // A MaterialPageRoute is a  modal route that replaces the entire screen
                      // with a platform-adaptive transition.
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new ResultsPage(value: User()),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateWeeklyBudget(int weeklyBudget) {
    setState(() {
      this.weeklyBudget = weeklyBudget;
    });
  }

  void updateDining(int dining) {
    setState(() {
      this.dining = dining;
    });
  }

  void updateTransport(int transport) {
    setState(() {
      this.transport = transport;
    });
  }

  void updateEntertain(int entertain) {
    setState(() {
      this.entertain = entertain;
    });
  }
}
