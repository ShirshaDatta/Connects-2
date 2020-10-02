const { admin, database } = require('../utils/firebase');
const { v4: uuidv4 } = require('uuid')


module.exports.createCourse = (course) => {
	return new Promise(async (resolve, reject) => {
		try {

			//{uid, courseName, category, duration, courseTime, days, courseFee }
			let course_id = uuidv4()
			course.course_id = course_id

			await database
				.collection("courses")
				.doc(course_id)
				.set(course);
			
			resolve()
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}

module.exports.addUserDetailsToCourse = ({course_id , uid}) => {
	return new Promise(async (resolve, reject) => {
		try {

			await database
				.collection("courses")
				.doc(course_id)
				.update(
					{students: admin.firestore.FieldValue.arrayUnion(uid)}
				);
			
			resolve()
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}

