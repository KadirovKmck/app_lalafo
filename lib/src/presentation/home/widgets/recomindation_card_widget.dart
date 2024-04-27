import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
