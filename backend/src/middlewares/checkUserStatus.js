// IMPORT USERDB
const userDB = require('../models/userData');

const checkUserType = async (req, res, next) => {
	try {

		let mentor = await userDB.fetchUserType(req.body.uid)
		if(mentor){
			next();
		}
		else{
			console.log("USER IS NOT A MENTOR")
			throw new Error();
		}
	} catch (e) {
		res.status(400).send({
			statusCode: 400,
			payload: {
				msg: "Unauthorized. User is not a MENTOR!",
				status: false
			}
		})
		return
	}
}

module.exports = checkUserType