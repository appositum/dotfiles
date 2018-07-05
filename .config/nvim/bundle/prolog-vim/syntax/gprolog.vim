" Vim syntax file
" Language:    GNU-Prolog
" Maintainers: Sylvain Soliman <Sylvain.Soliman@inria.fr>
" Last Change: 2013 February 12

" include standard prolog syntax file
  runtime syntax/prolog.vim

" add missing ISO
  syn keyword prologKeyword   abs   atan  ceiling
  syn keyword prologKeyword   cos   end_of_file error
  syn keyword prologKeyword   exp   floor log
  syn keyword prologKeyword   mod   rem   sign
  syn keyword prologKeyword   sin   sqrt  truncate
  syn keyword prologKeyword   float_fractional_part   float_integer_part

" GNU-Prolog specific
  syn keyword gprologKeyword   abort   absolute_file_name
  syn keyword gprologKeyword   add_linedit_completion   add_stream_alias
  syn keyword gprologKeyword   add_stream_mirror   goal   append
  syn keyword gprologKeyword   architecture   argument_counter
  syn keyword gprologKeyword   argument_list   argument_value   atom_hash
  syn keyword gprologKeyword   atom_property   bind_variables
  syn keyword gprologKeyword   break   built_in   built_in_fd   callable
  syn keyword gprologKeyword   call_with_args   change_directory
  syn keyword gprologKeyword   character_count   close_input_atom_stream
  syn keyword gprologKeyword   close_input_chars_stream
  syn keyword gprologKeyword   close_input_code_stream
  syn keyword gprologKeyword   close_output_atom_stream
  syn keyword gprologKeyword   close_output_chars_stream
  syn keyword gprologKeyword   close_output_code_stream   compare
  syn keyword gprologKeyword   consult   cpu_time   current_alias
  syn keyword gprologKeyword   current_atom   current_bip_name
  syn keyword gprologKeyword   current_mirror   current_stream
  syn keyword gprologKeyword   date_time   decompose_file_name
  syn keyword gprologKeyword   delete   delete_directory   delete_file
  syn keyword gprologKeyword   directory_files   display   display_to_atom
  syn keyword gprologKeyword   display_to_chars   display_to_codes
  syn keyword gprologKeyword   ensure_loaded   environ   exec
  syn keyword gprologKeyword   expand_term   fd_all_different
  syn keyword gprologKeyword   fd_atleast   fd_at_least_one   fd_atmost
  syn keyword gprologKeyword   fd_at_most_one   fd_cardinality
  syn keyword gprologKeyword   fd_dom   fd_domain   fd_domain_bool
  syn keyword gprologKeyword   fd_element   fd_element_var   fd_exactly
  syn keyword gprologKeyword   fd_has_extra_cstr   fd_has_vector
  syn keyword gprologKeyword   fd_labeling   fd_labelingff   fd_max
  syn keyword gprologKeyword   fd_maximize   fd_max_integer   fd_min
  syn keyword gprologKeyword   fd_minimize   fd_not_prime   fd_only_one
  syn keyword gprologKeyword   fd_prime   fd_relation   fd_relationc
  syn keyword gprologKeyword   fd_set_vector_max   fd_size   fd_use_vector
  syn keyword gprologKeyword   fd_var   fd_vector_max   file_exists
  syn keyword gprologKeyword   file_permission   file_property
  syn keyword gprologKeyword   find_linedit_completion   for   foreign
  syn keyword gprologKeyword   format   format_to_atom   format_to_chars
  syn keyword gprologKeyword   format_to_codes   g_array_size   g_assign
  syn keyword gprologKeyword   g_assignb   g_dec   g_deco   generic_var
  syn keyword gprologKeyword   get   get0   get_key   get_key_no_echo
  syn keyword gprologKeyword   get_linedit_prompt   get_print_stream
  syn keyword gprologKeyword   get_seed   g_inc   g_inco   g_link
  syn keyword gprologKeyword   g_read   g_reset_bit   g_set_bit
  syn keyword gprologKeyword   g_test_reset_bit   g_test_set_bit
  syn keyword gprologKeyword   host_name   hostname_address   include
  syn keyword gprologKeyword   initialization   keysort   last
  syn keyword gprologKeyword   last_read_start_line_column   length
  syn keyword gprologKeyword   line_count   line_position   list
  syn keyword gprologKeyword   listing   list_or_partial_list   load
  syn keyword gprologKeyword   lower_upper   make_directory   max_list
  syn keyword gprologKeyword   member   memberchk   min_list   name
  syn keyword gprologKeyword   name_query_vars   name_singleton_vars
  syn keyword gprologKeyword   new_atom   non_fd_var   non_generic_var
  syn keyword gprologKeyword   nth   number_atom   number_codes
  syn keyword gprologKeyword   number_vars   open_input_atom_stream
  syn keyword gprologKeyword   open_input_chars_stream
  syn keyword gprologKeyword   open_input_code_stream
  syn keyword gprologKeyword   open_output_atom_stream
  syn keyword gprologKeyword   open_output_chars_stream
  syn keyword gprologKeyword   open_output_code_stream   os_version
  syn keyword gprologKeyword   partial_list   permutation   phrase   popen
  syn keyword gprologKeyword   portray_clause   predicate_property
  syn keyword gprologKeyword   prefix   print   print_to_atom
  syn keyword gprologKeyword   print_to_chars   print_to_codes
  syn keyword gprologKeyword   prolog_file_name   put   random
  syn keyword gprologKeyword   randomize   read_atom   read_from_atom
  syn keyword gprologKeyword   read_from_chars   read_from_codes
  syn keyword gprologKeyword   read_integer   read_number
  syn keyword gprologKeyword   read_pl_state_file   read_term_from_atom
  syn keyword gprologKeyword   read_term_from_chars
  syn keyword gprologKeyword   read_term_from_codes   read_token
  syn keyword gprologKeyword   read_token_from_atom
  syn keyword gprologKeyword   read_token_from_chars
  syn keyword gprologKeyword   read_token_from_codes   real_time
  syn keyword gprologKeyword   remove_stream_mirror   rename_file
  syn keyword gprologKeyword   retractall   reverse   see   seeing   seek
  syn keyword gprologKeyword   seen   select   send_signal   setarg
  syn keyword gprologKeyword   set_bip_name   set_linedit_prompt
  syn keyword gprologKeyword   set_seed   set_stream_buffering
  syn keyword gprologKeyword   set_stream_eof_action
  syn keyword gprologKeyword   set_stream_line_column   set_stream_type
  syn keyword gprologKeyword   shell   skip   sleep   socket   socket_accept
  syn keyword gprologKeyword   socket_bind   socket_close   socket_connect
  syn keyword gprologKeyword   socket_listen   sort   sort0   spawn
  syn keyword gprologKeyword   statistics   stop   stream_line_column
  syn keyword gprologKeyword   stream_position   sublist   suffix   sum_list
  syn keyword gprologKeyword   syntax_error_info   system   system_time
  syn keyword gprologKeyword   tab   tell   telling   temporary_file
  syn keyword gprologKeyword   temporary_file_name   term_expansion
  syn keyword gprologKeyword   term_ref   told   top_level   unget_byte
  syn keyword gprologKeyword   unget_char   unget_code   unlink
  syn keyword gprologKeyword   user_time   wait   working_directory
  syn keyword gprologKeyword   write_canonical_to_atom
  syn keyword gprologKeyword   write_canonical_to_chars
  syn keyword gprologKeyword   write_canonical_to_codes
  syn keyword gprologKeyword   write_pl_state_file   writeq_to_atom
  syn keyword gprologKeyword   writeq_to_chars   writeq_to_codes
  syn keyword gprologKeyword   write_term_to_atom   write_term_to_chars
  syn keyword gprologKeyword   write_term_to_codes   write_to_atom
  syn keyword gprologKeyword   write_to_chars   write_to_codes

  syn match   gprologOperator "#\\\?/\\\|#\\\?==>\|#=\?<#\?\|#\\\?=#\?\|#\\\?<=>\|##\|#>=\?#\?\|#\\\?\\/\?"

  syn match   gprologClauseHead  "^\(\l\w*\|'.*'\)\s*\((.*)\)\?\s*\(:-\|\.\)"

  syn keyword gprologTodo  contained TODO FIXME XXX
  syn match   gprologComment  "%.*" contains=gprologTodo
  syn region  gprologComment   start="/\*" end="\*/" contains=gprologTodo

  hi def link gprologComment  Comment
  hi def link gprologTodo     Todo
  hi def link gprologKeyword  Special
  hi def link gprologOperator SpecialChar
  hi def link gprologClauseHead Function

  let b:current_syntax = "gprolog"

" vim: ts=28
