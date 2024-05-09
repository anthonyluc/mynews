/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

/* const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger"); */

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

/* exports.helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
}); */
const newsApiKey = "./api_key.js";
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();
const NewsAPI = require("newsapi");
const newsapi = new NewsAPI(newsApiKey);

exports.getArticlesFromApi = functions.https.onCall((data, context) => {
  newsapi.v2.everything({
    q: "Technologie",
    language: "fr",
    sortBy: "publishedAt",
  }).then((articles) => {
    let count = 0;
    articles["articles"].forEach((article) => {
      count++;
      db.collection("Technologies").doc(count.toString()).limit(5).set({
        "title": article["title"],
        "url": article["url"],
        "urlToImage": article["urlToImage"],
        "source": article["source"]["name"],
        "publishedAt": article["publishedAt"],
      });
    });
  });
});
