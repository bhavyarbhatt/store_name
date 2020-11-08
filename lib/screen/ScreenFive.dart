import 'package:flutter/material.dart';
import 'package:store_name/models/storeInfo.dart';
import 'package:store_name/screen/ScreenFour.dart';
import 'package:store_name/screen/ScreenThree.dart';
import 'package:store_name/screen/screenOne.dart';
import 'package:store_name/screen/screenTwo.dart';
import 'package:store_name/services/api_manager.dart';
import 'package:store_name/widgets/clipOvalWidget.dart';



class ScreenFive extends StatefulWidget {

  @override
  _ScreenFiveState createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {

  void screen(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenOne()),
    );
  }
  void screenTwo(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenTwo()),
    );
  }
  void screenFive(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenFive()),
    );
  }
  void screenThree(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenThree()),
    );
  }
  void screenFour(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenFour()),
    );
  }

  Future<StoreModel> _storeModel;

  @override
  void initState() {
    _storeModel = API_Manager().getStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Store Name'),
      ),
      body: Container(
        child: FutureBuilder<StoreModel>(
          future: _storeModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    var results = snapshot.data.result[4];
                    return Container(
                      height: 600,
                      width: 250,
                      margin: const EdgeInsets.all(0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  results.image,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(height: 20,) ,
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    results.title,
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    results.description,
                                    maxLines: 3,
                                    //overflow: TextOverflow.ellipsis,
                                  ),

                                  SizedBox(
                                    height: 10.00,
                                  ),

                                  Row(
                                    children: [
                                      ClipOvalWidget(onTap: (){
                                        screen();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenTwo();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenFive();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenFour();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenTwo();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenFive();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenThree();
                                      },),
                                      ClipOvalWidget(onTap: (){
                                        screenFive();
                                      },),

                                    ],
                                  ),


                                  SizedBox(
                                    height: 10.00,
                                  ),

                                  Center(
                                    child: RaisedButton(
                                        color: Colors.blue,
                                        child: Text('SlideShare'),
                                        onPressed: (){}),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
