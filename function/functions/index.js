const admin = require('firebase-admin');
admin.initializeApp();

const functions = require('firebase-functions');
const db = admin.firestore();

exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");

  const docRef = firebase.firestore().collection('RecipesByUser').doc('1weHFMrmWtV2UtFY7za11ODbyb13').collection('Recipes').doc('aHTOzNvYPiApxEP27uZF');
  docRef.get().then((doc) => {})
});