if exists("current_compiler")
  finish
endif
let current_compiler = "xmllint"
setlocal makeprg=xmllint\ --noout\ %
setlocal errorformat=%f:%l:\ %m
