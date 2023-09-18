import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());
}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: myapp());
  }

}

class myapp extends StatelessWidget {
  get hint => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Photo Gallery') ,),

      ),
      body:ListView(
        children:[Text("Welcome to My Photo Gallery!",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),

        ),

          Column(
            children: [
              Padding(padding: EdgeInsets.all(15),),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Search for photos..',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple))
                ),

              ),
            ],


          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('“Photos Uploaded Successfully'),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        'https://via.placeholder.com/150',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Photos $index'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),


          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Photo 1'),
            subtitle: Text('Descripition for photo'),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Photo 2'),
            subtitle: Text('Descripition for photo'),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Photo 3'),
            subtitle: Text('Descripition for photo'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photos Uploaded Successfully!'),
                ),
              );
            },
            child:Icon(Icons.download_sharp,),
          ),



        ],
      ),


    );
  }
}