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

let w = newWorld()
let e = w.newEntity()
let c1 = TestComponent(data: 10)
e.addComponent(c1)
let c2 = Health(amount: 100)
e.addComponent(c2)

if e.hasComponent(TestComponent):
  let x = e.getComponent(TestComponent)
  echo $x.data

if e.hasComponent(c2):
  e.removeComponent(TestComponent)
```

## #TODO
- [x] ~~Update the repository to the current state~~
- [x] Add World
- [ ] Remove entity
- [x] Remove component
- [x] Separated component sequences
- [ ] Using a previously released ID
- [ ] Iterating through the entity by several components
- [ ] Optimizations!!!
