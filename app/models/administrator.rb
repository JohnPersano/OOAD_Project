# Administrator class that extends the Employee class used for administrator specific actions
class Administrator < Employee

  # Note: Fields are inherited from the Employee class (using inheritance pattern)

  # Promote an employee to manager
  def promote(employee)
    employee = Employee.find(employee.id)

    # Create a manager with the same information
    manager = Manager.new(employee.attributes)
    manager.save!

    # Remove the old employee information (employee is now a manager)
    employee.delete!
  end

  # Demote manager to employee
  def demote(manager)
    manager = Manager.find(manager.id)

    # Create an employee with the same information
    employee = Employee.new(manager.attributes)
    employee.save!

    # Remove the old manager information (manager is now an employee)
    manager.delete!
  end

end