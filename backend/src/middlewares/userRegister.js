const userControls = require("../controllers/userController")

const userRegister = async (req, res, next) => {
	try {
		const uid = req.header("Authorization").replace("Bearer ", "");
		console.log(uid)
		await userControls.checkUserUid(uid);
		//is user in database?
		const isUserAlreadyThere = await userControls.getUserInfo(uid)
		if (isUserAlreadyThere) {
			res.status(200).send({
				statusCode: 200,
				payload: {
					msg: "User already registered, Signing In!",
				},
				wasUserRegistered: true,
				isRegSuccess: false,
			})
			return
		}
		console.log("Need to create!")
		console.log(req.body)
		req.user = {
			email: req.body.email,
			uid: uid,
			name: req.body.name,
			username: req.body.username,
			mentor: req.body.mentor
		}
		next()
	} catch (e) {
		res.status(400).send({
			statusCode: 400,
			payload: {
				msg: "Unauthorized",
				errorMsg: e.message
			},
			wasUserRegistered: false,
			isRegSuccess: false,
		})
		return
	}
}

module.exports = userRegister