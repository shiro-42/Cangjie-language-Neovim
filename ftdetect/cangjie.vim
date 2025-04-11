" Detect files with .cj extension and use cangjie.vim syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.cj set filetype=cangjie
augroup END
