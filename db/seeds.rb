categories = Category.create!([
{title: "Biology"},
{title: "Physics"}])

tests = Test.create!([
{title: "Mammals", category_id: categories[0].id},
{title: "Dynamics", level: 3, category_id: categories[1].id}])

questions = Question.create!(wording: "What do mammals eat?", sublevel: 0, test_id: tests[0].id)

answers = Answer.create!([
{wording: "Meat", correct: true, question_id: questions.id},
{wording: "Balls", correct: false, question_id: questions.id},
{wording: "Grass", correct: false, question_id: questions.id},
{wording: "Ground", correct: false, question_id: questions.id}])