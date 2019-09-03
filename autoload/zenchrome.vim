function! zenchrome#GetColors()
  let colors = {}
  " Ensure one highlight group per line
  let highlights = substitute(execute('highlight'), '\n\s\+', ' ', 'g')
  for highlight in split(highlights, '\n')
    let attributes = {}
    let group = split(highlight)[0]
    let group_attributes = split(highlight)[2:]
    if group_attributes[0] ==# 'cleared'
      let attributes = 'cleared'
    elseif group_attributes[0] ==# 'links'
      let attributes['links'] = group_attributes[-1]
    else
      for attribute in group_attributes
         let attribute_name = split(attribute, '=')[0]
         let attribute_value = split(attribute, '=')[-1]
         let attributes[attribute_name] = attribute_value
      endfor
    endif
    let colors[group] = attributes
  endfor
  return colors
endfunction

function! zenchrome#SetColors(colors)
  for highlight in items(a:colors)
    let group       = highlight[0]
    let attributes  = highlight[1]
    if index(keys(attributes), 'links') == 0
      execute 'highlight link' group join(values(attributes))
    else
      execute 'highlight' group join(map(items(attributes), "join(v:val, '=')"))
    endif
  endfor
endfunction

function! zenchrome#ClearUndefinedColors(colors)
   for group in keys(filter(zenchrome#GetColors(), '!has_key(a:colors, v:key)'))
     execute 'highlight' group 'NONE'
   endfor
endfunction
