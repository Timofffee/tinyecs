import unittest, typeinfo
import ../src/tinyecs

type
  TestComponent = ref object of Component
    data: int
    name: string

  Health = ref object of Component
    amount: int

suite "entity test":
  test "Create World":
    let w = newWorld()
    check(w.maxEntityId == -1)

  test "Check ID":
    let w = newWorld()
    let e = w.newEntity()
    check(e.id == 0)

  test "Add component field":
    let w = newWorld()
    let e = w.newEntity()
    e.addComponent(TestComponent(data: 10))
    e.addComponent(Health(amount: 90))
    let e2 = w.newEntity()
    e2.addComponent(TestComponent(data: 120))

  test "Get component field":
    let w = newWorld()
    let e = w.newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)
    let c2 = Health(amount: 90)
    e.addComponent(c2)
    
    let x1 = e.getComponent(c1)
    check(x1.data == 10)
    let x2 = e.getComponent(TestComponent())
    check(x2.data == 10)
    let x3 = e.getComponent(Health)
    check(x3.amount == 90)
  
  test "Component is nil":
    let w = newWorld()
    let e = w.newEntity()
    let x = e.getComponent(Health)
    check(x == nil)
  
  test "Has component":
    let w = newWorld()
    let e = w.newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)

    let x = e.hasComponent(TestComponent)
    check(x == true)
    let x2 = e.hasComponent(Health)
    check(x2 == false)

  test "Remove component":
    let w = newWorld()
    let e = w.newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)

    let x = e.hasComponent(TestComponent)
    check(x == true)
    e.removeComponent(TestComponent)
    let x2 = e.hasComponent(TestComponent)
    check(x2 == false)
