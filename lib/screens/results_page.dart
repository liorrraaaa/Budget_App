import 'package:budget_app_two_point_oh/main.dart';
import 'package:flutter/material.dart';
import 'package:budget_app_two_point_oh/constants.dart';
import 'package:budget_app_two_point_oh/components/round_icon_button.dart';
import 'package:budget_app_two_point_oh/screens/spent_input_page.dart';
import 'package:budget_app_two_point_oh/screens/input_page.dart';
import 'package:budget_app_two_point_oh/Costs.dart';

class ResultsPage extends StatefulWidget {
  final User value;

  ResultsPage({Key key, this.value}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int weeklyBudget = 0;
  int diningTotal = 0;
  int transportTotal = 0;
  int entertainTotal = 0;
  int dining = 0;
  int transport = 0;
  int entertain = 0;
  String color = "";
  double _categoryFontSize = 25.0;

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

  @override
  Widget build(BuildContext context) {
    //Set the colors
    Color diningColor = new Color(checkColor(dining, diningTotal));
    Color transportColor = new Color(checkColor(transport, transportTotal));
    Color entertainColor = new Color(checkColor(entertain, entertainTotal));

    return Scaffold(
        appBar: AppBar(
          title: Text('MY BUDGET'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text("Dining", //Todo: ${variableMame}
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ))), //Todo: make nice font
                              DataCell(
                                Text(
                                  '\$$dining  / $diningTotal',
                                  style: TextStyle(
                                      color: diningColor,
                                      fontSize: _categoryFontSize),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text("Transport", //Todo: ${variableMame}
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ))), //Todo: make nice font
                              DataCell(
                                Text(
                                  '\$$transport  / $transportTotal',
                                  style: TextStyle(
                                      color: transportColor,
                                      fontSize: _categoryFontSize),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Entertainment", //Todo: ${variableMame}
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ))), //Todo: make nice font
                              DataCell(
                                Text(
                                  '\$$entertain  / $entertainTotal',
                                  style: TextStyle(
                                      color: entertainColor,
                                      fontSize: _categoryFontSize),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 70.0),
//                  SafeArea(
//
//                  ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        '$weeklyBudget', //Todo: replace with budgetRemaining variable
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey, //Todo:make darker gray
                            fontSize: 120.0,
                            fontFamily: 'RobotoMono'),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'dollars',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                      child: RoundIconButton(
                    icon: Icons.settings,
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new InputPage(value: User()),
                      );
                      Navigator.of(context).push(route);
                    },
                  )),
                  Expanded(
                      child: RoundIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new SpentPage(value: User()),
                      );
                      Navigator.of(context).push(route);
                    },
                  ))
                ],
              )
            ],
          ),
        ));
  }

  //return the color in proportion to amt/total
  int checkColor(int category, int total) {
    int color;
    if (category < total / 3)
      //red
      color = 0xFFFF1744;
    else if (category > total / 3 && category < (total / 3) * 2)
      //yellow
      color = 0xFFFFEA00;
    else
      //green
      color = 0xFF00E676;
    return color;
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
