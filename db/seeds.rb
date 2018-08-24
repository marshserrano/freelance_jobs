User.create!(name: "Employer Marsh",
             email: "employermarsh@gmail.com",
             password: "employermarsh",
             password_confirmation: "employermarsh",
             user_type: "employer",
             company: "MyCompany",
             job_title: "CEO")

5.times do |e|
  name  = Faker::Name.name
  email = "employer#{e+1}@gmail.com"
  password = "employer"
  user_type = "employer"
  company = "MyCompany"
  job_title = Faker::Job.title
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               user_type: user_type,
               company: company,
               job_title: job_title)
end

User.create!(name: "Freelancer Marsh",
             email: "freelancermarsh@gmail.com",
             password: "freelancermarsh",
             password_confirmation: "freelancermarsh",
             user_type: "freelancer",
             brief_intro: "Web Developer",
             summary: "I am a web developer and designer")

5.times do |f|
  name  = Faker::Name.name
  email = "freelancer#{f+1}@gmail.com"
  password = "freelancer#{f+1}"
  user_type = "freelancer"
  brief_intro = Faker::Job.title
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               user_type: user_type,
               brief_intro: brief_intro)
end

12.times do |a|
  user_id = "#{a+1}"
  Address.create!(user_id: user_id)
end
