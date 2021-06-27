import tables

type
  Component* = ref object of RootObj
    entity*: Entity

  Entity* = ref object of RootObj
    id*: int32
    world*: World
  
  World* = ref object of RootObj
    components*: Table[int, seq[Component]]
    entities*: seq[Entity]
    maxEntityId*: int32

#TODO Bad for optimization!!!
var typeList = newSeq[string]()

proc getTypeID*[T](t: T | typedesc[T]): int =
  var ts = $T
  var i: int
  for tss in typeList:
    if ts == tss:
      return i
    inc i
  
  typeList.add(ts)
  return i
