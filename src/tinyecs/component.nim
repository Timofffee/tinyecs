import types
export types

proc addComponent*[T: Component](e:Entity, c:T) =
  c.entity = e
  #TODO Very bad for optimization!!!!
  c.typename = $T
  e.components.add(c)

proc getComponent* [T: Component](e:Entity, ctype: typedesc[T] | T): T | void =
  for x in e.components:
    if x.typename == $T:
      return T(x)
  return nil

proc hasComponent*[T: Component](e: Entity, ctype: typedesc[T]): bool =
  for x in e.components:
    if x.typename == $T:
      return true
  return false