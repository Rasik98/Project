import 'package:flutter/material.dart';

class TeamFolder extends StatefulWidget {
  const TeamFolder({super.key, required String foldername});

  @override
  State<TeamFolder> createState() => _TeamFolderState();
}

class _TeamFolderState extends State<TeamFolder> {
   double availableScreenWidth = 0;
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
     availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25, vertical: 25),
          alignment: Alignment.bottomCenter,
          height: 150,
          decoration: BoxDecoration(color: Colors.blue.shade800,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Riotters",
              style: TextStyle(color: Colors.white, fontSize: 26,
              fontWeight: FontWeight.bold),),
              Text("Team folder",
              style: TextStyle(color: Colors.white, fontSize: 17,),
              ),
            ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.1)),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                  ),
                  onPressed: () { },
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.1)),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 28,
                      color: Colors.white,
                  ),
                  onPressed: () { },
                  ),
                ),
              ],),
            ],),
        ),

        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            RichText( text: 
            const TextSpan(text: "Storage",
              style: TextStyle(
                color: Colors.black, fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              children: [
                TextSpan(text: "9.1/10GB",
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16),
                ),
              ]),
           ),

           const Text("Upgrade",
           style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.blue,
           ),
           ),
          ],
         ),
        ),

        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
            builFileSizeChart("SOURCES",Colors.blue, .3),
            const SizedBox(width:2,),
            builFileSizeChart("DOCS",Colors.red, .25),
            const SizedBox(width:2,),
            builFileSizeChart("IMAGES",Colors.amber, .20),
            const SizedBox(width:2,),
            builFileSizeChart("",Colors.grey.shade300, .23),
          ],
          ),
        ),
        const SizedBox(height: 10,),
        const Divider(height: 30,),

        Expanded(child: 
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const Text("Recently updated",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),
            
            Row(
              children: [
                buildFileColumn('sketch', 'desktop', '.sketch'),
                SizedBox(width: availableScreenWidth * .03),
                buildFileColumn('sketch', 'mobile', '.sketch'),
                SizedBox(width: availableScreenWidth * .03),
                buildFileColumn('prd', 'interaction', '.prd'),
              ],
            ),
            const Divider(height: 60),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Projects",
                style: TextStyle(fontWeight: FontWeight.bold, 
                fontSize: 18, color: Colors.black),),
                Text("Create new",
                style: TextStyle(fontWeight: FontWeight.bold, 
                fontSize: 16, color: Colors.blue),),
              ],
            ),

            const SizedBox(height: 15),
            buildProjectRow("Download"),
            buildProjectRow("Pictures"),
            buildProjectRow("Music"),
            buildProjectRow("Other"),
          ],
        ),
        ),
      ],),

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

            Navigator.pushNamed(context, '/ProjectPage');
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

  Widget buildProjectRow(String foldername) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute<void>(
        //   builder: (BuildContext context) => ProjectPage(
        //     foldername: foldername,),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.folder, size: 28, color: Colors.blue[200],),
              const SizedBox(width: 10),
              Text(foldername,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
          IconButton(onPressed: () {},
          icon: const Icon(Icons.more_vert),)
          ],
        ),
      ),
    );
  }

  Column buildFileColumn(String image, String filename, String extension) {
    return Column(
                children: [
                  Container(
                    width: availableScreenWidth *.31,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                    height: 110,
                    padding: const EdgeInsets.all(33),
                    child: Image.asset("assets/images/$image.png"),
                  ),
                  RichText(
                    text: TextSpan(
                      text: filename,
                      style: const TextStyle(color: Colors.black,
                      fontSize: 16),
                      children: [
                        TextSpan(text: extension,
                      style: const TextStyle(color: Colors.black,
                      fontSize: 14, fontWeight: FontWeight.w300),)
                      ]
                      ),
                      ),
                ],
              );
  }

  Column builFileSizeChart(String title, Color color, double widthPercentage)
  { return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: availableScreenWidth * widthPercentage,
                height: 4,
                color: color,
              ),

          const SizedBox(height: 10),

          Text(title,
           style: const TextStyle(fontSize: 10,
           fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}