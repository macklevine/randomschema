CREATE DATABASE IF NOT EXISTS chat;

USE chat;

CREATE TABLE messages (
  /* Describe your table here.*/
  id int NOT NULL AUTO_INCREMENT,
  userid int NOT NULL,
  text varchar(200)  NOT NULL,
  roomname varchar(20),
  PRIMARY KEY (ID)
);

/* Create other tables and define schemas for them here! */

CREATE TABLE users (
  id        int    NOT NULL AUTO_INCREMENT,
  username  varchar(40)   NOT NULL,
  PRIMARY KEY (ID)
);

------------------------------------Example ORM Below---------------------------------

var Sequelize = require("sequelize");
var sequelize = new Sequelize("chat", "root", "");

var Message = sequelize.define('Message', {
  text: Sequelize.STRING,
  roomname: Sequelize.STRING
});

var User = sequelize.define('User', {
  username: Sequelize.STRING
});

Message.belongsTo(User);
User.hasMany(Message);

User.sync();
Message.sync();

exports.User = User;
exports.Message = Message;
/* select messages.id, messages.text, messages.roomname, users.username from messages
* left outer join users on (messages.userid = users.id) order by messages.id desc
* [a query string to select all messages]

*insert into messages (text, userid, roomname) values ("hello", (select id from users where username = "carl" limit 1), "home room"


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/
