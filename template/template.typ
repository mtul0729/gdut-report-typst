#import "fonts.typ" :*
#import "utils.typ" :*
#import "covers.typ":*

#let _empty_par() = {
  v(-1em)
  box()
}

#let project(
  title: "Title",
  authors: ("author1", "author2"),
  date: (2023, 5, 14),
  //name: "测试名称",

  cover_style: "normal",

  department:"计算机科学与技术学院",
  id:"2020000000", //学号
  major:"",
  grade_class:"",
  author:"", //学生姓名
  teacher:"", //指导老师
  body
) = {
  set document(title: title, author: authors);
  set page("a4", numbering: "1")
  set text(font: font_style.songti, size: font_size.五号, lang: "zh");
  set par(first-line-indent: 2em);
  if cover_style == "normal" {
    cover_normal(
      title: title, 
      authors: authors,
      date: date
    );
  } else if cover_style == "gdut_report" {
    cover_gdut_report(
      title:title, 
      department:department, //学院
      major:major,
      grade_class:grade_class,
      id:id, //学号
      author:author, //学生姓名
      teacher:teacher, //指导老师
      date:date,
    );
  }
    show figure: it => {
    set align(center)
      locate(loc => {
        let chapt = counter(heading).at(loc).at(0)
        let c = counter(it.kind + "-chapter" + str(chapt))
        c.step()
      })
    if it.kind == "image" {
      set text(font: font_style.heiti, size: 12pt)
      it.body
      it.caption
    } else if it.kind == "table" {
      set text(font: font_style.heiti, size: 12pt)
      it.caption
      set text(font: font_style.songti, size: 10.5pt)
      it.body
    } else if it.kind == "equation" {
      // 通过大比例来达到中间和靠右的排布
      grid(
        columns: (20fr, 1fr),
        it.body,
        align(center + horizon, 
          it.counter.display(it.numbering)
        )
      )
    } else if it.kind == "code"{
      set text(font: font_style.songti, size: 10.5pt)
      it.body
      set text(font: font_style.songti, size: 10pt)
      it.caption
    } else {
      it
    }
  }

  show heading: it => {
    set text(weight: "bold", font: font_style.heiti, size: 12pt)
    set block(above: 1.5em, below: 1em)
    it
  } + _empty_par()
  
  set heading(numbering: (..nums) => {
    nums.pos().map(str).join(".") + "　"
  })

  show heading.where(level: 1): it => {
    set align(center)
    set text(weight: "bold", font: font_style.songti, size: 14pt)
    set block(spacing: 1em)
    it
  }

  show heading.where(level: 2): it => {
    set text(weight: "bold", font: font_style.songti, size: 12.5pt)
    it
  }

  body
}
