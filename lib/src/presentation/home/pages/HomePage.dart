// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:university/src/core/ui/texts/app_texts.dart';
import '../../filter/filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          hintText: 'Search...',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Filter()),
                        );
                      },
                      child: const Text(
                        'Filter',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
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
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                'Work in two clicks',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 260,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: AppTexts.textOne.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 5, 5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Text(
                          AppTexts.textOne[index],
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.amber,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
