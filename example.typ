#import "template/template.typ": *

#show: project.with(
  title:"《ACM程序设计》课程报告", 
  department:"计算机学院", //学院
  major:"计算机科学与技术", //专业
  grade_class:"2022级0班",
  id:"3122000000", //学号
  author:"张三", //学生姓名
  teacher:"李四", //指导老师
  date:(2024, 06, 23),
  cover_style: "gdut_report",
)

#toc()
#pagebreak()

= 大标题测试

== 小标题测试

=== 三级标题测试

大学之道，在明明德，在亲民，在止于至善。

知止而后有定；
定而后能静；静而后能安；
安而后能虑；虑而后能得。
物有本末，事有终始。知所先后，则近道矣。

古之欲明明德于天下者，先治其国；
欲治其国者，先齐其家；
欲齐其家者，先修其身；
欲修其身者，先正其心；
欲正其心者，先诚其意；
欲诚其意者，先致其知；
致知在格物。

物格而后知至；知至而后意诚；
意诚而后心正；心正而后身修；
身修而后家齐；家齐而后国治；
国治而后天下平。
自天子以至于庶人，壹是皆以修身为本。
其本乱而末治者，否矣。
其所厚者薄，而其所薄者厚，未之有也。
此谓知本，此谓知之至也。

== 小标题测试2

测试测试

= 大标题测试2

#img(
image("./template/asserts/school_name.png"),
caption: "测试图片, 广东工业大学",
) <img:test>


#equation(
  $a^2 + b^2 = c^2$,
  caption: "勾股定理",
) <equation:test>

公式测试引用@equation:test

#tbl(
table(
columns: (auto, auto),
  [姓名], [性别],
  [张三], [男],
  [李四], [女],
    ),
  caption: "测试表格",
) <table:test>

表格测试引用@table:test

#code(
```cpp
  #include <iostream>
  int main() {
    std::cout << "Hello World!\n";
    return 0;
  }
```,
  caption: "测试代码",
) <code:test>

#code(
```python
  print("Hello World!")
  ```,
  caption: "测试代码2",
) <code:test2>

代码测试引用@code:test,
代码测试引用@code:test2

测试参考文献引用@test

图片测试引用@img:test
#bibliography("bib.yaml", style:"gb-7714-2015-numeric")
