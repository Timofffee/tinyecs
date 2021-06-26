# Simple ECS implementation on Nim
Fork https://gitlab.com/coaljoe/nim-ecs

## #USAGE
```Nim
import tinyecs

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
let x2 = e.getComponent(TestComponent())
assert x2.data == 10
let x3 = e.getComponent(Health)
assert x3.amount == 90
```

## #TODO
- [x] ~~Update the repository to the current state~~
- [ ] Add World
- [ ] Remove entity/component
- [ ] Separated component sequences
- [ ] Using a previously released ID
- [ ] Iterating through the entity by several components
- [ ] Optimizations!!!
