import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:flutter/material.dart';

import 'gridviewitembin.dart';


class DragAbleGridViewDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DragAbleGridViewDemoState();
  }
}

class DragAbleGridViewDemoState extends State<DragAbleGridViewDemo>{

  List<ItemBin> itemBins=new List();
  String actionTxtEdit="编辑";
  String actionTxtComplete="完成";
  String actionTxt;
  var editSwitchController=EditSwitchController();

  @override
  void initState() {
    super.initState();
    actionTxt=actionTxtEdit;
    itemBins.add(new ItemBin("鲁班"));
    itemBins.add(new ItemBin("虞姬"));
    itemBins.add(new ItemBin("甄姬"));
    itemBins.add(new ItemBin("黄盖"));
    itemBins.add(new ItemBin("张飞"));
    itemBins.add(new ItemBin("关羽"));
    itemBins.add(new ItemBin("刘备"));
    itemBins.add(new ItemBin("曹操"));
    itemBins.add(new ItemBin("赵云"));
    itemBins.add(new ItemBin("孙策"));
    itemBins.add(new ItemBin("庄周"));
    itemBins.add(new ItemBin("廉颇"));
    itemBins.add(new ItemBin("后裔"));
    itemBins.add(new ItemBin("妲己"));
    itemBins.add(new ItemBin("荆轲"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("可拖拽GridView"),
        actions: <Widget>[
          new Center(
              child: new GestureDetector(
                child: new Container(
                  child: new Text(actionTxt,style: TextStyle(fontSize: 19.0),),
                  margin: EdgeInsets.only(right: 12),
                ),
                onTap: (){
                  changeActionState();
                  editSwitchController.editStateChanged();
                },
              )
          )
        ],
      ),
      body: new DragAbleGridView(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(new Radius.circular(3.0)),
          border: new Border.all(color: Colors.blue),
        ),
        mainAxisSpacing:10.0,
        crossAxisSpacing:10.0,
        deleteIconName: "images/close.png",
        deleteIconMarginTopAndRight: 6.0,
        itemPadding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
        childAspectRatio:1.8,
        crossAxisCount: 4,
        itemBins:itemBins,
        editSwitchController:editSwitchController,
        child: (int position){
          return new Text(
            itemBins[position].data,
            style: new TextStyle(fontSize: 16.0,color: Colors.blue),);
        },
        editChangeListener: (){
          changeActionState();
        },
      ),
    );
  }

  void changeActionState(){
    if(actionTxt==actionTxtEdit){
      setState(() {
        actionTxt=actionTxtComplete;
      });
    }else{
      setState(() {
        actionTxt=actionTxtEdit;
      });
    }
  }
}





