import 'package:flutter/material.dart';
import 'package:fluxestore/data/collections_data.dart';
import 'package:fluxestore/presentation/reuseables/collections_list_tile.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              width: double.infinity,
              height: 270,
              "https://fashinza.com/textile/wp-content/uploads/2023/03/Mononchromes-1024x683.jpg",
              // "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D"
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: IconButton(
                    style: ButtonStyle(
                      // fixedSize: const MaterialStatePropertyAll(Size(10, 10)),
                      elevation: const MaterialStatePropertyAll(5),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      shadowColor: MaterialStatePropertyAll(
                        Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 45, top: 60),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Text(
                    "Autumn Collection 2023",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 1.0,
            minChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SizedBox(
                  height: double.infinity,
                  width: 141,
                  child: GridView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 8, // Adjust spacing as needed
                      mainAxisSpacing: 8,
                    ),
                    controller:
                        scrollController, // Assign scrollController here

                    itemBuilder: (context, index) {
                      var data = seasonCollectionsData[0];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: CollectionsListTile(
                          product: data,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
