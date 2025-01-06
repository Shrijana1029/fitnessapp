///declaration section/
library;

class Food {
  final String name;
  final String image1;
  final String image2;
  final double proteinvalue;
  final double carbsvalue;
  final double fatsvalue;
  final String description;
  final String calorie;
  final String protein;
  final String carbs;
  final String tfat;
  final String sfat;
  final String ufat;

  /// constructor declaration
  const Food({
    //parameters
    required this.name,
    required this.image1,
    required this.image2,
    required this.proteinvalue,
    required this.carbsvalue,
    required this.fatsvalue,
    required this.description,
    required this.calorie,
    required this.protein,
    required this.carbs,
    required this.tfat,
    required this.sfat,
    required this.ufat,
  });
}

////////secton 3//////
//yo list ma cha Food class ko object banauna milxa
List<Food> foodList = [
  //objects of food class
  Food(
    name: 'Chickpeas',
    image1: 'assets/img/chickpeas.jpg',
    image2: 'assets/img/chckps.jpg',
    proteinvalue: 8.6, //+
    carbsvalue: 27, //+
    fatsvalue: 2.6, //+
    description:
        'Garbanzo beans, another name for chickpeas, have been cultivated and consumed for thousands of years in Middle Eastern nations.Rich in vitamins, minerals, and fiber, chickpeas may help you control your weight, improve your digestion, and lower your risk of illness, among other health advantages.',
    calorie: '164 Kcal',
    protein: '8.6g',
    carbs: '27g',
    tfat: '2.6g',
    sfat: '0.27g',
    ufat: '1.58g',
  ),
  Food(
    name: 'Milk',
    image1: 'assets/img/milk1.jpg',
    image2: 'assets/img/milk2.jpg',
    proteinvalue: 3.4,
    carbsvalue: 4.6,
    fatsvalue: 3.6,
    description:
        'Garbanzo milk, another name for chickpeas, have been cultivated and consumed for thousands of years in Middle Eastern nations.Rich in vitamins, minerals, and fiber, chickpeas may help you control your weight, improve your digestion, and lower your risk of illness, among other health advantages.',
    calorie: '64 Kcal',
    protein: '3.4g',
    carbs: '4.6g',
    tfat: '3.6g',
    sfat: '1.87g',
    ufat: '1.1g',
  ),
  Food(
    name: 'Almond',
    image1: 'assets/img/almond1.jpg',
    image2: 'assets/img/almond2.jpg',
    proteinvalue: 21.2,
    carbsvalue: 21.6,
    fatsvalue: 49.9,
    description:
        'Garbanzo milk, another name for chickpeas, have been cultivated and consumed for thousands of years in Middle Eastern nations.Rich in vitamins, minerals, and fiber, chickpeas may help you control your weight, improve your digestion, and lower your risk of illness, among other health advantages.',
    calorie: '579 Kcal',
    protein: '21.2g',
    carbs: '21.6g',
    tfat: '49.9g',
    sfat: '3.8g',
    ufat: '43.1g',
  ),
];
