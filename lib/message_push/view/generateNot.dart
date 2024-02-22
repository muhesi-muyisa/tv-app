import 'package:apisaissai/authentification/models/membreModels.dart';
import 'package:apisaissai/colors/color.dart';
import 'package:apisaissai/message_push/modeles/pushNotification.dart';
import 'package:apisaissai/message_push/view/notification_badge.dart';
import 'package:apisaissai/widgets/custom_card_thumbnail.dart';
import 'package:apisaissai/widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../models/movies.dart';
import '../../widgets/CustomCard.dart';

class PushNot extends StatelessWidget {
  const PushNot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OverlaySupport(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Not",
        home: GenerateNot(),
      )),
    );
  }
}

class GenerateNot extends StatefulWidget {
  const GenerateNot({super.key});

  @override
  State<GenerateNot> createState() => _GenerateNotState();
}

class _GenerateNotState extends State<GenerateNot> {
  Drawbles dra = Drawbles();

  bool connect = false;

  verificc() async {
    await MembreModels.getUser();
    if (MembreModels.sessionUser?.idMembre != null) {
      setState(() {
        connect = true;
      });
    } else {
      setState(() {
        connect = false;
      });
    }
  }

  // Initialisation de certaines variables
  late final FirebaseMessaging _messaging;
  late int _totalnotificationCounter;

  // Instance de la notification
  PushNotification? _pushNotification;

  // Enregistrement de notification
  void registerNotification() async {
    await Firebase.initializeApp();

    // Instance de messaging
    _messaging = FirebaseMessaging.instance;

    // 3 types d'etat dans la notification
    // Not determined (null) , granted (true) and decline (false)

    NotificationSettings settings = await _messaging.requestPermission(
        alert: true, badge: true, provisional: false, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted the permission");
      // Main message
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotification notification = PushNotification(
            title: message.notification!.title,
            body: message.notification!.body,
            datatitle: message.data['title'],
            databody: message.data['body']);
        setState(() {
          _totalnotificationCounter++;
          _pushNotification = notification;
        });

        if (notification != null) {
          showSimpleNotification(Text(_pushNotification!.title!),
              leading: NotificationBadge(
                  totalnotification: _totalnotificationCounter),
              subtitle: Text(_pushNotification!.body!),
              background: Colors.red,
              duration: Duration(seconds: 10));
        }
      });
    } else {
      print("Permission décline by user");
    }
  }

  // Vérification de l'unitilisation du message
  checkinititialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushNotification notification = PushNotification(
          title: initialMessage.notification!.title,
          body: initialMessage.notification!.body,
          datatitle: initialMessage.data['title'],
          databody: initialMessage.data['body']);
      setState(() {
        _totalnotificationCounter++;
        _pushNotification = notification;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    // Quand l'appli est en background

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        PushNotification notification = PushNotification(
            title: message.notification!.title,
            body: message.notification!.body,
            datatitle: message.data['title'],
            databody: message.data['body']);
        setState(() {
          _totalnotificationCounter++;
          _pushNotification = notification;
        });
      },
    );
    // Une notification normale
    registerNotification();

    // Quand l'apk est arretée
    checkinititialMessage();

    _totalnotificationCounter = 0;
    super.initState();
  }

// Conception de l'interface de mon app
  // Items
  List<MovieModel> foryouItemsList = List.of(forYouImages);
  List<MovieModel> popularItemsList = List.of(popularImages);
  List<MovieModel> genreItemsList = List.of(genresList);
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  int currentPage = 0;

  // Indicators
  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (var i = 0; i < foryouItemsList.length; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text("Moto TV"),
        centerTitle: true,
      ),

      // Drawble
      drawer: connect
          ? dra.connexion(
              context,
              MembreModels.sessionUser!.nom,
              MembreModels.sessionUser!.postnom,
              MembreModels.sessionUser!.email)
          : dra.drawer(context),
      body: Stack(
        children: [
          // For items
          SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top container
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Bienvenu, Muhesi!",
                    //       style: TextStyle(color: Colors.white, fontSize: 30),
                    //     ),
                    //     Stack(
                    //       children: [
                    //         Container(
                    //           height: 50,
                    //           width: 50,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(50),
                    //               image: DecorationImage(
                    //                   image: AssetImage("images/1.jpg"),
                    //                   fit: BoxFit.cover)),
                    //         ),
                    //         Positioned(
                    //             right: 2,
                    //             top: 2,
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 color: kButtonColor,
                    //               ),
                    //               height: 10,
                    //               width: 10,
                    //             )),
                    //       ],
                    //     )
                    //   ],
                    // )
                    ),
                // const SizedBox(
                //   height: 20,
                // ),
                // // search Bar
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Container(
                //       padding: const EdgeInsets.all(20),
                //       decoration: BoxDecoration(
                //           color: kSearchbarColor,
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Row(
                //         children: const [
                //           Icon(Icons.search),
                //           SizedBox(
                //             width: 20,
                //           ),
                //           Text(
                //             "Recherche ...",
                //             style: TextStyle(fontSize: 18, color: Colors.white),
                //           )
                //         ],
                //       )),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 5),
                  child: Text(
                    "Pour toi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                foreyouCardLayout(forYouImages),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: buildPageIndicatorWidget(),
                    ),
                  ),
                ),
                // Pupalar
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Les informations",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Actualisez - vous",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        )
                      ]),
                ),
                // Popular

                movieListBuilder(popularItemsList),

                // genre
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Genre",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "genree",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        )
                      ]),
                ),

                genreBuilder(genreItemsList),
              ],
            ),
          )),

          // for bottomnavBar
          Positioned(child: Container())
        ],
      ),
    );
  }

  // for your Card Layout
  Widget foreyouCardLayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: PageView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: ((context, index) {
          return CustomCardThumbnail(
            imageAsset: movieList[index].imageAsset.toString(),
          );
        }),
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        controller: pageController,
      ),
    );
  }

  Widget movieListBuilder(List<MovieModel> movieList) {
    return  Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.27,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: ((context, index) {
              return CustomCard(
                movieModel: movieList[index],
              );
            })),
    );
  }

// genre builder

  Widget genreBuilder(List<MovieModel> movieList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: ListView.builder(
          itemCount: genresList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Stack(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              genresList[index].imageAsset.toString()),fit: BoxFit.cover)),
                              margin: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 30),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Text(genresList[index].movieName.toString(),style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),))
              ],
            );
          })),
    );
  }
}
