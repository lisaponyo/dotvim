" The prefix key.
call unite#set_substitute_pattern('files', '^\~', substitute($HOME, '\\', '/', 'g'))
call unite#set_substitute_pattern('files', '^\@<!/', '*/')

let g:unite_source_file_mru_limit = 200
