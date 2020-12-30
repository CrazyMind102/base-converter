# base-converter
An app to convert one number from one base to another.

## Usage
```
$ > base-converter [digits of the number] baseOfNumber baseYouWantToHave
```
Example:
```
$ > base-converter [1,2,4] 10 16
7C₁₆
$ > base-converter [10,8,13] 16 10
2701₁₀
```

## How to install
### Using cabal
You need to download cabal or install it on your system through your package manager.

Then you download the repository or clone it with git.

After unpacking or cloning switch into the folder of base-conveter.

Then run `cabal new-install`.
```
$ > cd base-converter
$ > cabal new-install
```

### Using stack
You need to download stack or install it on your system through your package manager.

Then you download the repository or clone it with git.

After unpacking or cloning switch into the folder of base-conveter.

Then run `stack setup` followed by `stack install`.
```
$ > cd base-converter
$ > stack setup
$ > stack install
```

### Using nix
You need to download stack or install it on your system through your package manager.

Then you download the repository or clone it with git.

After unpacking or cloning switch into the folder of base-conveter.

Then run `nix-build release.nix`.
```
$ > cd base-converter
$ > nix-build release.nix
```
