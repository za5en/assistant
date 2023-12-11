import 'package:flutter/material.dart';

class CurrentCompetency extends StatefulWidget {
  const CurrentCompetency({super.key});

  @override
  State<CurrentCompetency> createState() => _CurrentCompetencyState();
}

class _CurrentCompetencyState extends State<CurrentCompetency> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CurrentGradeCard extends StatefulWidget {
  const CurrentGradeCard(
      {super.key, required this.gradeName, required this.specName});

  final String gradeName;
  final String specName;

  @override
  State<CurrentGradeCard> createState() => _CurrentGradeCardState();
}

class _CurrentGradeCardState extends State<CurrentGradeCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: w * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.gradeName,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  widget.specName,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
