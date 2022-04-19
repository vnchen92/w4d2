class Employee
    attr_reader :name, :title, :salary, :boss

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
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employees(array)
        @employees = array
    end


    def bonus(multiplier)
        # total = self.employees.map { |employee| employee.salary }.sum
        total = 0
        queue = self.employees.dup
        until queue.empty?
            current_em = queue.shift
            total += current_em.salary
            if current_em.instance_of?(Manager) 
                current_em.employees.each {|employee| queue << employee}
            end
        end
        total * multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren )

ned.add_employees([darren])
darren.add_employees([shawna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p david.employees

