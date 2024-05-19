import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              PieChart(  // Removed 'const' here
                dataMap: const {
                  "Total": 20,
                  "Recovered": 100,
                  "Deaths": 5,
                },
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                colorList: colorList,
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                        ReusableRow(title: 'Total', value: '200'),
                      ReusableRow(title: 'Total', value: '200'),
                      ReusableRow(title: 'Total', value: '200'),
                    ],
                  ),
                ),
              ),
              GestureDetector(


                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff1aa260),
                      borderRadius:BorderRadius.circular(22)
                  ),
                  child: Center(
                    child: Text("Track Countries",style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value ;
  ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10 , bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}

