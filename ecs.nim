#import typeinfo
import typetraits as tt

proc nam [T](x: typedesc[T]): string =
  tt.name(x)

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
