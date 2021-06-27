import strutils
import types, world
export types

proc initEntity*(e: Entity, w: World): void =
  e.id = w.getNewID()
  e.world = w

proc newEntity*(w: World): Entity =
  result = Entity()
  result.initEntity(w)

proc `$`*(e:Entity): string =
  "Entity<id=$1>".format(e)
