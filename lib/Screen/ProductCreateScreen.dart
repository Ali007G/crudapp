import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String,String> FormValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool Loading=false;


  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['Img']!.length==0){
      ErrorToast('Image Link Required !');
    }
    else if(FormValues['ProductCode']!.length==0){
      ErrorToast('Product Code Required !');
    }
    else if(FormValues['ProductName']!.length==0){
      ErrorToast('Product Name Required !');
    }
    else if(FormValues['Qty']!.length==0){
      ErrorToast('Product Qty Required !');
    }
    else if(FormValues['TotalPrice']!.length==0){
      ErrorToast('Total Price Required !');
    }
    else if(FormValues['UnitPrice']!.length==0){
      ErrorToast('Unit Price Required !');
    }
    else{
      setState(() {
        Loading=true;
      });
      await ProductCreateRequest(FormValues);
      setState(() {
        Loading=false;
      });
    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Create Product',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,

        actions: [
          IconButton(onPressed: (){
            _scaffoldKey.currentState?.openEndDrawer();
          },
              icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(),
      //endDrawer: Drawer(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text('Hello There...',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              color: Colors.greenAccent,
            ),
            //const Divider(thickness: 2,),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Search',
                labelStyle: TextStyle(fontSize: 18),
                hintText: 'Which Product You Want Search Here',
                hintStyle: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),

            ListTile(
              onTap: (){},
              leading: Icon(Icons.clear_all_sharp, size: 25,color: Colors.black,
              ),
              title: Text('Furniture',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
            ListTile(
              onTap: (){
              },
              leading: Icon(Icons.add_card, size: 25,
                color:Colors.black,),
              title: Text('Electronics',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                  color:Colors.black,),
              ),
            ),
            ListTile(
              onTap: (){
              },
              leading: Icon(Icons.production_quantity_limits, size: 25,
                color: Colors.black,
              ),
              title: Text('Cleaning Products',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
            Container(
              child: Divider(thickness: 2,),
            ),
            Text(' More Items', style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            ListTile(
              // hoverColor: Colors.black,
              onTap: (){},
              leading: Icon(Icons.electric_bolt_outlined, size: 25,
              ),
              tileColor: Colors.amberAccent,
              title: Text('Fashion',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),

            ListTile(
              onTap: (){},
              leading: Icon(Icons.perm_contact_calendar_outlined, size: 25,
              ),
              title: Text('Clothes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.local_grocery_store_sharp, size: 25,
              ),
              title: Text('Groceries',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.sports_esports_outlined, size: 25,
              ),
              title: Text('Sports',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.health_and_safety, size: 25,
              ),
              title: Text('Health & Beauty',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          //ScreenBackground(context),
          Container(
              child:Loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("ProductName",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Name'),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("ProductCode",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Code'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("Img",Textvalue);
                      },
                      decoration: AppInputDecoration('Product Image'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("UnitPrice",Textvalue);
                      },
                      decoration: AppInputDecoration('Unit Price'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("TotalPrice",Textvalue);
                      },
                      decoration: AppInputDecoration('Total Price'),
                    ),

                    SizedBox(height: 20),

                    AppDropDownStyle(
                        DropdownButton(
                          value:FormValues['Qty'] ,
                          items:[
                            DropdownMenuItem(child: Text('Select Qt'),value: "",),
                            DropdownMenuItem(child: Text('1 pcs'),value: "1 pcs",),
                            DropdownMenuItem(child: Text('2 pcs'),value: '2 pcs',),
                            DropdownMenuItem(child: Text('3 pcs'),value: '3 pcs',),
                            DropdownMenuItem(child: Text('4 pcs'),value: '4 pcs',),
                          ],
                          onChanged: (Textvalue){
                            InputOnChange("Qty",Textvalue);
                          },
                          underline: Container(),
                          isExpanded: true,
                        )
                    ),

                    SizedBox(height: 20),

                    Container(
                        child:ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: (){
                              FormOnSubmit();
                            },
                            child: SuccessButtonChild('Submit'),
                        )
                    )
                  ],
                ),
              )))



          )
        ],
      ),
    );
  }
}