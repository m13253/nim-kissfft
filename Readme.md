Nim-KissFFT
============

Nim binding of KissFFT library.

Usage
-----

```nimrod
import kissfft/kissfft

var
  kFft = kissfft.newKissFFT(1024, false)
  fin: array[1024, kissfft.Complex]
  fout: array[1024, kissfft.Complex]

kFft.transform(fin, fout)
```

You can also use `transform_as_vec` or `transform_norm` if convenient.

For C style low-level API access, `import kissfft/binding`.

License
-------

This library is licensed under BSD license.

See the COPYING file for more information.
