{ mkDerivation, base, sscript, stdenv }:
mkDerivation {
  pname = "base-converter";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  enableSeparateDocOutput = false;
  libraryHaskellDepends = [ base sscript ];
  executableHaskellDepends = [ base sscript ];
  homepage = "https://github.com/crazymind102/base-converter#readme";
  license = stdenv.lib.licenses.bsd3;
}
