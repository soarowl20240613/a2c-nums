// Convert an int string to Chinese number
#let str-to-cn-num(s) = {
  let digits = ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九")
  let units = ("", "十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千")
  let result = ""
  let len = s.len() - 1
  let i = len
  while i >= 0 {
    result = digits.at(int(s.at(i))) + units.at(len - i) + result;
    i -= 1
  }

  for i in (0, 1, 2, 3) {
    result = result.replace("零亿", "亿")
    result = result.replace("零万", "万")
    result = result.replace("零千", "零")
    result = result.replace("零百", "零")
    result = result.replace("零十", "零")
    result = result.replace("零零", "零")
    result = result.replace("亿万", "亿")
  }
  if result.len() > 3 and result.ends-with("零") {
    result = result.trim("零")
  }
  if result.len() == 9 or result.len() == 6 {
    result = result.replace("一十", "十")
  }
  return result
}

// Convert an int to Chinese number
#let int-to-cn-num(n) = {
  let s = str(n)
  return str-to-cn-num(s)
}

// Convert an int string to Chinese ancient number
#let str-to-cn-ancient-num(s) = {
  let digits = ("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖")
  let units = ("", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾", "佰", "仟")
  let result = ""
  let len = s.len() - 1
  let i = len
  while i >= 0 {
    result = digits.at(int(s.at(i))) + units.at(len - i) + result;
    i -= 1
  }

  for i in (0, 1, 2, 3) {
    result = result.replace("零亿", "亿")
    result = result.replace("零万", "万")
    result = result.replace("零仟", "零")
    result = result.replace("零佰", "零")
    result = result.replace("零拾", "零")
    result = result.replace("零零", "零")
    result = result.replace("亿万", "亿")
  }
  if result.len() > 3 and result.ends-with("零") {
    result = result.trim("零")
  }
  if result.len() == 9 or result.len() == 6 {
    result = result.replace("壹拾", "拾")
  }
  return result
}

// Convert an int to Chinese ancient number
#let int-to-cn-ancient-num(n) = {
  let s = str(n)
  return str-to-cn-ancient-num(s)
}

// Convert a number to Chinese currency
#let num-to-cn-currency(n) = {
  let digits = ("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖")
  let units = ("角", "分")
  let value = str(calc.round(n, digits: 2))
  let (intpart, decimal) = value.split(".")
  let result = ""
  if decimal != none {
    for (i, c) in decimal.codepoints().enumerate() {
      if i <= 1 {
        result += digits.at(int(c)) + units.at(i)
      }
    }
  }
  result = str-to-cn-ancient-num(intpart) + "元" + result
  return result
}