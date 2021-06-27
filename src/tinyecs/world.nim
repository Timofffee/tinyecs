import tables
import types
export types

# forward decl.
proc initWorld*(w: World)

proc newWorld*() : World =
  result = World()
  result.initWorld()

proc initWorld*(w: World) =
  w.components = initTable[int, seq[Component]]();
  w.entities = newSeq[Entity]();
  w.maxEntityId = -1

proc getNewID*(w: World): int32 =
  inc w.maxEntityId
  result = w.maxEntityId
