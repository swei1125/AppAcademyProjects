class Employee
  attr_accessor :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end
  
  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
    end
    
    sum * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("david", "entry-level", 10000, "darren")
  shawna = Employee.new("shawna", "entry-level", 12000, "darren")
  darren = Manager.new("darren", "TA Manager", 78000, "ned", [david, shawna]) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
  p david.name
  p darren.name
end
