if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" csv
	au! BufNewFile,BufRead *.csv setf csv
	" jenkinsfile
	au! BufNewFile,BufRead *.jenkinsfile setf groovy
	" xaml
	au BufNewFile,BufRead *.xaml setf xml
	" yaml
	au BufNewFile,BufRead *.yaml,*.yml setf yaml
augroup end
