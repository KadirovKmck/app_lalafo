// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:university/src/core/ui/texts/app_texts.dart';
import 'package:university/src/presentation/filter/view/filter_view.dart';
import 'package:university/src/presentation/home/widgets/SherchWidget.dart';
import 'package:university/src/presentation/home/widgets/recomindation_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 184, 179, 179).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            onTap: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            readOnly: true,
            controller: controller,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              hintText: 'Search...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterView(),
                  ));
            },
            child: const Text('Filter'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                    ),
                    const Text('text')
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              'Work in two clicks',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
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
                        height: 90,
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
          const NewWidget()
        ],
      ),
    );
  }
}
