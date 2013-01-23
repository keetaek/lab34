class UserNameValidator < ActiveModel::Validator
  def validate(record)
    if record.firstName.empty? || record.lastName.empty?
        record.errors[:name] << 'Name cannot be blank'
        return #Always return only one error message
    end
    if record.firstName.length < MINIMUM_NUM_CHARACTER_NAME || 
        record.lastName.length < MINIMUM_NUM_CHARACTER_NAME
        record.errors[:name] << "Name should be at least #{MINIMUM_NUM_CHARACTER_NAME}"
        return
    end
    if record.firstName.length > MAXIMUM_NUM_CHARACTER_NAME || 
        record.lastName.length > MAXIMUM_NUM_CHARACTER_NAME
        record.errors[:name] << "Name cannot be more than #{MAXIMUM_NUM_CHARACTER_NAME} characters"
        return
    end
  end
end
 

