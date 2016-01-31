
{.compile: "../kiss_fft130/kiss_fft.c".}

proc KISS_FFT_MALLOC*(nbytes: csize): pointer {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc KISS_FFT_FREE*(p: pointer) {.importc, header: "../../kiss_fft130/kiss_fft.h".}

when defined(FIXED_POINT):
  when FIXED_POINT == 32:
    type
      kiss_fft_scalar* = int32
  else:
    type
      kiss_fft_scalar* = int16
else:
  type
    kiss_fft_scalar* = cfloat

type
  kiss_fft_cpx* {.final, pure.} = object
    r*: kiss_fft_scalar
    i*: kiss_fft_scalar

  kiss_fft_state* {.final, pure, incompleteStruct.} = object

  kiss_fft_cfg* = ptr kiss_fft_state

proc kiss_fft_alloc*(nfft: cint; inverse_fft: cint; mem: pointer; lenmem: ptr csize): kiss_fft_cfg {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc kiss_fft*(cfg: kiss_fft_cfg; fin: ptr kiss_fft_cpx; fout: ptr kiss_fft_cpx) {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc kiss_fft_stride*(cfg: kiss_fft_cfg; fin: ptr kiss_fft_cpx; fout: ptr kiss_fft_cpx; fin_stride: cint) {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc kiss_fft_free*(p: pointer) {.importc: "free", header: "<stdlib.h>".}

proc kiss_fft_cleanup*() {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc kiss_fft_next_fast_size*(n: cint): cint {.importc, header: "../../kiss_fft130/kiss_fft.h".}

proc kiss_fftr_next_fast_size_real*(n: cint): cint {.inline.} =
  return kiss_fft_next_fast_size((n + 1) shr 1) shl 1
