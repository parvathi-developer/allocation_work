import 'package:flutter/material.dart';
import 'package:allocation_work/core/widgets/multi_color_progress.dart';
import 'package:allocation_work/core/widgets/title_text_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedDay = 'Today';
  final List<String> dayOptions = ['Today', 'Tomorrow', 'Yesterday'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              color: const Color.fromARGB(252, 251, 249, 249),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "The Crest - Tower 5",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedDay,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedDay = value;
                              });
                            }
                          },
                          items: dayOptions
                              .map(
                                (day) => DropdownMenuItem(
                                  value: day,
                                  child: Text(day),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// Metrics Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _metricColumn(
                            'Today\'s Allocation',
                            '10',
                            color: Colors.greenAccent,
                          ),
                        ),
                        Expanded(child: _metricColumn('Productivity', '8/12')),
                        Expanded(
                          child: _metricColumn(
                            'Rework Logged',
                            '3',
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Text("Technician Allocation"),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CustomPaint(
                            painter: MultiColorCircularProgressPainter(
                              values: [12, 6, 4],
                              colors: [
                                Colors.blue,
                                Colors.orange,
                                Colors.green,
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                SizedBox(width: 4),
                                TitleText(
                                  text: "Allocated: 12",
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                                SizedBox(width: 4),
                                TitleText(
                                  text: "Unallocated: 4",
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ],
                            ),

                            SizedBox(height: 15),
                            Divider(thickness: 2.0, color: Colors.grey),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                linearProgressBar(
                                  value: 100.0,
                                  width: 25.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10),

                                TitleText(
                                  text: 'Target',
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                linearProgressBar(
                                  value: 100.0,
                                  width: 25.0,
                                  color: Colors.greenAccent,
                                ),
                                SizedBox(width: 10),

                                TitleText(
                                  text: 'Actual',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    const TitleText(
                      text: "Productivity",
                      fontSize: 14,
                      color: Colors.black,
                    ),

                    _progressBar("Internal Plaster", 0.6, 0.2, 0.2),
                    _progressBar("External Painting", 0.5, 0.25, 0.25),
                    _progressBar("Ceiling Work", 0.3, 0.4, 0.3),

                    const SizedBox(height: 20),
                    const TitleText(
                      text: "Attendance",
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    _attendanceSection(15, 8, 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricColumn(String title, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(text: title, fontSize: 14, color: Colors.grey),
        Row(
          children: [
            TitleText(text: value, fontSize: 20, color: color ?? Colors.black),
            if (color != null) ...[
              const SizedBox(width: 8),
              linearProgressBar(value: 100.0, width: 25.0, color: color),
            ],
          ],
        ),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 15),
        const SizedBox(width: 4),
        TitleText(text: label, fontSize: 10, color: Colors.black),
      ],
    );
  }

  Widget _barWithLabel(String label, Color color) {
    return Row(
      children: [
        linearProgressBar(value: 100.0, width: 25.0, color: color),
        const SizedBox(width: 10),
        TitleText(text: label, fontSize: 20, color: color),
      ],
    );
  }

  Widget _progressBar(String label, double orange, double green, double grey) {
    final total = orange + green + grey;
    final normalize = (val) => total > 0 ? val / total : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: TitleText(text: label, fontSize: 14, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Row(
                children: [
                  Expanded(
                    flex: (normalize(orange) * 100).round(),
                    child: Container(height: 8, color: Colors.orange),
                  ),
                  Expanded(
                    flex: (normalize(green) * 100).round(),
                    child: Container(height: 8, color: Colors.green),
                  ),
                  Expanded(
                    flex: (normalize(grey) * 100).round(),
                    child: Container(height: 8, color: Colors.grey.shade300),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _attendanceSection(int present, int transfers, int third) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Progress bar and Labels below
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              Row(
                children: [
                  Expanded(
                    flex: present,
                    child: Container(height: 20, color: Colors.blue),
                  ),
                  Expanded(
                    flex: transfers,
                    child: Container(height: 20, color: Colors.amber),
                  ),
                  Expanded(
                    flex: third,
                    child: Container(height: 20, color: Colors.lime),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Labels row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.blue, size: 15),
                      const SizedBox(width: 4),
                      const TitleText(
                        text: "Present",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.amber, size: 15),
                      const SizedBox(width: 4),
                      const TitleText(
                        text: "Absent",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.lime, size: 15),
                      const SizedBox(width: 4),
                      const TitleText(
                        text: "Transfers",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // Right Column: Vertical Numbers
        Column(
          children: const [
            TitleText(text: "21", fontSize: 14, color: Colors.black),
            SizedBox(height: 8),
            TitleText(text: "2", fontSize: 14, color: Colors.black),
          ],
        ),
      ],
    );
  }

  Widget linearProgressBar({double? value, double? width, Color? color}) {
    return SizedBox(
      width: width ?? double.infinity, // Adjust width as needed
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        child: LinearProgressIndicator(
          value: value ?? 10,
          minHeight: 8,
          backgroundColor: Colors.grey[300],
          color: color ?? Colors.blue, // Customize color if needed
        ),
      ),
    );
  }
}
