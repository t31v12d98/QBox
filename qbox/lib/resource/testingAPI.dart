
import 'package:flutter/material.dart';
import 'package:qbox/model/account.dart';
import 'package:qbox/network/network_request.dart';

class TestingAPI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestingAPI();
  }
}

class _TestingAPI extends State<TestingAPI> {
  List<Account> accountData = <Account>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchPosts().then((dataFormSever) {
      setState(() {
        accountData = dataFormSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP Request")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: accountData.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${accountData[index].name}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            accountData[index].website.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ));
                  }))
        ],
      ),
    );
  }
}
