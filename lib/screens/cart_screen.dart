import 'package:flutter/material.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'package:graduate_project/widgets/custom_textfield_checkout.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'SettingScreen');
              },
              icon: Icon(Icons.list),
            ),
          ],
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'ProfileScreen');
                },
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.jpeg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 30),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              Text(
                'Cart',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 244, 244),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 325,
                  height: 40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Text(
                          'Find plant',
                          style: TextStyle(
                              color: const Color.fromARGB(221, 150, 148, 148),
                              fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

// CustomProductCart(),
// Divider(),
// CustomProductCart(),
// Divider(),
// CustomProductCart(),

              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: TextStyle(fontSize: 18)),
                        Text('\$198.0', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping', style: TextStyle(fontSize: 18)),
                        Text('Flat Rate', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('\$189.0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check out',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text('First Name'),
                            SizedBox(height: 5),
                            CustomTextfieldCheckout(),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text('Last Name'),
                            SizedBox(height: 5),
                            //
                            CustomTextfieldCheckout()
                          ],
                        ),
                      ]),
                      SizedBox(height: 10),
                      Text(
                        'phone',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      CustomTextfield(
                        hinttext: 'phone Number',
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      CustomTextfield(
                        hinttext: 'Example@email.com',
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Password',
                        style: TextStyle(color: Colors.black),
                      ),
                      CustomTextfield(
                        hinttext: 'Adress',
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      CustomButton(
                        title: 'Check out',
                      ),
                    ]),
              )
            ])));
  }
}

//after cart
