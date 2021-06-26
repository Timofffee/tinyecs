# Simple ECS implementation on Nim
Fork https://gitlab.com/coaljoe/nim-ecs

## #USAGE
```Nim
import ecs

type
  TestComponent = ref object of Component
    data: int
    name: string

  Health = ref object of Component
    amount: int

let e = newEntity()
let c1 = TestComponent(data: 10)
e.addComponent(c1)
let c2 = Health(amount: 90)
e.addComponent(c2)

let x1 = (TestComponent)e.getComponent(c1)
assert x1.data == 10
let x2 = e.get(TestComponent())
assert x2.data == 10
let x3 = e.get(Health)
assert x3.amount == 90
let x4 = (Health)e.get("Health")
assert x4.amount == 90
```

## #TODO
- [ ] Add World
- [ ] Iterating through the entity by several components
