mongoose = require 'mongoose'

ArticleSchema = new mongoose.Schema
  title:
    type: String
    trim: true

  user:
    type: mongoose.Schema.ObjectId
    ref: 'User'

  created: Date
  body:
    type: String
    trim: true

  tags:
    type: Array
    get: (tags) -> tags.join ','
    set: (tags) -> tags.split ','

  comments: [
    user:
      type: mongoose.Schema.ObjectId
      ref: 'User'

    created: Date
    body:
      type: String
      trim: true
  ]

ArticleSchema.path('title').validate (title) ->
  title.length
, 'Title cannot be blank'

ArticleSchema.path('body').validate (body) ->
  body.length
, 'Body cannot be blank'

mongoose.model 'Article', ArticleSchema

# Unfinished.