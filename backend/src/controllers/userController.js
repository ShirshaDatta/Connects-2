// IMPORTS
const { admin, database } = require('../utils/firebase');
const chalk = require('chalk');

// MODEL IMPORTS
const userDB = require('../models/userData');

// CREATE ACCOUNT 
const registerUser = (user) => {
	console.log(user)
	return new Promise((resolve, reject) => {
		console.log(chalk.yellow("Registering new user..."))
		
		// SAVING DETAILS TO DB
		userDB.registerUser(user)
			.then((resp) => {

				// SUCCESS
				console.log(chalk.green("CREATED NEW USER!"))
				
				resolve({
					statusCode: 200,
					payload: {
						msg: "UserRegisteres!",
					},
					wasUserRegistered: false,
					isRegSuccess: true,
				})
			
			})
			.catch((err) => {
				console.log(err)
				reject({
					statusCode: 400,
					payload: {
						msg: "Server Side error contact support"
					},
					wasUserRegistered: false,
					isRegSuccess: false,
				})
			})
	})
}


const fetchUserType = (uid) => {
	return new Promise((resolve, reject) => {
		userDB.fetchUserType(uid)
			.then((resp)=>{
				console.log("IS USER A MENTOR: " + resp)
				resolve({
					msg: "SUCCESSFULLY FETCHED STATUS",
					data: {
						mentor: resp
					}
				})
			})
	})
}

// CHECK IF THE USER UID IS VALID
const checkUserUid = (uid) => {
	return new Promise((resolve, reject) => {
		admin.auth().getUser(uid)
			.then((resp) => {
				console.log("User id exists")
				resolve(resp)
			})
			.catch((err) => {
				console.log(chalk.yellow("User does not exists"))
				reject({ error: err.message, message: "Unauthorised" })
			})
	})
}

// CHECK IF USER IS IN DATABASE
const getUserInfo = (uid) => {
	return new Promise((resolve, reject) => {
		console.log(chalk.yellow("Getting user info..."))
		const userRef = database.collection('users').doc(uid)
		userRef.get()
			.then((docSnapshot) => {
				if (docSnapshot.exists) {
					userRef.onSnapshot((doc) => {
						console.log(chalk.green("User exists!"));
						resolve(true)
					});
				}
				else {
					resolve(false)
				}
			}).catch((err) => {
				reject(err)
			})
	})
}

module.exports = {
	registerUser,
	fetchUserType,
	checkUserUid,
	getUserInfo
}