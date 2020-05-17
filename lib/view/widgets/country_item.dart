import 'package:coronavirus/model/country_data.dart';
import 'package:coronavirus/shared/font_styles.dart';
import 'package:coronavirus/utils/format.dart';
import 'package:coronavirus/view/widgets/countrydetails.dart';
import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  final CountryData _countryData;

  const CountryItem(this._countryData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1D1E33),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Coronad(
                        corona: _countryData,
                      )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.only(left: 11, top: 5),
              child: Text(
                _countryData.name,
                style: title,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 11.0),
                    child: Image.network(
                        'https://www.countryflags.io/${_countryData.code}/flat/64.png'),
                  ),
                ),
                _newDataBlock('Cases', _countryData.totalConfirmed,
                    _countryData.newConfirmed, Color(0xff51A5d3)),
                _newDataBlock('Recovered', _countryData.totalRecovered,
                    _countryData.newRecovered, Color(0xff68D682)),
                _newDataBlock('Death', _countryData.totalDeaths,
                    _countryData.newDeaths, Color(0xffEF5353)),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  _caseDataBlock(title, totalData, newData, color) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: smallDarkTitle,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: smallTitle,
              children: <TextSpan>[
                new TextSpan(text: Format.intToString(totalData)),
                new TextSpan(
                    text: ' +${Format.intToString(newData)}',
                    style: new TextStyle(fontSize: 14, color: color)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _dataBlock(title, totalData, newData, color) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: smallDarkTitle,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: smallTitle,
              children: <TextSpan>[
                new TextSpan(
                    text: Format.intToString(totalData), style: smallTitle),
                new TextSpan(
                    text: ' +${Format.intToString(newData)}',
                    style: new TextStyle(fontSize: 14, color: color)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _newDataBlock(title, totalData, newData, color) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: smallDarkTitle,
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(Format.intToString(totalData), style: smallTitle),
                SizedBox(height: 5),
                Text(
                  ' +${Format.intToString(newData)}',
                  style: new TextStyle(fontSize: 14, color: color),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
