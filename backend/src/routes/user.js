const express = require('express')
const router = new express.Router();
const bodyParser = require('body-parser');
const chalk = require('chalk');


// CONTROLLERS
const userControls = require("../controllers/userController")


// MIDDLEWAR
const userRegister = require('../middlewares/userRegister');

router.use(bodyParser.json());

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

router.post('/type', (req, res) => {
	
	console.log("Fetching user type...")
	
	try{

		userControls.fetchUserType(req.body.uid)
        .then( (resp) => {res.setHeader('Access-Control-Allow-Origin', '*'); res.status(200).send(resp)})
        .catch( err => res.status(400).send(err))
    }	
	catch(e){
            console.log(e);
    }
})


module.exports = router
