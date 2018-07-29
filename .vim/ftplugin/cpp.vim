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

function ListCPP()
  return split(globpath(GetCurrentProject(), "**/*.cpp"), "\n")
endfunction

function ListHPP()
  return split(globpath(GetCurrentProject(), "**/*.hpp"), "\n")
endfunction

function GetCMakeLists()
  if filereadable(GetCurrentProject() . "CMakeLists.txt")
    return GetCurrentProject() . "CMakeLists.txt"
  else
    " TODO: write the CMakeLists method
    "writefile("", GetCurrentProject() . "CMakeLists.txt")  
  endif
endfunction
