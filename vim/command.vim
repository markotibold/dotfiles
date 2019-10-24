command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
" :W sudo saves the file
command! W w !sudo tee % > /dev/null
