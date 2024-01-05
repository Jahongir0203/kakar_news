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
    "Birlashgan Arab Amirligi", "Argentina", "Avstriya", "Avstraliya", "Bangladesh", "Braziliya",
    "Kaliforniya", "Shveysariya", "Xitoy", "Kuba", "Chexiya", "Germaniya",
    "Misr", "Birlashgan Qirollik", "Gretsiya", "Vengriya","Indoneziya", "Irlandiya", "Italiya",
    "Yaponiya","Koreya", "Litva", "Latviya","Meksika","Malayziya", "Niderlandiya", "Norvegiya","Zelandiya",
    "Filippin", "Polsha", "Rossiya", "Amerika Qoʻshma Shtatlari",
  ];

  List<String> flags = [
    AppPng.KBirlashganArabAmirligi,
    AppPng.kArgentina, AppPng.kAvstriya,
    AppPng.kAvstraliya, AppPng.kBangladesh, AppPng.kBraziliya, AppPng.kKaliforniya,
    AppPng.kShveysariya, AppPng.kXitoy, AppPng.kKuba,
    AppPng.kChexiya, AppPng.kGermaniya, AppPng.kMisr, AppPng.kBirlashganQirollik,
    AppPng.kGretsiya, AppPng.kVengriya,
    AppPng.kIndoneziya, AppPng.kIrlandiya,
    AppPng.kItaliya, AppPng.kYaponiya,
    AppPng.kKoreya, AppPng.kLitva,
    AppPng.kLatviya, AppPng.kMeksika,
    AppPng.kMalayziya, AppPng.kNiderlandiya,
    AppPng.kNorvegiya, AppPng.kZelandiya,
    AppPng.kFilippin, AppPng.kPolsha,
    AppPng.kRossiya, AppPng.kAmerikaQoshmaShtatlari,
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
                  leading: Image.asset(flags[countries.indexOf(filteredCountries[index])], width: 50, height: 50,), // Use the appropriate asset path
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
