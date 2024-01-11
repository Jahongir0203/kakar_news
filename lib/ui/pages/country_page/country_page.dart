import 'package:flutter/material.dart';
import 'package:kakar_news/ui/pages/topics_page/topics_page.dart';
import 'package:kakar_news/ui/widgets/next_button.dart';

import '../../../data/utils/app_colors.dart';
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
    "Birlashgan Arab Amirligi",
    "Argentina",
    "Avstriya",
    "Avstraliya",
    "Bangladesh",
    "Braziliya",
    "Kaliforniya",
    "Shveysariya",
    "Xitoy",
    "Kuba",
    "Chexiya",
    "Germaniya",
    "Misr",
    "Birlashgan Qirollik",
    "Gretsiya",
    "Vengriya",
    "Indoneziya",
    "Irlandiya",
    "Italiya",
    "Yaponiya",
    "Koreya",
    "Litva",
    "Latviya",
    "Meksika",
    "Malayziya",
    "Niderlandiya",
    "Norvegiya",
    "Zelandiya",
    "Filippin",
    "Polsha",
    "Rossiya",
    "Amerika Qoʻshma Shtatlari",
  ];

  List<String> flags = [
    AppPng.KBirlashganArabAmirligi,
    AppPng.kArgentina,
    AppPng.kAvstriya,
    AppPng.kAvstraliya,
    AppPng.kBangladesh,
    AppPng.kBraziliya,
    AppPng.kKaliforniya,
    AppPng.kShveysariya,
    AppPng.kXitoy,
    AppPng.kKuba,
    AppPng.kChexiya,
    AppPng.kGermaniya,
    AppPng.kMisr,
    AppPng.kBirlashganQirollik,
    AppPng.kGretsiya,
    AppPng.kVengriya,
    AppPng.kIndoneziya,
    AppPng.kIrlandiya,
    AppPng.kItaliya,
    AppPng.kYaponiya,
    AppPng.kKoreya,
    AppPng.kLitva,
    AppPng.kLatviya,
    AppPng.kMeksika,
    AppPng.kMalayziya,
    AppPng.kNiderlandiya,
    AppPng.kNorvegiya,
    AppPng.kZelandiya,
    AppPng.kFilippin,
    AppPng.kPolsha,
    AppPng.kRossiya,
    AppPng.kAmerikaQoshmaShtatlari,
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
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
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
          Container(
            height: 47,
            width: 350,
            child: TextField(
              controller: textEditingController,
              onChanged: filterCountries,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: AppColors.kGreyScale,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: AppColors.kGreyScale,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: AppColors.kGreyScale,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: AppColors.kGreyScale,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle country selection
                  },
                  splashColor: Colors.blue, // Set the splash color
                  child: ListTile(
                    title: Text(
                      filteredCountries[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    leading: Image.asset(
                      flags[countries.indexOf(filteredCountries[index])],
                      width: 32,
                      height: 32,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: nextButton(context, () {
        Navigator.pushNamed(context, TopicsPage.routeName);
      },
          32),
    );
  }
}
