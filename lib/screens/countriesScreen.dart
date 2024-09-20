import 'package:flutter/material.dart';
import 'package:pretiumtest/constants.dart';
import 'package:pretiumtest/dioServices/dioPostService.dart';
import 'package:pretiumtest/models/countryModel.dart';

import '../widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Country> countries = [];
  List<Country> filteredCountries = []; // For storing search results
  bool isFetching = false;
  TextEditingController searchController = TextEditingController(); // Controller for search input


  @override
  void initState() {
    fetchCountries();
    super.initState();
    searchController.addListener(() {
      filterCountries();
    });
  }

  /// Fetch countries
  fetchCountries() async {
    setState(() {
      isFetching = true;
    });

    try {
      final response = await DioPostService().fetchCountries();

      if (response.statusCode == 200) {
        final rawData = response.data['data'] as List;

        setState(() {
          countries = rawData.map((json) {
            Country country = Country.fromJson(json);
            String imagePath = 'assets/images/${country.name.toLowerCase()}.jpg';
            country.imagePath = imagePath; // Assign the image path
            return country;
          }).toList();
          filteredCountries = countries; // Initially, all countries are shown
          isFetching = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isFetching = false;
      });
      print('Error fetching countries: $e');
    }
  }

  /// Filter countries based on the search query
  void filterCountries() {
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredCountries = countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search By Country Name',
              labelStyle: TextStyle(fontSize: 15),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: isFetching
                ? Center(child: CircularProgressIndicator())
                : filteredCountries.isEmpty
                ? Center(child: Text('No countries available'))
                : ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      // Display the background image from the assets
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(country.imagePath ?? 'assets/images/default.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Display country details with a transparent background
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.35),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Currency: ${country.currencyCode}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                           verticalSpace(15),
                            IconButton(onPressed: (){editCountryDialog( context: context, countryID: country.id, );}, icon: const Icon(Icons.edit,color: kIconYellow,))

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
