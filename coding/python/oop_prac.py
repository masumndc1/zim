#!/usr/bin/env python

class Employee:
  numberOfEmployee = 0
  basic_pay = 1000

  def __init__(self, first, last, indi_pay_rise):
    self.bonus = 10
    self.first = first
    self.last = last
    self.pay = indi_pay_rise + self.bonus + Employee.basic_pay
    self.email = first + '.' + last + '@gmail.com'
    Employee.numberOfEmployee += 1

  def fullname(self):
    return '{} {} {}'.format(self.first, self.last, self.pay)
    
emp_1 = Employee('khabir','uddin', 100)
emp_2 = Employee('mahrus','muktadir', 200)

print(emp_1.fullname())
print(emp_2.fullname())
print(Employee.numberOfEmployee)

