proc newEntity* : Entity =
  inc maxEntityId
  Entity(id: maxEntityId, components: newSeq[Component]())

proc id* (e:Entity): int =
  e.id

proc addComponent* [T](e:Entity, c:T) =
  echo type(T).name()
  c.entity = e
  c.typename = T.name
  e.components.add(c)

proc getComponent* (e:Entity, c:Component): Component =
  for x in e.components:
    if type(x) is type(c):
      return x

proc get* [T](e:Entity, ctype: T): T =
  for x in e.components:
    if x.typename == type(T).name:
      return (T)x

proc get1* [T](e:Entity, ctype: typedesc[T]): T =
  for x in e.components:
    if x.typename == type(T).name:
      return (T)x