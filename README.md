[![Travis CI](https://img.shields.io/travis/rcook/req-url-extra/master.svg)](https://travis-ci.org/rcook/req-url-extra)
[![Hackage](https://img.shields.io/hackage/v/req-url-extra.svg)](http://hackage.haskell.org/package/req-url-extra)
[![Hackage dependencies](https://img.shields.io/hackage-deps/v/req-url-extra.svg)](http://hackage.haskell.org/package/req-url-extra)
[![Stackage Nightly](http://stackage.org/package/req-url-extra/badge/nightly)](http://stackage.org/nightly/package/req-url-extra)
[![Stackage LTS](http://stackage.org/package/req-url-extra/badge/lts)](http://stackage.org/lts/package/req-url-extra)
[![Licence](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rcook/req-url-extra/master/LICENSE)

# req-url-extra

This package provides helper functions to make working with `Url` from [Req][req] easier.

## Dev guide

This project can be built using the [Stack][stack] build tool.

### Clone repository

```
git clone https://github.com/rcook/req-url-extra.git
```

### Build

```
stack build
```

### Test

```
stack test
```

### Upload package

```
stack upload .
```

### Upload documentation

I use my [`upload-haddocks`][upload-haddocks] tool which requires a functioning installation of Python and pip:

```
pip install --user upload-haddocks
upload-haddocks
```

## Releases

[View change log for more information][change-log]

## Licence

[MIT License][licence]

Copyright &copy; 2018-2019, Richard Cook.

[change-log]: CHANGELOG.md
[licence]: LICENSE
[req]: https://hackage.haskell.org/package/req
[stack]: http://haskellstack.org/
[upload-haddocks]: https://github.com/rcook/upload-haddocks
