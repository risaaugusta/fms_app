part of '../pages.dart';

class HomeManual extends StatefulWidget {
  const HomeManual({Key? key}) : super(key: key);

  @override
  _HomeManualState createState() => _HomeManualState();
}

class _HomeManualState extends State<HomeManual> {
  late final int index;
  bool isChecked = false;
  List<Map> check = [];
  List <CheckboxValue> checkboxValue = [
    CheckboxValue(name: "tr_sounding", isSelected:false),
    CheckboxValue(name: "tr_fuel_transfer", isSelected:false),
    CheckboxValue(name: "tr_refueling", isSelected:false),
    CheckboxValue(name: "tr_baps", isSelected:false),
    CheckboxValue(name: "tr_fuel_attendance", isSelected:false),
  ];

  @override
  initState(){
    Global.getData().then((value) {
      setState(() {
        check = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.2,
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => homeDashboard()),
                );
              },
            ),
            title: const Text('Sinkronisasi',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: Fonts.REGULAR,
                    fontSize: 18)),

            backgroundColor: Colors.white,
            bottom: const TabBar(
              physics: NeverScrollableScrollPhysics(),
              indicatorColor: Coloring.mainColor,
              tabs: [
                Tab(
                  child: Text(
                      'Download',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Coloring.mainColor,
                          fontFamily: Fonts.REGULAR,fontSize: 12)
                  ),),
                Tab(
                  child: Text(
                      'Upload',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Coloring.mainColor,
                          fontFamily: Fonts.REGULAR,fontSize: 12)
                  ),),
              ],
            ),

          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:  <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async{
                              LoadingBar.dialogLoading(context);

                              var downloadEquipment = await ApiService.downloadEquipment();
                              var downloadEmployee = await ApiService.downloadEmployee();
                              var downloadStorage = await ApiService.downloadStorage();
                              var downloadShift = await ApiService.downloadShift();
                              var downloadBudget = await ApiService.downloadBudget();
                              var downloadRefueling = await ApiService.downloadRefueling();

                              for(int i=0; i < downloadEquipment.length; i++){
                              var msEquipment = new MsEquipment(
                                equipment_id : downloadEquipment[i]['equipment_id'] ?? '',
                                manufacturer : downloadEquipment[i]['manufacturer'] ?? '',
                                model_number : downloadEquipment[i]['model_number'] ?? '',
                                tank_capacity : downloadEquipment[i]['tank_capacity'] ?? '',
                                category : downloadEquipment[i]['category'],
                                category_desc : downloadEquipment[i]['category_desc'],
                                auth_group : downloadEquipment[i]['auth_group'],
                                auth_text : downloadEquipment[i]['auth_text'],
                                company_code : downloadEquipment[i]['company_code'],
                                changed_by_system : downloadEquipment[i]['changed_by_system'],
                                createdBy : downloadEquipment[i]['createdBy']?? '',
                                created_at : downloadEquipment[i]['created_at'],
                                updatedBy : downloadEquipment[i]['updatedBy'],
                                updated_at : downloadEquipment[i]['updated_at'],
                                load_capacity : downloadEquipment[i]['load_capacity'] ?? '',
                                load_capacity_unit : downloadEquipment[i]['load_capacity_unit'] ?? '',
                                planner_group : downloadEquipment[i]['planner_group'] ?? '',
                                main_work_center : downloadEquipment[i]['main_work_center'] ?? '',
                              );
                              var testing = await FmsDatabase.instance.createEquipment(msEquipment).then((value) {
                                setState(() {
                                  Global.equipmentStatusDownloaded =  'Berhasil';
                                });
                              } ).onError((error, stackTrace) {
                                setState(() {
                                  Global.equipmentStatusDownloaded = 'Gagal';
                                });
                              });
                              };

                              for(int i=0; i < downloadEmployee.length; i++){
                                var msEmployee = new MsEmployee(
                                  EmployeeID : downloadEmployee[i]['EmployeeID'] ?? '',
                                  EmployeeName : downloadEmployee[i]['EmployeeName'] ?? '',
                                  EmployeeAddress : downloadEmployee[i]['EmployeeAddress'] ?? '',
                                  EmployeePhone: downloadEmployee[i]['EmployeePhone'] ?? '',
                                  positionID: (downloadEmployee[i]['positionID']).toString() ,
                                  SiteId: downloadEmployee[i]['SiteId'] ?? '',
                                  DeptID: (downloadEmployee[i]['DeptID']).toString() ,
                                  CreatedBy: downloadEmployee[i]['CreatedBy'] ?? '',
                                  UpdatedBy: downloadEmployee[i]['UpdatedBy'] ?? '',
                                  created_at: downloadEmployee[i]['created_at'] ?? '',
                                  updated_at: downloadEmployee[i]['updated_at'] ?? '',
                                  EMAIL_ADDRESS: downloadEmployee[i]['EMAIL_ADDRESS'] ?? '',
                                );
                                var testing = await FmsDatabase.instance.createEmployee(msEmployee)
                                    .then((value) {
                                  setState(() {
                                    Global.employeeStatusDownloaded =  'Berhasil';
                                  });
                                } ).onError((error, stackTrace) {
                                  setState(() {
                                    Global.employeeStatusDownloaded = 'Gagal';
                                  });
                                });
                              };

                              for(int i=0; i < downloadStorage.length; i++){
                                var msStorage = new MsStorage(
                                  storageId : (downloadStorage[i]['storageId']).toString() ,
                                  unitId : downloadStorage[i]['unitId'] ?? '',
                                  storageCode : downloadStorage[i]['storageCode'] ?? '',
                                  sLocDescription : downloadStorage[i]['sLocDescription'] ?? '',
                                  capacity : (downloadStorage[i]['capacity']).toString(),
                                  isAudited : (downloadStorage[i]['isAudited']).toString(),
                                  isActive : (downloadStorage[i]['isActive']).toString() ,
                                  dateTime : downloadStorage[i]['dateTime'] ?? '',
                                  createdBy : downloadStorage[i]['createdBy'] ?? '',
                                  createdTime : downloadStorage[i]['createdTime'] ?? '',
                                  modifiedBy : downloadStorage[i]['modifiedBy'] ?? '',
                                  modifiedTime : downloadStorage[i]['modifiedTime'] ?? '',
                                  siteID : downloadStorage[i]['siteID'] ?? '',
                                );
                                var testing = await FmsDatabase.instance.createStorage(msStorage)
                                .then((value) {
                                  setState(() {
                                    Global.storageStatusDownloaded =  'Berhasil';
                                  });
                                } ).onError((error, stackTrace) {
                                  setState(() {
                                    Global.storageStatusDownloaded = 'Gagal';
                                  });
                                });
                              };

                              for(int i=0; i < downloadShift.length; i++){
                                var msShift = new MsShift(
                                  ShiftId : downloadShift[i]['shift_id'] ?? '' ,
                                  ShiftName : downloadShift[i]['ShiftName'] ?? '',
                                  siteId : downloadShift[i]['site_id'] ?? '',
                                  ShiftStartTime : downloadShift[i]['ShiftStartTime'] ?? '',
                                  ShiftEndTime : downloadShift[i]['ShiftEndTime'] ?? '',
                                );
                                var testing = await FmsDatabase.instance.createShift(msShift)
                                    .then((value) {
                                  setState(() {
                                    Global.shiftStatusDownloaded =  'Berhasil';
                                  });
                                } ).onError((error, stackTrace) {
                                  setState(() {
                                    Global.shiftStatusDownloaded = 'Gagal';
                                  });
                                });
                              };

                              for(int i=0; i < downloadBudget!.data!.length; i++){
                                var msBudget = new Datum(
                                  budgetId :  downloadBudget.data![i].budgetId  ,
                                  equipmentId : downloadBudget.data![i].equipmentId ,
                                  siteId : downloadBudget.data![i].siteId  ,
                                  fuelConsumption : downloadBudget.data![i].fuelConsumption  ,
                                  modelNumber : downloadBudget.data![i].modelNumber  ,
                                );
                                var testing = await FmsDatabase.instance.createBudget(msBudget)
                                    .then((value) {
                                  setState(() {
                                    Global.budgetStatusDownloaded =  'Berhasil';
                                  });
                                } ).onError((error, stackTrace) {
                                  setState(() {
                                    Global.budgetStatusDownloaded = 'Gagal';
                                  });
                                });
                              };

                              for(int i=0; i < downloadRefueling!.data!.length; i++){
                                var refueling = new Refuel(
                                  refuelingId :  downloadRefueling.data![i].refuelingId,
                                  unitCode :  downloadRefueling.data![i].unitCode,
                                  unitType :  downloadRefueling.data![i].unitType,
                                  hmInput :  downloadRefueling.data![i].hmInput,
                                  namaOperator :  downloadRefueling.data![i].namaOperator,
                                  totalisatorBegin :  downloadRefueling.data![i].totalisatorBegin,
                                  totalisatorEnd :  downloadRefueling.data![i].totalisatorEnd,
                                  fuelConsumption :  downloadRefueling.data![i].fuelConsumption,
                                  budget :  downloadRefueling.data![i].budget,
                                  status :  downloadRefueling.data![i].status,
                                  photoMeterFuel :  downloadRefueling.data![i].photoMeterFuel,
                                  photoHmUnit :  downloadRefueling.data![i].photoHmUnit,
                                  shiftId :  downloadRefueling.data![i].shiftId,
                                  siteId :  downloadRefueling.data![i].siteId,
                                  createdBy :  downloadRefueling.data![i].createdBy,
                                  createdAt :  downloadRefueling.data![i].createdAt
                                );
                                var testing = await FmsDatabase.instance.createLastRefueling(refueling)
                                    .then((value) {
                                  setState(() {
                                    Global.refuelingStatusDownloaded =  'Berhasil';
                                  });
                                } ).onError((error, stackTrace) {
                                  setState(() {
                                    Global.refuelingStatusDownloaded = 'Gagal';
                                  });
                                });
                              };

                              if( Global.equipmentStatusDownloaded.isNotEmpty && Global.storageStatusDownloaded.isNotEmpty
                                  && Global.employeeStatusDownloaded.isNotEmpty && Global.shiftStatusDownloaded.isNotEmpty
                                  && Global.budgetStatusDownloaded.isNotEmpty && Global.refuelingStatusDownloaded.isNotEmpty)
                              {
                                LoadingBar.hideLoadingDialog(context);
                                _dialogDownloadAlert();
                              }

                            },
                            child: Text('Download All',
                                style: TextStyle(
                                    color: Color(0xffF0C419),
                                    fontFamily: Fonts.REGULAR,
                                    fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 0,
                          children: [
                            Container(height:100,
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child: Card(
                                elevation: 0.8,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Data MsEquipment',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(color: Colors.black,
                                                  fontFamily: Fonts.REGULAR,fontSize: 18)
                                          ),
                                          Text(
                                              Global.time,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.grey,
                                                  fontFamily: Fonts.REGULAR,fontSize: 12)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Global.equipmentStatusDownloaded == 'Berhasil' ?
                                    Icon(
                                      Icons.check_circle,
                                      color: Coloring.mainColor,
                                      size: 20,
                                    ) : Global.equipmentStatusDownloaded == 'Gagal' ?
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 20,
                                    ) :
                                    Icon(
                                      Icons.sync,
                                      color: Colors.grey,
                                      size: 20,
                                    )
                                  ],
                                )
                            ),
                              ),
                            Container(height:100,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Card(
                                  elevation: 0.8,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Data MsEmployee',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(color: Colors.black,
                                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                                            ),
                                            Text(
                                                Global.time,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey,
                                                    fontFamily: Fonts.REGULAR,fontSize: 12)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Global.employeeStatusDownloaded == 'Berhasil' ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Coloring.mainColor,
                                        size: 20,
                                      ) : Global.employeeStatusDownloaded == 'Gagal' ?
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 20,
                                      ) :
                                      Icon(
                                        Icons.sync,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(height:100,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Card(
                                  elevation: 0.8,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Data MsStorages',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(color: Colors.black,
                                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                                            ),
                                            Text(
                                                Global.time,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey,
                                                    fontFamily: Fonts.REGULAR,fontSize: 12)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Global.storageStatusDownloaded == 'Berhasil' ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Coloring.mainColor,
                                        size: 20,
                                      ) : Global.storageStatusDownloaded == 'Gagal' ?
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 20,
                                      ) :
                                      Icon(
                                        Icons.sync,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(height:100,
                              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Card(
                                  elevation: 0.8,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Data MsShift',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(color: Colors.black,
                                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                                            ),
                                            Text(
                                                Global.time,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey,
                                                    fontFamily: Fonts.REGULAR,fontSize: 12)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Global.shiftStatusDownloaded == 'Berhasil' ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Coloring.mainColor,
                                        size: 20,
                                      ) : Global.shiftStatusDownloaded == 'Gagal' ?
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 20,
                                      ) :
                                      Icon(
                                        Icons.sync,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(height:100,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Card(
                                  elevation: 0.8,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Data MsBudget',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(color: Colors.black,
                                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                                            ),
                                            Text(
                                                Global.time,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey,
                                                    fontFamily: Fonts.REGULAR,fontSize: 12)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Global.budgetStatusDownloaded == 'Berhasil' ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Coloring.mainColor,
                                        size: 20,
                                      ) : Global.budgetStatusDownloaded == 'Gagal' ?
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 20,
                                      ) :
                                      Icon(
                                        Icons.sync,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(height:100,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Card(
                                  elevation: 0.8,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Data Last Refueling',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(color: Colors.black,
                                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                                            ),
                                            Text(
                                                Global.time,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey,
                                                    fontFamily: Fonts.REGULAR,fontSize: 12)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Global.budgetStatusDownloaded == 'Berhasil' ?
                                      Icon(
                                        Icons.check_circle,
                                        color: Coloring.mainColor,
                                        size: 20,
                                      ) : Global.budgetStatusDownloaded == 'Gagal' ?
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 20,
                                      ) :
                                      Icon(
                                        Icons.sync,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async{
                              if(check.where((e) => e['check'] == true).length == 0){
                                return;
                              }

                              LoadingBar.dialogLoading(context);

                              var data = await FmsDatabase.instance.readId(check);
                              await ApiService.synchBaps(data['baps']!)
                              .then((value) {
                                setState(() {
                                  FmsDatabase.instance.dropBaps(data['baps']!.map((e) => e['baps_id'] as int).toList());
                                  Global.bapsSynchStatus =  'Berhasil';
                                });
                              } ).onError((error, stackTrace) {
                                setState(() {
                                  Global.bapsSynchStatus =  'Gagal';
                                  print('===TESTING BAPS ');
                                  print(error.toString());
                                });
                              });

                              await ApiService.synchSounding(data['sounding']!).then((value) {
                                setState(() {
                                  FmsDatabase.instance.dropSounding(data['sounding']!.map((e) => e['sounding_id'] as int).toList());
                                  // Global.getData().then((value) {
                                  //   check = value;
                                  // });
                                  Global.soundingSynchStatus =  'Berhasil';
                                });
                              }).onError((error, stackTrace) {
                                setState(() {
                                  Global.soundingSynchStatus =  'Gagal';
                                });
                              });

                           await ApiService.synchTransfer(data['transfer']!).then((value) {
                               setState(() {
                                 FmsDatabase.instance.dropTransfer(data['transfer']!.map((e) => e['transfer_id'] as int).toList());
                                 // Global.getData().then((value) {
                                 //   check = value;
                                 // });
                                 Global.transferSynchStatus =  'Berhasil';
                               });
                             } ).onError((error, stackTrace) {
                               setState(() {
                                 Global.transferSynchStatus =  'Gagal';
                               });
                             });

                           await ApiService.synchRefueling(data['refueling']!)
                                  .then((value) {
                                 setState(() {
                                   FmsDatabase.instance.dropRefueling(data['refueling']!.map((e) => e['refueling_id'] as int).toList());
                                   // Global.getData().then((value) {
                                   //   check = value;
                                   // });
                                   Global.refuelingSynchStatus =  'Berhasil';
                                 });
                               } ).onError((error, stackTrace) {
                                 setState(() {
                                   Global.refuelingSynchStatus =  'Gagal';
                                 });
                               });

                              await ApiService.synchAttendance(data['attendance']!).then((value) {
                                setState(() {
                                  FmsDatabase.instance.dropHistoryAttendance(data['attendance']!.map((e) => e['attendance_id'] as int).toList());
                                  // Global.getData().then((value) {
                                  //   check = value;
                                  // });
                                  Global.attendanceSynchStatus =  'Berhasil';
                                });
                              } ).onError((error, stackTrace) {
                                setState(() {
                                  Global.attendanceSynchStatus =  'Gagal';
                                });
                              });

                              setState(() {
                                Global.getData().then((value) {
                                  check = value;
                                });
                              });

                              if( Global.bapsSynchStatus.isNotEmpty && Global.soundingSynchStatus.isNotEmpty
                                  && Global.transferSynchStatus.isNotEmpty && Global.refuelingSynchStatus.isNotEmpty
                                  && Global.attendanceSynchStatus.isNotEmpty)
                              {
                                LoadingBar.hideLoadingDialog(context);
                                _dialogUploadAlert();
                              }

                            },
                            child: Text('Upload All',
                                style: TextStyle(
                                    color: Color(0xffF0C419),
                                    fontFamily: Fonts.REGULAR,
                                    fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                      // child: Wrap(
                      //   direction: Axis.horizontal,
                      //   spacing: 0,
                      //   children: [
                      //     FutureBuilder<List>(
                      //       future: FmsDatabase.instance.readBaps(), // a previously-obtained Future<String> or null
                      //       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           return ListView.builder(
                      //               physics: NeverScrollableScrollPhysics(),
                      //               shrinkWrap: true,
                      //               padding: const EdgeInsets.all(8),
                      //               itemCount: snapshot.data!.length  ,
                      //               itemBuilder: (BuildContext context, int index) {
                      //                 return Card(
                      //                   elevation: 0.8,
                      //                   shadowColor: Colors.grey,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                   child: InkWell(
                      //                       onTap: () {
                      //                         print('Card tapped.');
                      //                       },
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.start,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 20),
                      //                             child: SizedBox(
                      //                               height: 70,
                      //                               width: 30,
                      //                               child: CheckboxListTile(
                      //                                 title: Text(""),
                      //                                 value: checkboxValue[3].isSelected,
                      //                                 onChanged: (bool? value) {
                      //                                   if(value != null) {
                      //                                     setState(() {
                      //                                       checkboxValue[3].isSelected = value;
                      //                                     });
                      //                                   }
                      //                                 },
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Column(
                      //                             mainAxisAlignment: MainAxisAlignment.start,
                      //                             crossAxisAlignment: CrossAxisAlignment.start,
                      //                             children: [
                      //                               Text(
                      //                                   'Data baru BAPS',
                      //                                   textAlign: TextAlign.left,
                      //                                   style: TextStyle(color: Colors.black,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 18)
                      //                               ),
                      //                               Text(
                      //                                   snapshot.data![index]['created_at'],
                      //                                   textAlign: TextAlign.center,
                      //                                   style: TextStyle(color: Colors.grey,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 12)
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       )
                      //                   ),
                      //                 );
                      //               });
                      //         } else if (snapshot.hasError) {
                      //           return Container(
                      //             child: Text('Tidak ada data'),
                      //           );
                      //         } else {
                      //           return Text('');
                      //         }
                      //       },
                      //     ),
                      //     FutureBuilder<List>(
                      //       future: FmsDatabase.instance.readTransfer(), // a previously-obtained Future<String> or null
                      //       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           return ListView.builder(
                      //               physics: NeverScrollableScrollPhysics(),
                      //               shrinkWrap: true,
                      //               padding: const EdgeInsets.all(8),
                      //               itemCount: snapshot.data!.length  ,
                      //               itemBuilder: (BuildContext context, int index) {
                      //                 return Card(
                      //                   elevation: 0.8,
                      //                   shadowColor: Colors.grey,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                   child: InkWell(
                      //                       onTap: () {
                      //                         print('Card tapped.');
                      //                       },
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.start,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 20),
                      //                             child: SizedBox(
                      //                               height: 70,
                      //                               width: 30,
                      //                               child: CheckboxListTile(
                      //                                 title: Text(""),
                      //                                 value: checkboxValue[1].isSelected,
                      //                                 onChanged: (bool? value) {
                      //                                   if(value != null) {
                      //                                     setState(() {
                      //                                       checkboxValue[1].isSelected = value;
                      //                                     });
                      //                                   }
                      //                                 },
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Column(
                      //                             mainAxisAlignment: MainAxisAlignment.start,
                      //                             crossAxisAlignment: CrossAxisAlignment.start,
                      //                             children: [
                      //                               Text(
                      //                                   'Data baru Transfer',
                      //                                   textAlign: TextAlign.left,
                      //                                   style: TextStyle(color: Colors.black,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 18)
                      //                               ),
                      //                               Text(
                      //                                   snapshot.data![index]['created_at'],
                      //                                   textAlign: TextAlign.center,
                      //                                   style: TextStyle(color: Colors.grey,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 12)
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       )
                      //                   ),
                      //                 );
                      //               });
                      //         } else if (snapshot.hasError) {
                      //           return Container(
                      //             child: Text('Tidak ada data'),
                      //           );
                      //         } else {
                      //           return Text('');
                      //         }
                      //       },
                      //     ),
                      //     FutureBuilder<List>(
                      //       future: FmsDatabase.instance.readSounding(), // a previously-obtained Future<String> or null
                      //       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           return ListView.builder(
                      //               physics: NeverScrollableScrollPhysics(),
                      //               shrinkWrap: true,
                      //               padding: const EdgeInsets.all(8),
                      //               itemCount: snapshot.data!.length  ,
                      //               itemBuilder: (BuildContext context, int index) {
                      //                 return Card(
                      //                   elevation: 0.8,
                      //                   shadowColor: Colors.grey,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                   child: InkWell(
                      //                       onTap: () {
                      //                         print('Card tapped.');
                      //                       },
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.start,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 20),
                      //                             child: SizedBox(
                      //                               height: 70,
                      //                               width: 30,
                      //                               child: CheckboxListTile(
                      //                                 title: Text(""),
                      //                                 value: checkboxValue[1].isSelected,
                      //                                 onChanged: (bool? value) {
                      //                                   if(value != null) {
                      //                                     setState(() {
                      //                                       checkboxValue[1].isSelected = value;
                      //                                     });
                      //                                   }
                      //                                 },
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Column(
                      //                             mainAxisAlignment: MainAxisAlignment.start,
                      //                             crossAxisAlignment: CrossAxisAlignment.start,
                      //                             children: [
                      //                               Text(
                      //                                   'Data baru Sounding',
                      //                                   textAlign: TextAlign.left,
                      //                                   style: TextStyle(color: Colors.black,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 18)
                      //                               ),
                      //                               Text(
                      //                                   snapshot.data![index]['created_at'],
                      //                                   textAlign: TextAlign.center,
                      //                                   style: TextStyle(color: Colors.grey,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 12)
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       )
                      //                   ),
                      //                 );
                      //               });
                      //         } else if (snapshot.hasError) {
                      //           return Container(
                      //             child: Text('Tidak ada data'),
                      //           );
                      //         } else {
                      //           return Text('');
                      //         }
                      //       },
                      //     ),
                      //     // FutureBuilder<List>(
                      //     //   future: _listSounding() , // a previously-obtained Future<String> or null
                      //     //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //     //     List<Widget> children;
                      //     //     // sounding = snapshot;
                      //     //     if (snapshot.hasData) {
                      //     //
                      //     //       return ListView.builder(
                      //     //           scrollDirection: Axis.vertical,
                      //     //           shrinkWrap: true,
                      //     //           padding: const EdgeInsets.all(8),
                      //     //           itemCount: snapshot.data!.length  ,
                      //     //           itemBuilder: (BuildContext context, int index) {
                      //     //             return Card(
                      //     //               elevation: 0.8,
                      //     //               shadowColor: Colors.grey,
                      //     //               shape: RoundedRectangleBorder(
                      //     //                 borderRadius: BorderRadius.circular(10),
                      //     //               ),
                      //     //               child: InkWell(
                      //     //                   onTap: () {
                      //     //                     print('Card tapped.');
                      //     //                   },
                      //     //                   child: Row(
                      //     //                     mainAxisAlignment: MainAxisAlignment.start,
                      //     //                     children: <Widget>[
                      //     //                       Container(
                      //     //                         margin: EdgeInsets.symmetric(horizontal: 20),
                      //     //                         child: SizedBox(
                      //     //                           height: 70,
                      //     //                           width: 30,
                      //     //                           child: CheckboxListTile(
                      //     //                             title: Text(""),
                      //     //                             value: snapshot.data![index].isSelected == "true",
                      //     //                             onChanged: (bool? value) {
                      //     //                               // if(value != true) {
                      //     //                               // print(jsonDecode(snapshot.data![index]));
                      //     //                               setState(() {
                      //     //                                   FmsDatabase.instance.updateSounding(snapshot.data![0].soundingId.toString(), snapshot.data![0].isSelected);
                      //     //                                   snapshot.data![index].isSelected = value.toString();
                      //     //                                 });
                      //     //                               // }
                      //     //                             },
                      //     //                           ),
                      //     //                         ),
                      //     //                       ),
                      //     //                       Column(
                      //     //                         mainAxisAlignment: MainAxisAlignment.start,
                      //     //                         crossAxisAlignment: CrossAxisAlignment.start,
                      //     //                         children: [
                      //     //                           Text(
                      //     //                               'Data baru Sounding',
                      //     //                               textAlign: TextAlign.left,
                      //     //                               style: TextStyle(color: Colors.black,
                      //     //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
                      //     //                           ),
                      //     //                           Text(
                      //     //                               snapshot.data![index].createdAt,
                      //     //                               textAlign: TextAlign.center,
                      //     //                               style: TextStyle(color: Colors.grey,
                      //     //                                   fontFamily: Fonts.REGULAR,fontSize: 12)
                      //     //                           ),
                      //     //                         ],
                      //     //                       ),
                      //     //                     ],
                      //     //                   )
                      //     //               ),
                      //     //             );
                      //     //           });
                      //     //     } else if (snapshot.hasError) {
                      //     //       return Container(
                      //     //         child: Text('Tidak ada data'),
                      //     //       );
                      //     //     } else {
                      //     //       return Text('');
                      //     //     }
                      //     //   },
                      //     // ),
                      //     FutureBuilder<List>(
                      //       future: FmsDatabase.instance.readRefueling(), // a previously-obtained Future<String> or null
                      //       builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           return ListView.builder(
                      //               scrollDirection: Axis.vertical,
                      //               shrinkWrap: true,
                      //               padding: const EdgeInsets.all(8),
                      //               itemCount: snapshot.data!.length  ,
                      //               itemBuilder: (BuildContext context, int index) {
                      //                 return Card(
                      //                   elevation: 0.8,
                      //                   shadowColor: Colors.grey,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                   child: InkWell(
                      //                       onTap: () {
                      //                         print('Card tapped.');
                      //                       },
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.start,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             margin: EdgeInsets.symmetric(horizontal: 20),
                      //                             child: SizedBox(
                      //                               height: 70,
                      //                               width: 30,
                      //                               child: CheckboxListTile(
                      //                                 title: Text(""),
                      //                                 value: checkboxValue[2].isSelected,
                      //                                 onChanged: (bool? value) {
                      //                                   if(value != null) {
                      //                                     setState(() {
                      //                                       checkboxValue[2].isSelected = value;
                      //                                     });
                      //                                   }
                      //                                 },
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Column(
                      //                             mainAxisAlignment: MainAxisAlignment.start,
                      //                             crossAxisAlignment: CrossAxisAlignment.start,
                      //                             children: [
                      //                               Text(
                      //                                   'Data baru Refueling',
                      //                                   textAlign: TextAlign.left,
                      //                                   style: TextStyle(color: Colors.black,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 18)
                      //                               ),
                      //                               Text(
                      //                                   snapshot.data![index]['created_at'],
                      //                                   textAlign: TextAlign.center,
                      //                                   style: TextStyle(color: Colors.grey,
                      //                                       fontFamily: Fonts.REGULAR,fontSize: 12)
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       )
                      //                   ),
                      //                 );
                      //               });
                      //         } else if (snapshot.hasError) {
                      //           return Container(
                      //             child: Text('Tidak ada data'),
                      //           );
                      //         } else {
                      //           return Container();
                      //         }
                      //       },
                      //     ),
                      //     FutureBuilder<List>(
                      //         future: FmsDatabase.instance.readHistoryAttendance(), // a previously-obtained Future<String> or null
                      //         builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      //           List<Widget> children;
                      //           if (snapshot.hasData) {
                      //             return ListView.builder(
                      //                 physics: NeverScrollableScrollPhysics(),
                      //                 shrinkWrap: true,
                      //                 padding: const EdgeInsets.all(8),
                      //                 itemCount: snapshot.data!.length  ,
                      //                 itemBuilder: (BuildContext context, int index) {
                      //                   return Card(
                      //                     elevation: 0.8,
                      //                     shadowColor: Colors.grey,
                      //                     shape: RoundedRectangleBorder(
                      //                       borderRadius: BorderRadius.circular(10),
                      //                     ),
                      //                     child: InkWell(
                      //                         onTap: () {
                      //                           print('Card tapped.');
                      //                         },
                      //                         child: Row(
                      //                           mainAxisAlignment: MainAxisAlignment.start,
                      //                           children: <Widget>[
                      //                             Container(
                      //                               margin: EdgeInsets.symmetric(horizontal: 20),
                      //                               child: SizedBox(
                      //                                 height: 70,
                      //                                 width: 30,
                      //                                 child: CheckboxListTile(
                      //                                   title: Text(""),
                      //                                   value: checkboxValue[4].isSelected,
                      //                                   onChanged: (bool? value) {
                      //                                     if(value != null) {
                      //                                       setState(() {
                      //                                         checkboxValue[4].isSelected = value;
                      //                                       });
                      //                                     }
                      //                                   },
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             Column(
                      //                               mainAxisAlignment: MainAxisAlignment.start,
                      //                               crossAxisAlignment: CrossAxisAlignment.start,
                      //                               children: [
                      //                                 Text(
                      //                                     'Data baru Attendance',
                      //                                     textAlign: TextAlign.left,
                      //                                     style: TextStyle(color: Colors.black,
                      //                                         fontFamily: Fonts.REGULAR,fontSize: 18)
                      //                                 ),
                      //                                 Text(
                      //                                     snapshot.data![index]['login_at'],
                      //                                     textAlign: TextAlign.center,
                      //                                     style: TextStyle(color: Colors.grey,
                      //                                         fontFamily: Fonts.REGULAR,fontSize: 12)
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         )
                      //                     ),
                      //                   );
                      //                 });
                      //           } else if (snapshot.hasError) {
                      //             return Container(
                      //               child: Text('Tidak ada data'),
                      //             );
                      //           } else {
                      //             return Text('');
                      //           }
                      //         },
                      //       ),
                      //   ],
                      // ),
                    Column(
                        children: [
                          // FutureBuilder<List>(
                          //   future: Global.getData(), // a previously-obtained Future<String> or null
                          //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                          //     List<Widget> children;
                          //     if (snapshot.hasData) {
                               ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: check.length  ,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Card(
                                        color: Colors.white,
                                        elevation: 0.8,
                                        shadowColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                            onTap: () {
                                              print('Card tapped.');
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                                  child: SizedBox(
                                                    height: 70,
                                                    width: 30,
                                                    child: CheckboxListTile(
                                                      title: Text(""),
                                                      value: check[index]['check'],
                                                      onChanged: (bool? value) {
                                                        if(value != null) {
                                                          setState(() {
                                                            check[index]['check'] = value;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        check[index]['text'],
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(color: Colors.black,
                                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                                    ),
                                                    Text(
                                                        check[index]['created_at'],
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: Colors.grey,
                                                            fontFamily: Fonts.REGULAR,fontSize: 12)
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                        ),
                                      );
                                    })

                          //   },
                          // ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///pop up status
  Future<void> _dialogDownloadAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Berhasil download data"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  ///pop up status
  Future<void> _dialogUploadAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Berhasil upload data"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}

class successDownloaded extends StatelessWidget {
  const successDownloaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Icon(
      Icons.check_box,
      color: Coloring.mainColor,
      size: 30,
    );
  }
}







