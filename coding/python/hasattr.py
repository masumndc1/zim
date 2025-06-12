#!/usr/bin/evn python3


class Car:
    def __init__(self):
        self.brand = "Toyota"


car = Car()

print(hasattr(car, "brand"))  # True

if not hasattr(car, "oil"):  # False
    car.oil = "petrol"

if hasattr(car, "oil"):
    print(car.oil)


for attr in dir(car):
    if not attr.startswith("__"):
        print(attr)
