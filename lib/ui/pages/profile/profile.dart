part of '../pages.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = 'USMAN ABDUL RAHMAN';
  String email = 'usman@hpu-mining.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back,color: Colors.black,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homeDashboard()),
                        );
                      },
                    ),
                    title: const Text('Profile Fuelman',
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20, bottom:20, left: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(Icons.account_circle,color: Coloring.mainColor,size: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left:15),
                              child: Text(
                                  '$nama',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                  '$email ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Color(0xffAAAAAA),
                                      fontFamily: Fonts.REGULAR,fontSize: 12)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Divider(
                      color: Color(0xffF5F5F5),
                      thickness: 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 15),
                    child: Text(
                        'Personal Data',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(right:15,left:20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                  'NIK',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('tapped.');
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                                ))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[70],
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                  'Ubah Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('tapped.');
                                },
                                child: Padding(
                                  padding:EdgeInsets.only(right: 15),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                                ))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[70],
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                  'Shift',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('tapped.');
                                },
                                child: Padding(
                                  padding:EdgeInsets.only(right: 15),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 15),
                    child: Divider(
                      color: Color(0xffF5F5F5),
                      thickness: 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 15),
                    child: Text(
                        'Fuel Truck',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(right:15,left:20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                  'Fuel Truck ID',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('tapped.');
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                                ))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[70],
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                  'Lansiran Fuel Truck',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print('tapped.');
                                },
                                child: Padding(
                                  padding:EdgeInsets.only(right: 15),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                                ))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[70],
                          thickness: 1,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 15),
                    child: Divider(
                      color: Color(0xffF5F5F5),
                      thickness: 30,
                    ),
                  ),
                ],
              ),
    );
  }
}
