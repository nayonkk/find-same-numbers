import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  int count = 0;
  int total = 0;
  int mat = 0;

  closed() {
    count = 0;
  }

  matching() {
    int total = int.parse(controller1.text.toString());
    int mat = int.parse(controller2.text.toString());
    while (total > 0) {
      int temp = total % 10;
      if (temp == mat) {
        count++;
      }
      total = total ~/ 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                  "How many same numbers are use find out this easy way"),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 150,
                color: Colors.black,
                child: Center(
                  child: Text(
                    key: GlobalKey(),
                    '$count',
                    style: const TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Please press random number",
                    suffixIcon: const Icon(Icons.mobile_friendly),
                    fillColor: Colors.grey[600],
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Find any number",
                    suffixIcon: const Icon(Icons.find_in_page),
                    fillColor: Colors.grey[600],
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        matching();

                        controller1.clear();
                        controller2.clear();
                      });
                    },
                    icon: const Icon(Icons.input),
                    label: const Text("Press"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        closed();
                      });
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text("Clear"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
