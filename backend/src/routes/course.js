const express = require('express')
const router = new express.Router();
const bodyParser = require('body-parser');
const chalk = require('chalk');

router.use(bodyParser.json());

// COURSE CONTROLLER IMPORT
const courseController =  require('../controllers/courseController');

// MIDDLEWARE
const checkUserType = require('../middlewares/checkUserStatus');


// CREATE A NEW COURSE
router.post('/create', checkUserType, (req, res) => {

	console.log("USER IS A MENTOR!")


	try {

		console.log("CREATING A NEW COURSE UNDER: " + req.body.uid)

		courseController.createCourse(req.body)
			.then((resp) => res.status(200).send(resp))
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})


// FETCH ALL COURSES
router.get('/fetch', (req, res) => {
	try {
		courseController.fetchAllCourses()
			.then((resp) => res.status(200).send(resp))
			.catch(err => res.status(400).send(err))
	}
	catch (e) {
		console.log(e);
	}
})


module.exports = router
