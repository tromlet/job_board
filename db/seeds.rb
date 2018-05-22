# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = ["jsanderlin@arrayschool.com", "dev.breu@gmail.com",
  "quinnl@thearrayschool.com", "crags1838@gmail.com", "luckymj13@yahoo.com",
  "apickle@gmail.com", "myerswyo@gmail.com", "landoncof@thearrayschool.com",
  "copyalex@hotmail.com", "harrypotter@thearrayschool.com"]

100.times do |i|
  jobDescription = ""

  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = i < students.length ? students[i] : Faker::Internet.email(firstname)
  user = User.new({
    email: email,
    firstname: firstname,
    lastname: lastname,
    description: Faker::Hipster.paragraph,
    password: "password",
    password_confirmation: "password"
  })
  user.skip_confirmation!
  user.save!

  def genJobDescription
    str = ""
    5.times do
      str << Faker::Company.catch_phrase + " " + Faker::Company.catch_phrase.downcase + ". "
    end
    return str
  end

  jobDescription << genJobDescription
  jobDescription << "<br><br>"
  jobDescription << genJobDescription

  Job.create!({
    title: Faker::Job.title,
    description: jobDescription,
    user_id: user.id
  })
end
