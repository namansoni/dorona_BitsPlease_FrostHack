const functions = require('firebase-functions');
const admin = require('firebase-admin');
const distanceBetweenPoints = require('distance-between-geocoordinates');
admin.initializeApp();
const firestore = admin.firestore();

exports.onLocationCreate = functions
    .firestore
    .document('/Locations/{adminArea}/{adminArea1}/{subAdminArea}/{subAdminArea1}/{pincode}/{pincode1}/{userId}')
    .onCreate(async (snapshot, context) => {
        const adminArea = context.params.adminArea;
        const subAdminArea = context.params.subAdminArea;
        const pincode = context.params.pincode;
        const userId = context.params.userId;
        const point1 = {
            lat: snapshot.data()['latitude'],
            lng: snapshot.data()['longitude'],
        };
        //All locations reference in user's pincode
        const locationReference = admin
            .firestore()
            .collection("Locations")
            .doc(adminArea)
            .collection(adminArea)
            .doc(subAdminArea)
            .collection(subAdminArea)
            .doc(pincode)
            .collection(pincode);
        const querySnapshot = await locationReference.get();
        count = 0;
        querySnapshot.forEach(doc => {
            if (doc.exists) {
                if (doc.id != userId) {
                    if (doc.data()['status'] == 'positive') {
                        const point2 = {
                            lat: doc.data()['latitude'],
                            lng: doc.data()['longitude'],
                        };
                        const result = distanceBetweenPoints(point1, point2, "m");
                        console.log(result);
                        if (result['distance'] <= 50) {
                            count = count + 1;
                        }
                    }
                }
            }
        });
        if (count > 0) {
            const userRef = admin.firestore().collection("Users").doc(userId);
            const userDoc = await userRef.get();
            const androidNotificationToken = userDoc.data()['androidNotificationToken'];
            const message = {
                notification: {
                    body: `${count} persons near you are covid positive(<10m)`,
                    title: "Dorona Alert",

                },
                token: androidNotificationToken,
                android: {
                    notification: {

                        tag: userId + "fromfcm",
                        notification_priority: "PRIORITY_DEFAULT"
                    },
                    priority: 'high',
                    ttl: 0
                }

            };
            admin.messaging().send(message).then(res => {
                console.log("message sent successfully ", res);
            }).catch(error => {
                console.log("Error : ", error);
            });
        }

    });

exports.onLocationUpdate = functions
    .firestore
    .document('/Locations/{adminArea}/{adminArea1}/{subAdminArea}/{subAdminArea1}/{pincode}/{pincode1}/{userId}')
    .onUpdate(async (change, context) => {
        const adminArea = context.params.adminArea;
        const subAdminArea = context.params.subAdminArea;
        const pincode = context.params.pincode;
        const userId = context.params.userId;
        const point1 = {
            lat: change.after.data()['latitude'],
            lng: change.after.data()['longitude'],
        };
        //All locations reference in user's pincode
        const locationReference = admin
            .firestore()
            .collection("Locations")
            .doc(adminArea)
            .collection(adminArea)
            .doc(subAdminArea)
            .collection(subAdminArea)
            .doc(pincode)
            .collection(pincode);
        const querySnapshot = await locationReference.get();
        count = 0;
        querySnapshot.forEach(doc => {
            if (doc.exists) {
                if (doc.id != userId) {
                    if (doc.data()['status'] == 'positive') {
                        const point2 = {
                            lat: doc.data()['latitude'],
                            lng: doc.data()['longitude'],
                        };
                        const result = distanceBetweenPoints(point1, point2, "m");
                        console.log(result);
                        if (result['distance'] <= 50) {
                            count = count + 1;
                        }
                    }

                }
            }
        });
        if (count > 0) {
            const userRef = admin.firestore().collection("Users").doc(userId);
            const userDoc = await userRef.get();
            const androidNotificationToken = userDoc.data()['androidNotificationToken'];
            const message = {
                notification: {
                    body: `${count} persons near you are covid positive(<10m)`,
                    title: "Dorona Alert",
                },
                token: androidNotificationToken,
                android: {
                    notification: {

                        tag: userId + "fromfcm",
                        notification_priority: "PRIORITY_DEFAULT"
                    },
                    priority: 'high',
                    ttl: 0
                }

            };
            admin.messaging().send(message).then(res => {
                console.log("message sent successfully ", res);
            }).catch(error => {
                console.log("Error : ", error);
            });
        }

    });