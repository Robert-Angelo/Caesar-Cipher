object CaesarCipher {
def encrypt(text: String, shift: Int): String = {
  val shiftValue = shift % 26
  val shiftedText = new StringBuilder
  for (char <- text) {
    if (char.isLetter) {
      val isUpperCase = char.isUpper
      val base = if (isUpperCase) 'A' else 'a'
      var shiftedChar = (char + shiftValue - base) % 26 + base
      if (shiftedChar < base) shiftedChar += 26
      shiftedText.append(shiftedChar.toChar)
    } else {
      shiftedText.append(char)
    }
  }
  shiftedText.toString
}

  def decrypt(text: String, shift: Int): String = {
    encrypt(text, -shift) //-shift for backwards
  }

  def solve(text: String): Unit = {
    for (i <- 1 until 27) {
      val encryptedText = encrypt(text, i)
      println(s"Iteration $i: $encryptedText")
    }
  }

  def main(args: Array[String]): Unit = {
    var encryptedText: String = encrypt("Hello Scala", 3)
    println(s"Encrypted text: $encryptedText")
    encryptedText= decrypt("abcdefghijklmnopqrstuvwxyz", 5)
    println(s"Decrypted text: $encryptedText")
    solve("hello")
  }
}
