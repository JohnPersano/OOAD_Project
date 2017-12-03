# Manager class that extends the Employee class used for manager specific actions
class Manager < Employee

  # Note: Fields are inherited from the Employee class (using inheritance pattern)

  # Add employee to the database
  def add_staff(employee)
    employee.save!
  end

  # Edit employee in the database
  def edit_staff(edit_employee)
    employee = Employee.find(edit_employee.id)
    employee.attributes = edit_employee.attributes
    employee.save!
  end

  # Remove employee from the database
  def remove_staff(employee)
    employee = Employee.find(employee.id)
    employee.delete!
  end

end