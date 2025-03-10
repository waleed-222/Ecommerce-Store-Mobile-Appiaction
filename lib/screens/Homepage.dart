import 'package:flutter/material.dart';
import 'package:store/utilities/data.dart';
import 'package:store/screens/details.dart';

import 'CartPage.dart';
import 'CategoryPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      iconSize: 35,
      selectedItemColor: Colors.orange,
      onTap: (index) {
        if (index == 1) {
          Navigator.of(context).pushNamed("cart");
        }
          else if(index ==0){
          Navigator.of(context).pushReplacementNamed("home");
        }

      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "*"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "*"),
      ],
    ),
      body:
        Container(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Row(children: [
              Expanded(child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none,
                    fillColor:Colors.grey[200],
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText:"Search"),
              )),Padding(
                padding: const EdgeInsets.only(left:10 ),
                child: IconButton(
                  onPressed: () {  Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);},
                  icon: Icon(Icons.output, size: 40),
                )

              )
            ],
        
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 20),
              child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: categories_image.length,
                  itemBuilder:(context,i){
                  return InkWell(
                    onTap: (){
                      String selectedCategory = categories_text[i]["text"];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(
                            category: selectedCategory,
                            items: categoryItems[selectedCategory] ?? [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          Container(width:80,height:80,decoration:BoxDecoration(color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                            child: ClipOval(child: Image.asset(categories_image[i]["imagename"],fit: BoxFit.fill,))
                            ,),
                          Text(categories_text[i]["text"],style: TextStyle(fontWeight: FontWeight.bold),)
                        ],),
                    ),
                  );
                  }
        
        
        
              ,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 20),
              child: Text("Best Selling",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            GridView.builder(
              itemCount: best_selling.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250),
              itemBuilder:(context,i){ 
                return InkWell(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Itemdetails(data: best_selling[i])));},
                  child: Card(color:Colors.white,
                  margin:EdgeInsets.only(right: 10,bottom: 10),
                  child: Column(children: [
                    Container(color: Colors.white,width:200,height:130 ,
                      child:Image.asset(best_selling[i]["image"][0], fit: BoxFit.fill)),
                    Text(best_selling[i]["title"],textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                    Text(best_selling[i]["description"],textAlign:TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.grey),),
                    Text(best_selling[i]["price"],textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green))
                          
                              ],)
                              ),
                );
        
        
            }
          ),
          ]
        ),
        ),

    );
  }

}