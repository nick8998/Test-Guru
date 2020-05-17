
Question.create!(wording: "What do mammals eat?", sublevel: 0)

User.create!(mail: "admin@email.com", password: "qwerty123", role: 1) 

categories = Category.create!([
{title: "Biology"},
{title: "Physics"}])

tests = Test.create!([
{title: "Mammals"},
{title: "Dynamics", level: 3}])
 
answers = Answer.create!([
{wording: "Meat", correct: true},
{wording: "Balls", correct: false},
{wording: "Grass", correct: false},
{wording: "Ground", correct: false}])