# generate 100 salaries with Faker

99.times do |n|
  title = Faker::Job.title
  company = Faker::Company.name
  city = Faker::Address.city
  seniority = Faker::Number.between(from: 0, to: 3)
  salary = Faker::Number.between(from: 100000, to: 800000)
  Salary.create!(title: title, company: company, city: city, seniority: seniority, salary: salary)
end