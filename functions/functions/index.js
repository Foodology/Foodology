const admin = require('firebase-admin');
admin.initializeApp();

// Init functions and database
const functions = require('firebase-functions');
const { firestore } = require('firebase-admin');
const FieldValue = require('firebase-admin').firestore.FieldValue;
const db = admin.firestore();

exports.incLikes = functions.https.onRequest((request, response) => {
  db.collection('RecipesByUser').doc('1weHFMrmWtV2UtFY7za11ODbyb13').collection('Recipes').doc('aHTOzNvYPiApxEP27uZF').update({
    likes: FieldValue.increment(1)
  })
});

exports.decLikes = functions.https.onRequest((request, response) => {
  db.collection('RecipesByUser').doc('1weHFMrmWtV2UtFY7za11ODbyb13').collection('Recipes').doc('aHTOzNvYPiApxEP27uZF').update({
    likes: FieldValue.increment(-1)
  })
});

// exports.updateLikes = functions.firestore
//     .document('RecipesByUser/{userId}/Recipes/{recipeID}')
//     .onUpdate((change, context) => {
//       // Get an object representing the document
//       // e.g. {'name': 'Marie', 'age': 66}
//       const newValue = change.after.data();

//       // ...or the previous value before this update
//       const previousValue = change.before.data();

//       // access a particular field as you would any JS property
//       const name = newValue.name;

//       db.collection('RecipesByUser').doc('1weHFMrmWtV2UtFY7za11ODbyb13').collection('Recipes').doc('aHTOzNvYPiApxEP27uZF').update({ likes: FieldValue.increment(50) })

//       functions.logger.info("Hello logs!");
//     });