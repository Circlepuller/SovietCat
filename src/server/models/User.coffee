bcrypt = require 'bcrypt'
mongoose = require 'mongoose'

UserSchema = new mongoose.Schema
  name:
    type: String
    default: ''
    trim: true

  email:
    type: String
    unique: true
    trim: true

  password:
    type: String
    set: (password) ->
      return '' if not password
      bcrypt.hashSync password, bcrypt.genSaltSync 32

  created: Date
  active: Date
  activated:
    type: Boolean
    default: false

UserSchema.path('name').validate (name) ->
  name.length and @activated
, 'Name cannot be blank'

UserSchema.path('email').validate (email) ->
  email.length
, 'Email cannot be blank'

UserSchema.path('password').validate (password) ->
  password.length
, 'Password cannot be blank'

mongoose.model 'User', UserSchema

# Eventually, we need to make this suited for invite based registration.
# It's also unfinished.

#conn = mongoose.createConnection()
#conn.open 'localhost', 'test', 27017, () ->
#conn.db
#mongoose.mongo.GridStore