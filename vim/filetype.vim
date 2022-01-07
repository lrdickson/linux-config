if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" Xaml
	au BufNewFile,BufRead *.xaml setf xml
	" csv
	au! BufNewFile,BufRead *.csv setf csv
	" yaml
	au BufNewFile,BufRead *.yaml,*.yml setf yaml
augroup end
