import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:path/path.dart';
//import 'package:camera/camera.dart';

class Imagepicker extends StatefulWidget{
  const Imagepicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImagepickerState();
  }
}

class ImagepickerState extends State<Imagepicker>{

  ImagePicker pickImage = ImagePicker();
  File? imageFile;

  final folderController = TextEditingController();
  String? nameOfFolder;
  String? actualFileName;

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
                baseimage(),
                showpath(),
                option(),
                fetchpath(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // show image
  Widget baseimage(){
    return Container(
      child: Image(
            image: (imageFile == null) ? AssetImage('assets/images/bear.png') : FileImage (imageFile!) as ImageProvider,
            //image: AssetImage('assets/images/bear.png'),
        height: 300,
        width: 300,
      ),
    );
  }

  // show path of the image
  Widget showpath(){
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "$imageFile",
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      ),),
    );
  }

  // show path of the image
  Widget option() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () {
          selectImage();
        },
        child: Text("Select new images"),
      ),
    );
  }

  // show path of the image
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
              onPressed: () async {
                if (nameOfFolder != null) {
                  await callFolderCreationMethod('$nameOfFolder');
                  setState(() {
                    nameOfFolder = null;
                  });
                }
              },
              child: Text('Add Folder')),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "$actualFileName",
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),),
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
    // ignore: unused_local_variable
    var fileName = await createdir(folderInAppDocDir);
    print(fileName);
    setState(() {
      actualFileName = fileName;
    });
  }

  // pick image from gallery
    selectImage() async {
      var imagefile = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      setState(() {
        imageFile = File((imagefile)!.path);
      });
      print('imagefile.path');
    }
}
