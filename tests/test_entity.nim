import unittest
import ../src/tinyecs

type
  TestComponent = ref object of Component
    data: int
    name: string

  Health = ref object of Component
    amount: int

suite "entity test":
  test "Check ID":
    let e = newEntity()
    check(e.id == 0)

  test "Add component field":
    let e = newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)
    let c2 = Health(amount: 90)
    e.addComponent(c2)

  test "Get component field":
    let e = newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)
    let c2 = Health(amount: 90)
    e.addComponent(c2)
    
    let x1 = (TestComponent)e.getComponent(c1)
    check(x1.data == 10)
    let x2 = e.getComponent(TestComponent())
    check(x2.data == 10)
    let x3 = e.getComponent(Health)
    check(x3.amount == 90)
  
  test "Component is nil":
    let e = newEntity()
    let x = e.getComponent(Health)
    check(x == nil)
  
  test "Has component":
    let e = newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)

    let x = e.hasComponent(TestComponent)
    check(x == true)
    let x2 = e.hasComponent(Health)
    check(x2 == false)
