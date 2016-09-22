#import typeinfo
import typetraits

var
  maxEntityId = -1

type
  Entity* = ref object of RootObj
    id: int
    components*: seq[Component]

  Component* = ref object of RootObj
    entity*: Entity
    typename: string
      
  System* = ref object


include entity
