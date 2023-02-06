include ActionView::Helpers::NumberHelper

module SalariesHelper
  # XOF: West african currency used in Niger 🇳🇪
  def self.format_currency_to_xof(salary)
    number_to_currency(
      salary,
      unit: "XOF",
      separator: ".",
      delimiter: ".",
      format: "%n %u",
      precision: 0
    )
  end

  def self.avg_salary(arr)
    format_currency_to_xof(arr.sum(&:salary) / arr.size)
  end

end
