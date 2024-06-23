#import "fonts.typ":*
#import "utils.typ":*
#let cover_normal(
  title: "Title",
  authors: ("author1", "author2"),
  date: (2023, 5, 14),
) = {
  set page("a4", numbering: none, margin: (top: 25%));
  align(center)[
    #set par(leading: 1.5em);
    #text(title, size: font_size.小一, weight: "bold");\
    #{
      if type(authors) == "string" {
        text(authors, size: font_size.四号);
      } else {
        text(authors.join(" "), size: font_size.四号);
      }
    }\
    #date_format(date: date);
  ]
}
#let _info_key(body) = {
  rect(width: 100%, inset: 2pt, 
    stroke: none,
    text(
      font: font_style.songti,
      size: 16pt,
      body
  ))
}

#let _info_value(body) = {
  rect(
    width: 100%,
    inset: 2pt,
    stroke: (
      bottom: 1pt + black
    ),
    text(
      font: font_style.songti,
      size: 16pt,
      bottom-edge: "descender"
    )[
      #body
    ]
  ) 
}

#let cover_gdut_report( 
  title:"", 
  department:"", //学院
  major:"",
  grade_class:"",
  id:"", //学号
  author:"", //学生姓名
  teacher:"", //指导老师
  date:(2023, 04, 17),
  ) = {
  image("./asserts/school_badge.png", width: 15%)
  align(center)[
    #image("./asserts/school_name.png", width: 65%)\
    #text(title, size: 24pt, font: font_style.songti, weight: "bold")
  ]
  align(center + horizon)[
      #grid(
      columns: (70pt, 180pt),
      rows: (40pt, 40pt),
      gutter: 3pt,
      _info_key("学　　院"),
      _info_value(department),
      _info_key("专　　业"),
      _info_value(major),
      _info_key("年级班别"),
      _info_value(grade_class),
      _info_key("学　　号"),
      _info_value(id),
      _info_key("学生姓名"),
      _info_value(author),
      _info_key("指导教师"),
      _info_value(teacher),
      _info_key("成　　绩"),
      _info_value(""),
      )
  ]
  align(center + bottom)[#text(font: font_style.songti,size: 16pt,)[#date.at(0) 年 #date.at(1) 月 #date.at(2) 日]]
  pagebreak()
}

#let equation_num(n) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("equation-chapter" + str(chapt))
    // let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n)
  })
}

#let table_num(n) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("table-chapter" + str(chapt))
    // let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n)
  })
}

#let image_num(n) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("image-chapter" + str(chapt))
    // let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n)
  })
}

#let code_num(n) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("code-chapter" + str(chapt))
    // let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n)
  })
}

#let equation(equation, caption: "") = {
  figure(
    equation,
    caption: caption,
    supplement: [公式],
    numbering: equation_num,
    kind: "equation",
  )
}

#let tbl(tbl, caption: "") = {
  figure(
    tbl,
    caption: caption,
    supplement: [表],
    numbering: table_num,
    kind: "table",
  )
}

#let img(img, caption: "") = {
  figure(
    img,
    caption: caption,
    supplement: [图],
    numbering: image_num,
    kind: "image",
  )
}

#let code(code, caption: "") = {
  figure(
    align(left)[
      #code
    ],
    caption: caption,
    supplement: [代码],
    numbering: code_num,
    kind: "code",
  )
}
