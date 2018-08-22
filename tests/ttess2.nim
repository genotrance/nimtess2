import nimtess2/tesselator

var
  ma: TESSalloc
  tess: ptr TESStesselator

proc stdAlloc*(userData: pointer; size: cuint): pointer {.stdcall.} =
  return alloc(size)

proc stdFree*(userData: pointer; `ptr`: pointer) {.stdcall.} =
  dealloc(`ptr`)

ma.memalloc = stdAlloc
ma.memfree = stdFree

tess = tessNewTess(addr ma)

tessSetOption(tess, 0, 1);