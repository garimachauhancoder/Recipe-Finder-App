import 'package:flutter/material.dart';
import 'package:recipe/constant.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String name, image;
  final bool tags;
  DetailsScreen(this.index, this.name, this.image, this.tags);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58.0,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            color: kOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "HellixBold",
              color: kLightColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64.0,
            left: 28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 28.0),
                  decoration: BoxDecoration(
                    color: kOrangeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.star,
                      color: kLightColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 36.0, fontFamily: "HellixBold"),
                ),
              ),
              SizedBox(height: 24.0),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                    TextSpan(
                      text: "  250.25",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "120 Calories",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36.0),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "10 mins",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36.0),
                          Text(
                            "Total Serve",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "1 Serving",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: widget.tags
                          ? "fresh${widget.index}"
                          : "recommend${widget.index}",
                      child: Image.asset(
                        widget.image,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "HellixBold",
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(
                  right: 28.0,
                  bottom: 28.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur nec nunc euismod, dictum nunc at, convallis nisl.Vivamus vehicula ligula vel arcu fermentum volutpat.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontFamily: "HellixBold",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ingredients",
                        textAlign: TextAlign.left, 
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: "HellixBold",
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "1. Salt: Enhances flavor in sweet and savory dishes.\n2. Water: Essential for cooking, boiling, steaming, and baking.\n3. Oil/Fat: Includes vegetable oil, olive oil, butter, and lard,\n used for frying, sautéing, or as a flavor base.\n4. Sugar: Adds sweetness to desserts and balances savory dishes.\n5. Flour: A key ingredient for bread, pastries, and thickening sauces.\n6. Vinegar: Adds acidity and brightness; includes types like white, apple cider, or balsamic.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontFamily: "HellixBold",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
