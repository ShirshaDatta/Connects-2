const { admin, database } = require('../utils/firebase');
const { v4: uuidv4 } = require('uuid')

// CREATE COURSE
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

// ADD USER DETAILS TO COURSE
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


module.exports.fetchCourseDetails = (course_id) => {
	return new Promise(async (resolve, reject) => {
		try {

			let course = await database
				.collection("courses")
				.doc(course_id)
				.get();
			
			resolve(course.data())
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}


module.exports.fetchAllCourses = (course_id) => {
	return new Promise(async (resolve, reject) => {
		try {

			let courses = await database
				.collection("courses")
				.get();

			let courseData = [];
			
			courses.forEach((course) => {
				courseData.push(course.data())
			})
			
			resolve(courseData)
		}
		catch (e) {
			console.log(e);
			reject();
		}	
	})
}