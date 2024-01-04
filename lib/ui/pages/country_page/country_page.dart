import 'package:flutter/material.dart';

import '../../../data/utils/app_png.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);
  static const routeName = '/countryPage';

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  TextEditingController textEditingController = TextEditingController();
  List<String> countries = [
    "Afganistan", "Albania", "Algeria", "Andorra", "Angola", "Argentina",
    "Armenia", "Australia", "Austria", "Azerbaijan", "Iceland", "India",
    "Indonesia", "Iran", "Iraq", "Ireland",
  ];

  List<String> flags = [
    AppPng.afganistan, AppPng.albania, AppPng.algeria,
    AppPng.andorra, AppPng.angola, AppPng.argentina, AppPng.armaniya,
    AppPng.australia, AppPng.austria, AppPng.azerbaijon,
    AppPng.iceland, AppPng.india, AppPng.indonesia, AppPng.iran,
    AppPng.iroq, AppPng.ireland,
  ];


  List<String> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 58.0),
              child: Text(
                "Select your Country",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 18),
            child: Container(
              height: 50,
              width: 300,
              child: TextField(
                controller: textEditingController,
                onChanged: filterCountries,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 22),
                  suffix: IconButton(
                    onPressed: () {
                      // textEditingController.clear();
                      // filterCountries('');
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                      child: Icon(Icons.search, size: 30),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCountries[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                  leading: Image.asset(flags[countries.indexOf(filteredCountries[index])], width: 40, height: 40,), // Use the appropriate asset path
                  onTap: () {
                    // Handle country selection
                  },
                );
              },
            ),
          ),
          Container(
            height: 40,width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),color: Colors.blue
            ),
            child: TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/topicsPage');
              }
              ,child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          )

        ],
      ),
    );
  }
}
