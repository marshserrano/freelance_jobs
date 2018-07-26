User.create!(name: "Employer Marsh",
             email: "employermarsh@gmail.com",
             password: "employermarsh",
             password_confirmation: "employermarsh",
             user_type: "Employer",
             company_name: "MyCompany",
             job_title: "CEO",
             location: "Naga City")

10.times do |e|
  name  = Faker::Name.name
  email = "employer#{e+1}@gmail.com"
  password = "employer#{e+1}"
  user_type = "Employer"
  company_name = "MyCompany#{e+1}"
  job_title = Faker::Job.title
  location = Faker::Address.state
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               user_type: user_type,
               company_name: company_name,
               job_title: job_title,
               location: location)
end

User.create!(name: "Freelancer Marsh",
             email: "freelancermarsh@gmail.com",
             password: "freelancermarsh",
             password_confirmation: "freelancermarsh",
             user_type: "Freelancer",
             brief_intro: "Web Developer",
             summary: "I am a web developer and designer",
             skills: "Web Development, Web Design",
             location: "Naga City")

10.times do |f|
  name  = Faker::Name.name
  email = "freelancer#{f+1}@gmail.com"
  password = "freelancer#{f+1}"
  user_type = "Freelancer"
  brief_intro = Faker::Job.title
  skills = Faker::Job.key_skill
  location = Faker::Address.state
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               user_type: user_type,
               brief_intro: brief_intro,
               skills: skills,
               location: location)
end
