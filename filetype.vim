if exists("did_load_filetypes")
      finish
endif

augroup filetypedetect
    au! BufNewFile,BufRead *.mako setf mako
    au! BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    au! BufRead,BufNewFile *.vala,*.vapi setfiletype vala
augroup END
