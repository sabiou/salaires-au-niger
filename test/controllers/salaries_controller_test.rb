require "test_helper"

class SalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary = salaries(:one)
  end

  test "should get index" do
    get salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_url
    assert_response :success
  end

  test "should create salary" do
    assert_difference("Salary.count") do
      post salaries_url, params: { salary: { city: @salary.city, company: @salary.company, salary: @salary.salary, seniority: @salary.seniority, title: @salary.title } }
    end

    assert_redirected_to salary_url(Salary.last)
  end

  test "should show salary" do
    get salary_url(@salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_url(@salary)
    assert_response :success
  end

  test "should update salary" do
    patch salary_url(@salary), params: { salary: { city: @salary.city, company: @salary.company, salary: @salary.salary, seniority: @salary.seniority, title: @salary.title } }
    assert_redirected_to salary_url(@salary)
  end

  test "should destroy salary" do
    assert_difference("Salary.count", -1) do
      delete salary_url(@salary)
    end

    assert_redirected_to salaries_url
  end

  # Display the company name only if there are 3 or more salaries from the same company
  test "show company name if there are 3 or more salaries with the same company name" do
    title = "Accountant"
    company = "Acme Inc."
    city = "Maradi"
    seniority = "0-3ans"
    salary = 170000
    3.times do
      Salary.create!(title: title, company: company, city: city, seniority: seniority, salary: salary)
    end

    get salaries_url
    assert_response :success
    assert_select 'td:nth-child(2)', text: company, count: 3
  end

  test "Show 'Anonyme' if there are less than 3 salaries with the same company name" do
    title = "Full Stack Developer"
    company = "Meridian"
    city = "Agadez"
    seniority = "5ans"
    salary = 600000
    2.times do
      Salary.create!(title: title, company: company, city: city, seniority: seniority, salary: salary)
    end

    get salaries_url
    assert_response :success
    assert_select 'td:nth-child(2)', text: "Anonyme", count: 2
    assert_select 'td:nth-child(2)', text: company, count: 0
  end

  test "filter salaries by title, company name, or city" do
    Salary.create!(title: "Manager", company: "Niger Telecoms", city: "Maradi", seniority: "+5ans", salary: 500000)
    Salary.create!(title: "Ingenieur Reseaux", company: "Niger Telecoms", city: "Niamey", seniority: "+5ans", salary: 400000)
    Salary.create!(title: "Designer", company: "diool", city: "Maradi", seniority: "3-5ans", salary: 300000)

    get salaries_path, params: { filter: "Maradi" }
    assert_response :success
    assert_select 'td:nth-child(1)', text: "Manager", count: 1
    assert_select 'td:nth-child(1)', text: "Designer", count: 1

    get salaries_path, params: { filter: "Niger Telecoms" }
    assert_response :success
    assert_select 'td:nth-child(1)', text: "Ingenieur Reseaux", count: 1
    assert_select 'td:nth-child(3)', text: "Niamey", count: 1
  end

end
