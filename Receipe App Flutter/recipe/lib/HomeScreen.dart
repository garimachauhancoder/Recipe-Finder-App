import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as https;
import 'package:recipe/constant.dart';
import 'package:recipe/detailedScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tag = false;
  final url='https://api.edamam.com/search?q=914d341a&app_id=914d341a&app_key=a9f11ff89d0431ebe5bdecbbbf1d16c9';
  getApiData() async{
    var response = await https.get(Uri.parse(url));
    // Map json = jsonDecode(response.body);
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }
  List freshList = [
    {"image": "assets/images/chouminImgreceipeapp.png", "name": "Chow mein"},
    {"image": "assets/images/PizzaImgrecipeapp.png", "name": "Cheese Pizza "},
    {"image": "assets/images/dahivallaimg.png", "name": "Dahi Bhalla"},
    {"image": "assets/images/golgappeimg.png", "name": "Masala Gol Gappe"}
  ];

  List recommendedList = [
    {
      "image": "assets/images/foodrecipe1.png",
      "name": "Asian Glazed Chicken Thighs"
    },
    {"image": "assets/images/kimbap.jpg", "name": "Kimbap"},
    {
      "image": "assets/images/mac & cheese img.jpg",
      "name": "Mac & Cheese Dish"
    },
    {"image": "assets/images/Beef-Bibimbap img.png", "name": "Beef Bibimbap"},
    {
      "image": "assets/images/teokbokki_food_image2.png",
      "name": "Teokbokki Korean Dish"
    },
    {"image": "assets/images/potato salad.png", "name": "Potato Salad"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print("Menu"),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      height: 32.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Notification"),
                    child: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      height: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                "Bonjor Emma",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "What would you like to cook today?",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: "HellixBold",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextField(
                        cursorColor: kDarkColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 34.0,
                            ),
                            hintText: "Search for recipes",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () => print("Filter"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/settings.svg",
                        // color: kDarkColor,
                        height: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Fresh Recipes",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Fresh Recipes"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: freshList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              index,
                              freshList[index]["name"],
                              freshList[index]["image"],
                              tag = true),
                        ),
                      ),
                      child: Container(
                        height: 240.0,
                        width: 210.0,
                        margin: EdgeInsets.only(right: 32.0),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          // overflow: Overflow.visible,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 16.0,
                              left: 16.0,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              top: -16.0,
                              right: -32.0,
                              child: Hero(
                                tag: "fresh$index",
                                child: Image.asset(
                                  freshList[index]["image"],
                                  width: 150.0,
                                  height: 150.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Breakfast",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Container(
                                      width: 180.0,
                                      child: Text(
                                        freshList[index]["name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: "HellixBold",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          color: kOrangeColor,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6.0),
                                    Text(
                                      "120 Calories",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: kOrangeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 14.0,
                                            ),
                                            SizedBox(width: 8.0),
                                            Text(
                                              "10 mins",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 32.0),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/bell.svg",
                                              height: 14.0,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 9.0),
                                            Text(
                                              "1 Serving",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Recommended"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            index,
                            recommendedList[index]["name"],
                            recommendedList[index]["image"],
                            tag = false),
                      ),
                    ),
                    child: Container(
                      height: 120.0,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Hero(
                            tag: "recommended$index",
                            child: Image.asset(
                              recommendedList[index]["image"],
                              height: 180.0,
                              width: 120.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breakfast",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Text(
                                    recommendedList[index]["name"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize:
                                          15.0, //niche ke 10 mins ka border error hatane ke liye
                                      fontFamily: "HellixBold",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: kOrangeColor,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6.0),
                                      Text(
                                        "120 Calories",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.0),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 14.0,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "10 mins",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 32.0),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/bell.svg",
                                            height: 14.0,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 9.0),
                                          Text(
                                            "1 Serving",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 28.0,
                              width: 35.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
