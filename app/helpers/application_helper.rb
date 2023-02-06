module ApplicationHelper
  include Pagy::Frontend
end

def show_errors(object, field_name)
  if object.errors.any?
    unless object.errors.messages[field_name].blank?
      object.errors.messages[field_name].join(", ")
    end
  end
end