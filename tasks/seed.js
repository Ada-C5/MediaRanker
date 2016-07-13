var massive = require('massive')

var databaseName = process.argv[2];
var connectionString = "postgres://localhost/" + databaseName;
var db = massive.connectSync({connectionString : connectionString});

// produces array with each element is an object key:value pair
var moviesParsedJSON = require('../db/seeds/movies.json');
// var movieLength = moviesParsedJSON.length
var booksParsedJSON = require('../db/seeds/books.json');
// var customerLength = customersParsedJSON.length
var albumsParsedJSON = require('../db/seeds/albums.json');


// ***********synchronous method
for (var movie of moviesParsedJSON) {
	console.log(movie)
	// pass save
	// db.video_store.saveSync({movie: movie.title.....})
	db.movies.saveSync(movie);
};


for (var book of booksParsedJSON) {
	// console.log(customer.name, customer.registered_at,  )
	// db.video_store.saveSync({name: customer.name, customer.registered_at, })
	db.books.saveSync(book);
};

for (var album of albumsParsedJSON) {
	// console.log(customer.name, customer.registered_at,  )
	// db.video_store.saveSync({name: customer.name, customer.registered_at, })
	db.albums.saveSync(album);
};

console.log("seeding done!")
process.exit()