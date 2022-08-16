import 'package:ebook/FileUpload.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class IOFile extends StatefulWidget{
  const IOFile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IOFileState();
  }
}

class IOFileState extends State<IOFile>{

  String? nameOfFolder;
  String? actualFileName;
  final folderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fetchpath(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // show image
  Widget fetchpath(){
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: folderController,
                autofocus: true,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "To create folder, enter folder name"),
                onChanged: (val) {
                  setState(() {
                    nameOfFolder = folderController.text;
                    print(nameOfFolder);
                  });
                },
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),),
              ElevatedButton(
                child: Text("Submit", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                onPressed: () async{
                  if(nameOfFolder != null)
                    {await callFolderCreationMethod('$nameOfFolder');
                    setState(() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Alert'),
                        content: Text("New directory has been created!!! \nNew path is : \n$actualFileName"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FileUpload()),);
                                },
                              child: const Text("OK",))
                        ],
                      );
                      },
                  );
                    });}
                  },
              ),
            ]
        )
    );
  }

  // create directory
  Future<String> createdir(String folderName) async{
    final directory = await getApplicationDocumentsDirectory(); //Get Document Directory
    final Directory _appDocDirFolder = Directory('${directory.path}/$folderName/');
    if (await _appDocDirFolder.exists()) {
      return _appDocDirFolder.path;  //if folder already exists return path
    }
    else{
      //if folder not exists then create folder and return its path
      final Directory _appDocDirNewFolder =  await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  callFolderCreationMethod(String folderInAppDocDir) async {
    var fileName = await createdir(folderInAppDocDir);
    print(fileName);
    setState(() {
      actualFileName = fileName;
    });
  }
}