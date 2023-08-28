# vim-octave

Octave syntax and indentation support for Vim:

* Syntax highlighting is taken from
  [Rik's script](https://www.vim.org/scripts/script.php?script_id=3600)
* Identation is ported accordingly using upstream Lua's as a base.

## Features

From the syntax file description:

* Highlights entire Octave grammar (`endwhile`, `endfor`, etc.),
  not just Matlab keywords
* Updated to highlight all core Octave functions as of version 4.2.0
* Highlights user functions and anonymous functions [`@(...)`]
  from within the `.m` file being edited
* Use-dependent highlighting of Octave system variables
    - When querying system variables, keyword is highlighted as a constant.
      For example, `var = true`, highlights `true` as a constant.
    - When setting variables or otherwise invoking keyword as a function,
      keyword is highlighted as a function.  For example, `var = true (2,4)`,
      highlights `true` as a function.
* Support for multi-line strings with line continuation characters
  as well as escaped quotes (`\"` or `\'`) within string.
* Support for multi-line block comments
* Support for highlighting numbers that use hex (0x) or binary (0b) syntax
* Error highlighting for bad number syntax, bad structure variable names,
  bad block comments, bad line continuations.
* Optional support for highlighting operators (`+`, `-`, `*`, etc.),
  user variables, or tabs, which can be achieved by uncommenting
  appropriate tagged lines in the syntax file.

The indentation file provides basic automatic indentation of blocks.

## Installations

1. Install [Pathogen](https://github.com/tpope/vim-pathogen),
   [Vundle](https://github.com/VundleVim/Vundle.vim),
   [NeoBundle](https://github.com/Shougo/neobundle.vim),
   or [Plug](https://github.com/junegunn/vim-plug) package manager for Vim.
2. Use this repository as submodule or package.

For example, when using [Plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'https://github.com/gnu-octave/vim-octave.git', {'for': 'octave'}
```

You can also use Vim 8 built-in package manager:

```sh
mkdir -p ~/.vim/pack/default/start
git clone https://github.com/gnu-octave/vim-octave.git ~/.vim/pack/default/start/vim-octave
```

Note that this plugin contributes to
[vim-polyglot](https://github.com/sheerun/vim-polyglot) language pack.

## Usage

The plugin should work out of the box.  You can enable omni completion
by setting `omnifunc=syntaxcomplete#Complete`.
