import 'package:flutter/material.dart';


class ProjectPage extends StatefulWidget {
  final String foldername;
  const ProjectPage({super.key, required this.foldername});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 25),
              alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Chatbox',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 26
                    ),),
                    Text('Project',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 17
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: 
                      BorderRadius.circular(15),
                      color: Colors.black.withOpacity(.1)),
                      child: IconButton( icon: const Icon (
                        Icons.search_outlined,
                        size: 28, color: Colors.blue,),
                        onPressed: (){},
                        ),
                    ),

                    const SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(borderRadius: 
                      BorderRadius.circular(15),
                      color: Colors.black.withOpacity(.1)),
                      child: IconButton( icon: const Icon (
                        Icons.share_outlined,
                        size: 28, color: Colors.blue,),
                        onPressed: (){},
                        ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, left: 25),
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildAvatar('Lara','img1'),
                buildAvatar('Lara','img2'),
                buildAvatar('Lara','img3'),
                buildAvatar('Lara','img4'),
                buildAvatar('Lara','img5'),
                buildAvatar('Lara','img6'),
                buildAvatar('Lara','img7'),
              ],
            ),
          ),
          const Divider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Files",
                      style: TextStyle(fontWeight: FontWeight.bold, 
                      fontSize: 18, color: Colors.black),),
                      Text("Create new",
                      style: TextStyle(fontWeight: FontWeight.bold, 
                      fontSize: 16, color: Colors.blue),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  buildFileRow('Assets', true),
                  buildFileRow('DCIM', false),
                  buildFileRow('Documents', false),
                  buildFileRow('DOwnload', false),
                  buildFileRow('Movies', false),
                  buildFileRow('Music', false),
                  buildFileRow('Pictures', false),
                  buildFileRow('Recordings', false),
                ],
              ),
            ),
        ],
      ),
       floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,boxShadow: [
          BoxShadow(color: Colors.white,
          spreadRadius: 7, blurRadius: 13),
        ]),
        child: FloatingActionButton(
          shape: const CircleBorder(),//
          child: const Icon(Icons.add),
          onPressed: (){}
        ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.white,
            spreadRadius: 30, blurRadius: 70),
            ]),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });

            Navigator.pushNamed(context, '/TeamFolder');
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const[
            BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Folder',
            ),
          ]
        ),
      ),
    );
  }

  Widget buildFileRow(String foldername, bool showAlert) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute<void>(
        //   builder: (BuildContext context) => TeamFolder(
        //     foldername: foldername,),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row( children: [
                Stack(children: [
                  Icon(Icons.folder,
                  size: 28, color: Colors.blue[200],
                  ),
                  if(showAlert)
                   Positioned(
                    right: -1,
                     top: 2,
                     child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                        ),
                        child: const CircleAvatar(
                          radius: 3,backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(foldername,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15),),
                ],
              ),
                IconButton(onPressed: () {},
                icon: const Icon(Icons.more_vert),)
          ],
        ),
      ),
    );
  }

  Padding buildAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.asset('assets/images/$filename.jpeg').image,
                    ),
                    const SizedBox(height: 5,),
                    Text(name, 
                    style: const TextStyle(fontSize: 15,
                    fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
    );
  }
}