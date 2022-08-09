
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path/path.dart';






class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

PlatformFile? pickedfile;

// Create a storage reference from our app
final storageRef = FirebaseStorage.instance;

  Future Uplodefile() async {
final result=await FilePicker.platform.pickFiles();
if(result==null)return;
setState(() {
  pickedfile=result.files.first;
});



// Create a reference to "mountains.jpg"
final mountainsRef = storageRef.ref().child("files/${pickedfile!.name}");
File file = File(pickedfile!.path!);

try {
  await mountainsRef.putFile(file);
} on FirebaseException catch (e) {
  print(e);
}
String downloadUrl=await mountainsRef.getDownloadURL();
print("Dowmload Url : ${downloadUrl}");
String name = basename(file.path);
  }

Future<List<Map<String, dynamic>>> _loadfiles() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storageRef.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "name": file.name,
    
      });
    });

    return files;
  }


  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storageRef.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           
            if(pickedfile !=null)
          Expanded(
              child: FutureBuilder(
                future: _loadfiles(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> file =
                            snapshot.data![index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(file['url']),
                            title: Text(file['name']),
                            trailing: IconButton(
                              onPressed: () => _delete(file['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               
                ElevatedButton(
                    onPressed: () => Uplodefile(),
                
                    child: const Text('pick file')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}