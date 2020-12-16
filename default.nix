{ mkDerivation, base, hpack, sscript, stdenv }:
mkDerivation {
  pname = "base-converter";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base sscript ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [ base sscript ];
  testHaskellDepends = [ base sscript ];
  prePatch = "hpack";
  homepage = "https://github.com/crazymind102/base-converter#readme";
  license = stdenv.lib.licenses.bsd3;
}
