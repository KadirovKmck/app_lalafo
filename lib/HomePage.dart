import 'package:app/Filter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> textOne = [
    '       Электро \n обокгреватель',
    '   Мяцленный \n обокгреватель',
    'Тепловое \n   пушки',
    'Тепловентеляторы\n              pop',
  ];

  List<String> text2 = [
    'Уголь',
    '     Услуги\n электриков',
    '     Услуги\n сантехники',
    '        Ремон \n кондитсанера ',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          hintText: 'A ишу...',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()),
                            );
                          });
                        },
                        child: const Text(
                          'Фильтр',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w900,
                              fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        width: 70,
                        // child: Image.network(
                        //   imageUrls[index],
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 220),
                child: Text(
                  'Работа в два клика',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ),
              SizedBox(
                height: 280,
                width: 390,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: textOne.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 226, 5, 5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // child: Image.network(
                            //   imageUrls[index],
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Text(
                            textOne[index % textOne.length],
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 4, 4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // child: Image.network(
                            //   imageUrls[index],
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Text(
                            text2[index % text2.length],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
