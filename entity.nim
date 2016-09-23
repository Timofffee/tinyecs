import strutils

proc newEntity* : Entity =
  inc maxEntityId
  Entity(id: maxEntityId, components: newSeq[Component]())

proc id* (e:Entity): int =
  e.id

proc `$`* (e:Entity): string =
  "<Entity id=$1>".format(e.id)

proc addComponent* [T](e:Entity, c:T) =
  #echo T
  #echo T.name
  #echo type(T).name()
  c.entity = e
  #c.typename = T.name()
  c.typename = nam(T)
  e.components.add(c)

proc getComponent* (e:Entity, c:Component): Component =
  for x in e.components:
    if type(x) is type(c):
      return x

proc get* [T](e:Entity, ctype: typedesc[T]): T =
  for x in e.components:
    if x.typename == type(T).name:
      return (T)x

proc get* [T](e:Entity, ctype: T): T =
  for x in e.components:
    if x.typename == type(T).name:
      return (T)x

#proc get* [T](e:Entity, ctype: string): T =
proc get* (e:Entity, ctype: string): Component =
  for x in e.components:
    if x.typename == ctype:
      return x
