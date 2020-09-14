const express = require('express')
const path = require('path')
const session=require('express-session')
const app = express();
var cors = require('cors')

const passport = require('./passport')



app.use(cors())
app.use(express.json());

app.use(express.urlencoded({
    extended : true
}))

app.use(session({
    secret:'#@%@#%FD$W^@E',
    resave: false,
    saveUninitialized: true
}))


app.all('/*', function(req, res, next) {
    // CORS headers
    res.header("Access-Control-Allow-Origin", "*"); // restrict it to the required domain
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    // Set custom headers for CORS
    res.header('Access-Control-Allow-Headers', 'Content-type,Accept,X-Access-Token,X-Key');
    if (req.method == 'OPTIONS') {
      res.status(200).end();
    } else {
      next();
    }
  });


app.use(passport.initialize())
app.use(passport.session());

app.use('/', express.static(path.join(__dirname, 'public')))

app.use('/', require('./routes/pages'))
app.use('/api', require('./routes/api'))


app.listen(process.env.PORT || 8081, () => {
  console.log("Server started at localhost")
})