Nimtess2 is a [Nim](https://nim-lang.org/) wrapper for [libtess2](https://github.com/memononen/libtess2).

Nimtess2 is distributed as a [Nimble](https://github.com/nim-lang/nimble) package and depends on [nimgen](https://github.com/genotrance/nimgen) and [c2nim](https://github.com/nim-lang/c2nim/) to generate the wrappers. The libtess2 source code is downloaded using Git so having ```git``` in the path is required.

__Installation__

Nimtess2 can be installed via [Nimble](https://github.com/nim-lang/nimble):

```
> nimble install nimgen

> nimble install https://github.com/genotrance/nimtess2
```

This will download, wrap and install nimtess2 in the standard Nimble package location, typically ~/.nimble. Once installed, it can be imported into any Nim program.

__Usage__

Module documentation can be found [here](http://nimgen.genotrance.com/nimtess2).

```nim
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
```

Refer to the ```tests``` directory for examples on how the library can be used.

__Credits__

Nimtess2 wraps the libtess2 source code and all licensing terms of [libtess2](https://github.com/memononen/libtess2) apply to the usage of this package.

Credits go out to [c2nim](https://github.com/nim-lang/c2nim/) as well without which this package would be greatly limited in its abilities.

__Feedback__

Nimtess2 is a work in progress and any feedback or suggestions are welcome. It is hosted on [GitHub](https://github.com/genotrance/nimtess2) with an MIT license so issues, forks and PRs are most appreciated.
