include ActionView::Helpers::NumberHelper

module SalariesHelper
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
end
