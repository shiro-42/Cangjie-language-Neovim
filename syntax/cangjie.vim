" Syntax highlighting for Cangjie

" Catpuccin color scheme
let s:rosewater = "#f4dbd6"
let s:flamingo = "#f0c6c6"
let s:pink = "#f5bde6"
let s:mauve = "#c6a0f6"
let s:red = "#ed8796"
let s:maroon = "#ee99a0"
let s:peach = "#f5a97f"
let s:yellow = "#eed49f"
let s:green = "#a6da95"
let s:teal = "#8bd5ca"
let s:sky = "#91d7e3"
let s:sapphire = "#7dc4e4"
let s:blue = "#8aadf4"
let s:lavender = "#b7bdf8"
let s:text = "#cad3f5"
let s:subtext1 = "#b8c0e0"
let s:subtext0 = "#a5adcb"
let s:overlay2 = "#939ab7"
let s:overlay1 = "#8087a2"
let s:overlay0 = "#6e738d"
let s:surface2 = "#5b6078"
let s:surface1 = "#494d64"
let s:surface0 = "#363a4f"
let s:base = "#24273a"
let s:mantle = "#1e2030"
let s:crust = "#181926"

syntax cluster CJAll contains=CJKeyword,CJTypes,CJNumber,CJFloat,CJCoreFunc,CJString,CJComment,CJSingleQuoteString

syntax keyword CJKeyword return func type enum import main from spawn quote macro synchronized struct foreign inout prop unsafe get set
syntax keyword CJKeyword if else for while do package break continue match case in try with catch finally throw is as
syntax keyword CJKeyword let var const false true mut
syntax keyword CJKeyword class extend open public private static operator interface this super init protected override redef abstract

syntax keyword CJTypes Int Int16 Int32 Int64 IntNative UInt8 UInt16 UInt32 UInt64 UIntNative
syntax keyword CJTypes Bool String Rune Array HashMap Range Tuple ArrayList Unit Nothing Some
syntax keyword CJTypes CPointer CString This

syntax keyword CJCoreFunc println print refEq releaseArrayRawData sizeOf zeroValue ifNone ifSome eprint eprintln alignOf acquireArrayRawData
syntax keyword CJCoreFunc CJ_CORE_AddAtexitCallback CJ_CORE_ExecAtexitCallbacks

" Match integer formats with base prefixes, underscores, and suffixes
syntax match CJNumber /\v<0[bBoOxX][0-9A-Fa-f_]+(i(8|16|32|64)|u(8|16|32|64))?>/
syntax match CJNumber /\v<\d+(_\d+)*(i(8|16|32|64)|u(8|16|32|64))?>/

" Match floats with optional underscores and suffixes
syntax match CJFloat /\v<(\d+(_\d+)*\.\d+(_\d+)*)(i(8|16|32|64)|u(8|16|32|64))?>/

" Match strings with possible interpolation
syntax region CJString start=/"/ skip=/\\./ end=/"/ contains=CJInterpolated
syntax region CJString start=/'/ skip=/\\./ end=/'/ contains=CJInterpolated

" Match ${...} inside strings
syntax region CJInterpolated start=/\${/ end=/}/ contained contains=@CJAll

" Match comments and comment blocks
syntax match CJComment /\/\/.*/
syntax region CJBlockComment start=/\/\*/ end=/\*\//

" Match types assignation
syntax match CJTypes /\v\w+!\s*:\s*\zs[A-Z]\w+/
syntax match CJTypes /\v:\s*\zs[A-Z]\w+/
syntax match CJTypes /\v\)\s*:\s*\zs[A-Z]\w+/
syntax match CJTypes /\v<\s*\zs[A-Z]\w+/
syntax match CJTypes /\v,\s*\zs[A-Z]\w+/

syntax match CJMember /\v\.\zs[_A-Za-z]\w*/


execute 'highlight CJKeyword ctermfg=Red gui=italic guifg=' . s:red
execute 'highlight CJCoreFunc ctermfg=Red guifg=' . s:lavender
execute 'highlight CJTypes ctermfg=Blue guifg=' . s:blue
execute 'highlight CJNumber ctermfg=Yellow guifg=' . s:yellow
execute 'highlight CJFloat ctermfg=Yellow guifg=' . s:yellow
execute 'highlight CJString ctermfg=Green guifg=' . s:green
execute 'highlight CJInterpolated ctermfg=Green guifg=' . s:subtext1
execute 'highlight CJComment ctermfg=Grey guifg=' . s:subtext0
execute 'highlight CJBlockComment ctermfg=Grey guifg=' . s:subtext0
execute 'highlight CJMember ctermfg=LightBlue guifg=' . s:mauve
