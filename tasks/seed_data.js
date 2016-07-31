// var massive = require('massive')
var spawn = require('child_process').spawnSync;
var Massive = require('massive');

var movies_data = require("../db/seeds/movies.json")
var albums_data = require("../db/seeds/albums.json")
var books_data = require("../db/seeds/books.json")

// ['development', 'test'].forEach(function(env) {
    var dbName = `mediaranker`;
    var db = Massive.connectSync({ db: dbName });


    for(var album of albums_data){
      db.albums.saveSync(album);
      }

    for(var movie of movies_data){
      db.movies.saveSync(movie);
      }

    for(var book of books_data){
      db.books.saveSync(book);
      }


    console.log("seeding done");
    process.exit();
