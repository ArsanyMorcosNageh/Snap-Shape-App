import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSelector(),
              SizedBox(height: 10),
              _buildCaloriesBudget(),
              SizedBox(height: 10),
              _buildActionButtons(),
              SizedBox(height: 10),
              _buildMealSection("Breakfast", 300, 450, Colors.purple[100]!),
              _buildMealSection("Snacks", 120, 130, Colors.purple[200]!),
              _buildMealSection("Lunch", 600, 400, Colors.purple[300]!),
              _buildMealSection("Dinner", 380, 0, Colors.purple[400]!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        return Column(
          children: [
            Text("${17 + index}"),
            Text("Tue", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        );
      }),
    );
  }

  Widget _buildCaloriesBudget() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text("Calories Budget", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: 0.7,
                  color: Colors.yellow,
                  backgroundColor: Colors.grey[300],
                  strokeWidth: 8,
                ),
              ),
              Text("1400 Kcal", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text("20%", style: TextStyle(color: Colors.white)), Text("32g Carbs", style: TextStyle(color: Colors.white))]),
              Column(children: [Text("46%", style: TextStyle(color: Colors.white)), Text("64g Protein", style: TextStyle(color: Colors.white))]),
              Column(children: [Text("34%", style: TextStyle(color: Colors.white)), Text("71g Fats", style: TextStyle(color: Colors.white))]),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {}, 
          child: Text("SNAP NOW", style: TextStyle(color: Colors.white))
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () {}, 
          child: Text("STATISTICS", style: TextStyle(color: Colors.white))
        ),
      ],
    );
  }

  Widget _buildMealSection(String title, int suggested, int actual, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("$actual Kcal", style: TextStyle(color: actual > suggested ? Colors.red : Colors.green, fontSize: 16)),
              ],
            ),
            Text("$suggested Kcal suggested", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {}, 
                  child: Text("Add Meal", style: TextStyle(color: Colors.white))
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                  onPressed: () {}, 
                  child: Text("Scan Meal", style: TextStyle(color: Colors.white))
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
