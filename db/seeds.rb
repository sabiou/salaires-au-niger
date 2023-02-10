# generate 100 salaries with Faker

99.times do |n|
  title = Faker::Job.title
  company = Faker::Company.name
  city = %w[Agadez Diffa Dosso Maradi Niamey Tahoua Tillaberi Zinder].sample
  seniority = %w[0-3ans 3-5ans +5ans].sample
  salary = Faker::Number.between(from: 100000, to: 1000000)
  Salary.create!(title: title, company: company, city: city, seniority: seniority, salary: salary)
end