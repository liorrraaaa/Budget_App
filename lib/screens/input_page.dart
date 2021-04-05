import 'package:flutter/material.dart';
import 'package:budget_app_two_point_oh/components/reusable_card.dart';
import 'package:budget_app_two_point_oh/constants.dart';
import 'package:budget_app_two_point_oh/screens/results_page.dart';
import 'package:budget_app_two_point_oh/components/bottom_button.dart';
import 'package:budget_app_two_point_oh/Costs.dart';
import 'package:budget_app_two_point_oh/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:budget_app_two_point_oh/components/round_icon_button.dart';

class InputPage extends StatefulWidget {
  final User value;

  InputPage({Key key, this.value}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weeklyBudget = 0;
  int diningTotal = 0;
  int transportTotal = 0;
  int entertainTotal = 0;
  int dining = 0;
  int transport = 0;
  int entertain = 0;

  @override
  void initState() {
    getWeeklyBudgetPref().then(updateWeeklyBudget);
    getDiningTotalPref().then(updateDiningTotal);
    getTransportTotalPref().then(updateTransportTotal);
    getEntertainTotalPref().then(updateEntertainTotal);
    getDiningPref().then(updateDining);
    getTransportPref().then(updateTransport);
    getEntertainPref().then(updateEntertain);
    super.initState();
  }

  //these stay in this class
  final int divisionsNum = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTINGS'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weekly Budget',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '\$ ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        (diningTotal + transportTotal + entertainTotal)
                            .toString(),
                        style: kNumberTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dining Total',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              diningTotal--;
                              entertain = entertainTotal;
                              transport = transportTotal;
                              dining = diningTotal;
                              weeklyBudget =
                                  diningTotal + transportTotal + entertainTotal;
                              saveWeeklyBudgetPref(weeklyBudget);
                              saveTransportTotalPref(transportTotal);
                              saveEntertainPref(entertain);
                              saveTransportPref(transport);
                              saveDiningPref(dining);
                            });
                          }),
                      SizedBox(width: 15.0),
                      Text(
                        '\$ ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        diningTotal.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(width: 15.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            diningTotal++;
                            entertain = entertainTotal;
                            transport = transportTotal;
                            dining = diningTotal;
                            weeklyBudget =
                                diningTotal + transportTotal + entertainTotal;
                            saveWeeklyBudgetPref(weeklyBudget);
                            saveDiningTotalPref(diningTotal);
                            saveEntertainPref(entertain);
                            saveTransportPref(transport);
                            saveDiningPref(dining);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Transport Total',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              transportTotal--;
                              entertain = entertainTotal;
                              transport = transportTotal;
                              dining = diningTotal;
                              weeklyBudget =
                                  diningTotal + transportTotal + entertainTotal;
                              saveWeeklyBudgetPref(weeklyBudget);
                              saveTransportTotalPref(transportTotal);
                              saveEntertainPref(entertain);
                              saveTransportPref(transport);
                              saveDiningPref(dining);
                            });
                          }),
                      SizedBox(width: 15.0),
                      Text(
                        '\$ ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        transportTotal.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(width: 15.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            transportTotal++;
                            entertain = entertainTotal;
                            transport = transportTotal;
                            dining = diningTotal;
                            weeklyBudget =
                                diningTotal + transportTotal + entertainTotal;
                            saveWeeklyBudgetPref(weeklyBudget);
                            saveTransportTotalPref(transportTotal);
                            saveEntertainPref(entertain);
                            saveTransportPref(transport);
                            saveDiningPref(dining);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Entertainment Total',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              entertainTotal--;
                              entertain = entertainTotal;
                              transport = transportTotal;
                              dining = diningTotal;
                              weeklyBudget =
                                  diningTotal + transportTotal + entertainTotal;
                              saveWeeklyBudgetPref(weeklyBudget);
                              saveEntertainTotalPref(entertainTotal);
                              saveEntertainPref(entertain);
                              saveTransportPref(transport);
                              saveDiningPref(dining);
                            });
                          }),
                      SizedBox(width: 15.0),
                      Text(
                        '\$ ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        entertainTotal.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(width: 15.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            entertainTotal++;
                            entertain = entertainTotal;
                            transport = transportTotal;
                            dining = diningTotal;
                            weeklyBudget =
                                diningTotal + transportTotal + entertainTotal;
                            saveWeeklyBudgetPref(weeklyBudget);
                            saveEntertainTotalPref(entertainTotal);
                            saveEntertainPref(entertain);
                            saveTransportPref(transport);
                            saveDiningPref(dining);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'SET',
            onTap: () {
              weeklyBudget = diningTotal + transportTotal + entertainTotal;
              saveEntertainPref(entertainTotal);
              saveTransportPref(transportTotal);
              saveDiningPref(diningTotal);
              saveWeeklyBudgetPref(weeklyBudget);
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new ResultsPage(value: User()),
              );
              Navigator.of(context).push(route);
            },
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

  void updateDiningTotal(int diningTotal) {
    setState(() {
      this.diningTotal = diningTotal;
    });
  }

  void updateTransportTotal(int transportTotal) {
    setState(() {
      this.transportTotal = transportTotal;
    });
  }

  void updateEntertainTotal(int entertainTotal) {
    setState(() {
      this.entertainTotal = entertainTotal;
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
