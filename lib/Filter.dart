import 'package:app/HomePage.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

enum Gender { male, female }

Color activColor = const Color.fromARGB(255, 9, 255, 0).withOpacity(0.3);
Color inactivColor = const Color.fromARGB(255, 192, 193, 194);
Color maleColor = inactivColor;
Color femaleColor = activColor;

enum SingingCharacter { lafayette, jefferson, hamilton, washington }

class _FilterState extends State<Filter> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  int? selectedOption;
  int current = 1;
  PageController pageController = PageController();

  SingingCharacter? _character = SingingCharacter.lafayette;
  final double _lightValue = 0;

  void containerTapped(Gender tappedGender) {
    setState(() {
      if (tappedGender == Gender.male) {
        maleColor = activColor;
        femaleColor = inactivColor;
      } else if (tappedGender == Gender.female) {
        femaleColor = activColor;
        maleColor = inactivColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                ),
                const Spacer(),
                const Text(
                  'filter',
                  style: TextStyle(fontSize: 17),
                ),
                const Spacer(),
                const Text(
                  'Go bag',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 16,
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    hintText: 'Enter your search query',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Kategoria',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width - 16,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text('Выберите котегорию'),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Kategoria',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width - 16,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text('Выберите котегорию'),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Saaa',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    containerTapped(Gender.male);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: maleColor, width: 3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 30,
                      width: 50,
                      child: const Center(
                        child: Text(
                          'KGS',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    containerTapped(Gender.female);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: femaleColor, width: 3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 30,
                    width: 50,
                    child: const Center(
                      child: Text(
                        'USD',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                        controller: _fromController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          hintText: 'Ot',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                        controller: _toController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          hintText: 'Do',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.hamilton,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.washington,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const SizedBox(height: 50),
            Center(
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 179, 35),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    '10000',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
