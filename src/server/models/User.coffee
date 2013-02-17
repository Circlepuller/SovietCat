bcrypt = require 'bcrypt'
mongoose = require 'mongoose'

UserSchema = new mongoose.Schema
  name:
    type: String
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

UserSchema.path('name').validate (name) ->
  name.length
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