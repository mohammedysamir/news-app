import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  List<SideMenuItem> sidemenu=[
    SideMenuItem(titledata: 'Categories', iconData: Icons.list),
    SideMenuItem(titledata: 'Settings', iconData: Icons.settings),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 42),
          color: Theme.of(context).primaryColor,
          child: Center(child:
           Text('News App!',
           style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24  )))
        ),
        Expanded(
          child: ListView.builder(
            itemCount: sidemenu.length,
            itemBuilder: (buildcontext,index){
              return SideMenuWidget(sidemenuitem: sidemenu[index]);
            }),
        )
      ],
      
    );
  }
}
class SideMenuItem{
 late String titledata;
 late IconData iconData;
 SideMenuItem({required this.titledata,required this.iconData});
}
class SideMenuWidget extends StatelessWidget {
  SideMenuItem sidemenuitem;
  SideMenuWidget({required this.sidemenuitem});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children: [
       Padding(
         padding: const EdgeInsets.all(12.0),
         child: Icon(sidemenuitem.iconData),
       ),
       Text(sidemenuitem.titledata),
      ],
      
    );
  }
}