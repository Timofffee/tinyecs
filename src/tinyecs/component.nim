import types, tables, world, strutils
export types

proc addComponent*[T: Component](e:Entity, c:T) =
  c.entity = e
  var id = getTypeID(T)
  if e.world.components.hasKey(id):
    e.world.components[id].add(c)
  else:
    e.world.components.add(id, newSeq[Component]())
    e.world.components[id].add(c)
  echo $e.world.components[id]


proc getComponent* [T: Component](e:Entity, ctype: typedesc[T] | T): T | void =
  var id = getTypeID(T)
  if e.world.components.hasKey(id):
    for x in e.world.components[id]:
      if x.entity == e and x.entity.world == e.world:
        return (T)x
  return nil

proc hasComponent*[T: Component](e: Entity, ctype: typedesc[T]): bool =
  var id = getTypeID(T)
  if e.world.components.hasKey(id):
    for x in e.world.components[id]:
      if x.entity == e:
        return true
  return false

proc removeComponent*[T: Component](e:Entity, c:typedesc[T] | T): void =
  var id = getTypeID(T)
  if e.world.components.hasKey(id):
    var i = 0
    for x in e.world.components[id]:
      if x.entity == e:
        e.world.components[id].del(i)
        break
      inc i

proc `$`*[T: Component](c: T): string =
  "Component<$1>".format($T)
