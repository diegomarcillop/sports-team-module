const express = require('express');
const path = require('path');
const hbs = require('express-handlebars');
const methodOverride = require('method-override');
const session =  require('express-session');
const morgan = require('morgan');

// initiliazations
const app =  express();
const http = require("http").createServer(app);

//Settings
app.set('port', process.env.PORT || 3300 );
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', hbs({
     defaultLayout:'main',
     layoutsDir: path.join(app.get('views'),'layouts'),
     partialsDir: path.join(app.get('views'),'partials'),
     extname: '.hbs',
     helpers: require('./helpers/handlebars')
}));

app.set('view engine','hbs');

//Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(methodOverride('_method'));

app.use(session({
     secret:'deport-secret',
     resave:  true,
     saveUninitialized: true
}));

//Global Variables

// Routes
app.use(require("./controllers/matricula"))


// Static Files
app.use(express.static(path.join(__dirname, 'public')));

//Server is listening

app.listen(app.get('port'),()=>{
     console.log('running in port'+app.get('port'));
});