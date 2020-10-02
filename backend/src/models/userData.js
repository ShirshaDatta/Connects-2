const { admin, database } = require('../utils/firebase');

module.exports.registerUser = ({ email, uid, name, username, mentor }) => {
	return new Promise(async (resolve, reject) => {
		try {
			await database
				.collection("users")
				.doc(uid)
				.set({
					email,
					uid,
					name,
					username,
					mentor,
					dateCreated: new Date()
				});
			
			resolve()
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}

module.exports.fetchUserType = (uid) => {
	return new Promise(async (resolve, reject) => {
		try {
			let user = await database
				.collection("users")
				.doc(uid)
				.get();
			
			resolve(user.data().mentor)
		}
		catch(e){
			reject();
		}
	})
}


module.exports.addCourse = ({uid, course_id}) => {
	return new Promise(async (resolve, reject) => {
		try {

			//{uid, courseName, category, duration, courseTime, days, courseFee }

			await database
				.collection("users")
				.doc(uid)
				.collection("courses")
				.doc(course_id)
				.set({
					enrolledOn: new Date(),
					active: true
				})
			
			resolve()
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}