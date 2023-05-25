let toolbaroptions=[
["bold","italic","underline"],
[{header:[1,2,3,4]}],
["code-block","blockquote"]
]
let quill=new Quill("#editor",{
modules:{
toolabar:true,},
theme:"snow"
})