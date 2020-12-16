# base-converter
An app to convert one number from one base to another.

## Usage
```
$ > base-converter [digits of the number] baseOfNumber baseYouWantToHave
```
Example:
```
$ > base-convert [1,2,4] 10 16
7C₁₆
$ > base-convert [10,8,13] 16 10
2701₁₀
```

## How to install
You need to download stack or install it on your system through your package manager.

Then you download the repository through git or manual.

After unpacking or downloading from git you have to switch into the folder of base-converter.

Then run stack `setup setup` followed by `stack install`.
```
$ > cd base-converter
$ > stack build
$ > stack install
```
