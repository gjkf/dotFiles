let s:current_file = expand("%:p")

"
" Gets the current project folder
"

function GetCurrentProject()
  let projects = split(globpath("/home/cossu/Documents/C++/", "**/"), "\n")
  for proj in projects
    if s:current_file =~ proj
      return proj
    endif
  endfor
endfunction

"
" Returns a list of all the .cpp of the current project
"

function ListCPP()
  return split(globpath(GetCurrentProject(), "**/*.cpp"), "\n")
endfunction

"
" Returns a list of all the .hpp of the current project
"

function ListHPP()
  return split(globpath(GetCurrentProject(), "**/*.hpp"), "\n")
endfunction

"
" Returns the CMakeLists.txt path of the current project. If there is none it retruns 0
"

function GetCMakeLists()
  if filereadable(GetCurrentProject() . "CMakeLists.txt")
    return GetCurrentProject() . "CMakeLists.txt"
  else
    return 0
  endif
endfunction

"
" Writes the CMakeLists.txt file if it does not yet exists. Updates it otherwise
"

function WriteCMakeLists()
  let name = ""
  if GetCMakeLists() != 0
    let file = readfile(GetCMakeLists())
    let s = split(file[0], "add_executable(")
    let name =  s[0][:-2]
  endif
  if name == ""
    call inputsave()
    let name = input("Executable name: ")
    call inputrestore()
    redraw
  endif

  let lines = ["add_executable(" . name . " "]
  call extend(lines, ListCPP())
  call extend(lines, ListHPP())
  call extend(lines, [")"])

  " I need this uglyness else an extra ',' is printed and breakes the program
  let print = lines[0] . "\n"
  for i in range(1,len(lines)-3)
    let print = print . lines[i] . ",\n"
  endfor
  let print = print . lines[len(lines)-2] . "\n"
  let print = print . lines[len(lines)-1]
  call writefile(split(print, "\n"), GetCurrentProject() . "CMakeLists.txt")
endfunction

"
" Returns the project Makefile if it exists. 0 otherwise
"

function GetMakefile()
  if filereadable(GetCurrentProject() . "Makefile")
    return GetCurrentProject() . " Makefile"
  else
    return 0
  endif
endfunction

"
" Runs cmake for the current project
"

function CMakeProject()
  exec "!cd " . GetCurrentProject() . " && cmake ."
endfunction

function MakeProject()
  exec "!cd " . GetCurrentProject() . " && make"
endfunction

nmap <leader>cml :call WriteCMakeLists()<CR>
nmap <leader>cmp :call CMakeProject()<CR>
nmap <leader>mmp :call MakeProject()<CR>

nmap <leader>fft :call WriteCMakeLists()<CR> :call CMakeProject()<CR> :call MakeProject()<CR>
