# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{name: "Jessica" }, {name: "Debra"}])
Poll.create([{title: "WHY>>?", author_id: 1}, {title: "Questions about questions", author_id: 2}])
Question.create([{poll_id:1 , text: "WHY>>???????"}, {poll_id: 2, text: "What are questions?"}] )
AnswerChoice.create([{question_id: 1, text: "I don't know"}, {question_id: 1, text: "AHHHHHH"}])
AnswerChoice.create([{question_id: 2, text: "questions are questions"}, {question_id: 2, text: "questions are confusing"}])
Response.create([{user_id: 1, answer_id: 2}, {user_id: 1, answer_id:3}])
Response.create([{user_id:2, answer_id: 1}, {user_id:2, answer_id: 4}])
