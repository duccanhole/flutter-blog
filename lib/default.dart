import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Excercise extends StatefulWidget {
  const Excercise({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExcerciseState();
}

class ExcerciseState extends State<Excercise> {
  late TextEditingController weight;
  late TextEditingController height;
  @override
  void initState() {
    super.initState();
    weight = TextEditingController(text: '1');
    height = TextEditingController(text: '1');
  }
  late double result;
  String bmiSTR = '';
  caculateBMI(){
    result = int.parse(height.text)/(int.parse(weight.text)*2);
    setState(() {
      bmiSTR = 'your bmi is: $result';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: weight,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'weight'
          ),
        ),
        TextField(
          controller: height,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'height'
          ),
        ),
        ElevatedButton(onPressed: () => caculateBMI(), child: const Text('caculate')),
        Text(bmiSTR)
      ],
    );
  }
}
