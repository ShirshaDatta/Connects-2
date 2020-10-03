// IMPORTS
const { admin, database } = require('../utils/firebase');
const chalk = require('chalk');

// MODEL IMPORTS
const userDB = require('../models/userData');
const courseDB = require('../models/courseDB');

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

// FETCH THE USER TYPE
const fetchUserType = (uid) => {
	return new Promise((resolve, reject) => {
		userDB.fetchUserType(uid)
			.then((resp) => {
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


// REGISTER TO COURSE
const courseRegister = (obj) => {
	console.log(obj)
	return new Promise((resolve, reject) => {
		console.log(chalk.yellow("ADDING USER TO COURSE..."))

		// SAVING DETAILS TO DB
		userDB.addCourse(obj)
			.then((resp) => {

				courseDB.addUserDetailsToCourse(obj)
					.then(() => {
						// SUCCESS
						console.log(chalk.green("ENROLLED USER TO COURSE"))

						resolve({
							statusCode: 200,
							payload: {
								msg: "ENROLLED USER TO COURSE!",
							},
						})
					})
			})
			.catch((err) => {
				console.log(err)
				reject({
					statusCode: 400,
					payload: {
						msg: "Server Side error contact support"
					}
				})
			})
	})
}

// FETCH MENTOR COURSES
const fetchMentorCourses = (uid) => {

	return new Promise((resolve, reject) => {
		console.log(chalk.yellow("FETCHING MENTOR'S COURSES..."))

		// FETCHING MENTOR COURSES
		userDB.fetchMentorCourses(uid)
			.then((courses) => {

				let courseData = [];

				courses.forEach((course) => {
					courseData.push(course.data())
				})
				
				// SUCCESS
				console.log(chalk.green("FETCHED MENTOR COURSES"))

				resolve({
					statusCode: 200,
					payload: {
						msg: "FETCHED MENTOR COURSES!",
						payload:{
							courseData
						}
					},
				})
			})
			.catch((err) => {
				console.log(err)
				reject({
					statusCode: 400,
					payload: {
						msg: "Server Side error contact support"
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
	courseRegister,
	fetchMentorCourses,
	checkUserUid,
	getUserInfo
}