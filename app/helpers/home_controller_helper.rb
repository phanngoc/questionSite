module HomeControllerHelper
  def my_formatted_number number
    number_to_currency(number, separator: ",", delimiter: "", format: '%n')
  end
end
