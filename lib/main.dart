import 'package:flutter/material.dart';
import 'package:ovo_clone/model/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OVO Clone',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OVO'),
        actions: const [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.notifications_none),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.settings),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.deepPurple,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.do_not_disturb_on_outlined, color: Colors.white),
                            Text('Home', style: TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.work, color: Colors.white),
                            Text('Deals', style: TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.white),
                            Text('Finance', style: TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.account_balance_wallet, color: Colors.white),
                            Text('Wallet', style: TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.signal_cellular_alt, color: Colors.white),
                            Text('History', style: TextStyle(
                                color: Colors.white
                            ),)
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('OVO CASH', style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                            Row(
                              children: [
                                Text('Rp', style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text('100.000', style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Text('OVO POINTS ', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text('13801', style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.refresh, color: Colors.white, size: 40,),
                            const SizedBox(
                              width: 14,
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                                fixedSize: MaterialStatePropertyAll(Size.fromWidth(115)),
                                padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
                              ),
                              child: const Text(
                                'TOP UP', style: TextStyle(
                                  fontSize: 18
                              ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 64,)
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 162, horizontal: 24.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset('images/transfer.png'),
                          const Text('Transfer', style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple
                          ),)
                        ],
                      ),
                      Container(color: Colors.black45, height: 80, width: 1,),
                      Column(
                        children: [
                          Image.asset('images/scan.png'),
                          const Text('Scan', style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple
                          ),)
                        ],
                      ),
                      Container(color: Colors.black45, height: 80, width: 1,),
                      Column(
                        children: [
                          Image.asset('images/user_id.png'),
                          const Text('OVO ID', style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple
                          ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  final Menu menu = menuList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.5
                                )
                              ]
                          ),
                          child: Image.asset(menu.photo),
                        ),
                        Text(menu.name)
                      ],
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450),
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('images/iklan1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('images/iklan2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('images/iklan3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('images/iklan4.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('images/iklan5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  ],

                  options: CarouselOptions(
                    height: 140.0,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
