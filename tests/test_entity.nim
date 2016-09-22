import unittest
import ../ecs

type
  TestComponent = ref object of Component
    data: int

  Health = ref object of Component
    amount: int

suite "entity test":
  test "id":
    let e = newEntity()
    check(e.id == 0)

  test "add/get":
    let e = newEntity()
    let c1 = TestComponent(data: 10)
    e.addComponent(c1)
    let c2 = Health(amount: 90)
    e.addComponent(c2)

    let x1 = (TestComponent)e.getComponent(c1)
    check(x1.data == 10)
    let x2 = e.get(TestComponent())
    check(x2.data == 10)
    let x3 = e.get1(Health)
    check(x3.amount == 90)

  test "misc":
    let e = newEntity()
    echo e
