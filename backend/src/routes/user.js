const express = require('express')
const router = new express.Router();
const bodyParser = require('body-parser');
const chalk = require('chalk');


// CONTROLLERS
const userControls = require("../controllers/userController")


// MIDDLEWAR
const userRegister = require('../middlewares/userRegister');

router.use(bodyParser.json());


// SINGUP
router.post('/signup', userRegister, (req, res) => {

	console.log("Registering new user")

	try {

		userControls.registerUser(req.user)
			.then((resp) => { res.setHeader('Access-Control-Allow-Origin', '*'); res.status(200).send(resp) })
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})


// MENTOR OR NOT?
router.post('/type', (req, res) => {

	console.log("Fetching user type...")

	try {

		userControls.fetchUserType(req.body.uid)
			.then((resp) => { res.setHeader('Access-Control-Allow-Origin', '*'); res.status(200).send(resp) })
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})

// ENROLL INTO A COURSE
router.post('/enroll', (req, res) => {

	console.log("Enrolling user to course...")

	try {
		userControls.courseRegister(req.body)
			.then((resp) => res.status(200).send(resp))
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})

// FETCH MY COURSES (MENTOR)
router.post('/mentor/myCourses', (req, res) => {
	try {
		userControls.fetchMentorCourses(req.body.uid)
			.then((resp) => res.status(200).send(resp))
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})

// FETCH MY COURSES (STUDENT)
router.post('/student/myCourses', (req, res) => {
	try {
		userControls.fetchStudentCourses(req.body.uid)
			.then((resp) => res.status(200).send(resp))
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})


module.exports = router
