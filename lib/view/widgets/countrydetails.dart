import 'package:coronavirus/model/country_data.dart';
import 'package:coronavirus/view/widgets/sceensize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Coronad extends StatelessWidget {
  final CountryData corona;

  Coronad({this.corona});

  bodyWidget(BuildContext context) => ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70),
                Text(
                  'last updated at ' +
                      DateFormat('dd.MM.yyyy, hh:mm a')
                          .format(corona.date.toUtc()),
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                Center(
                  child: Image.network(
                    'https://www.countryflags.io/${corona.code}/flat/64.png',
                    height: 130.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    colorCard("Total Cases", corona.totalConfirmed.toString(),
                        context, Color(0xFF8fb9a8)),
                    SizedBox(width: 10),
                    colorCard("New Cases", corona.newConfirmed.toString(),
                        context, Color(0xFFf1828d)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    colorCard("Total Deaths", corona.totalDeaths.toString(),
                        context, Color(0xFF765d69)),
                    SizedBox(width: 10),
                    colorCard("New Deaths", corona.newDeaths.toString(),
                        context, Color(0xFF685d79)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    colorCard(
                        "Total Recoverd",
                        corona.totalRecovered.toString(),
                        context,
                        Color(0xFF475c78)),
                    SizedBox(width: 10),
                    colorCard("New Recovered", corona.newRecovered.toString(),
                        context, Color(0xFFff3f5e)),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          corona.name,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: bodyWidget(context),
    );
  }
}

Widget colorCard(
    String text, String fields, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 9, right: 9),
    padding: EdgeInsets.all(25),
    height: screenAwareSize(80, context),
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(17),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Text(
            "${fields.toString()}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  );
}
