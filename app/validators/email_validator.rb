# Why did we store under /app/validators? http://stackoverflow.com/questions/5263239/where-should-rails-3-custom-validators-be-stored
# This code came from : http://guides.rubyonrails.org/active_record_validations_callbacks.html#custom-validators
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end