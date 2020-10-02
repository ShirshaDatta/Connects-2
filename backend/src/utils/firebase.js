const admin = require('firebase-admin');
const dotenv = require("dotenv")
dotenv.config()

var serviceAccount = require('../../firebase-key.json')
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: process.env.REACT_APP_DATABASE_URL,
    storageBucket: process.env.REACT_APP_STORAGE_BUCKET
});

const database = admin.firestore();
var bucket = admin.app().storage();

module.exports = {admin,database,bucket}
