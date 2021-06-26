import strutils
import types
export types

var maxEntityId = -1

# forward decl.
proc initEntity*(e: Entity)

proc newEntity*() : Entity =
  result = Entity()
  result.initEntity()

proc initEntity*(e:Entity) =
  inc maxEntityId
  e.id = maxEntityId
  e.components = newSeq[Component]()
  
proc id*(e:Entity): int = 
  e.id

proc `$`*(e:Entity): string =
  "Entity<id=$1>".format(e.id)
