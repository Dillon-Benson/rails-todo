6000.times do
  Todo.seed do |t|
    t.todo_title = Faker::Lorem.sentence
    t.todo_text = Faker::Lorem.paragraph
    t.user_id = (1..500).to_a.sample
  end
end
