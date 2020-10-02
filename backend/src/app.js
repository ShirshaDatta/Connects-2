// IMPORTS
const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors())

// PORT
const port = process.env.PORT || 8080

// ROUTES
app.get('/', function (req, res) {
	res.send({ message: "Connect2: CONNECT2 BACKEND SERVICE ONLINE!" });
});


// IMPORT ROUTES
const userRoute = require('./routes/user');
const courseRoute = require('./routes/course');

// USING ROUTERS
app.use('/user' , userRoute)
app.use('/course' , courseRoute)


// LISTENING
app.listen(port, () => {
	console.log('Server is up on port ', port)
})
