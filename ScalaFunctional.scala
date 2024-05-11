object CaesarCipher {
  // Compiled in Scastie
  
  val Alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 

  def encrypt(text: String, shift: Int): String = {
    //text.map { => sepearates each letter in the string and works with each one
    text.map { char =>
      val index = Alphabet.indexOf(char.toUpper) 
      if (index != -1) {
        val shiftedIndex = (index + shift + Alphabet.length) % Alphabet.length 
        Alphabet(shiftedIndex).toString
      } else {
        char.toString //if its not a valid character do not edit it (such as punctuation)
      }
    }.mkString
    //combine all the letters back together using .mkstring
  }

  def decrypt(text: String, shift: Int): String = {
    encrypt(text, -shift) 
  }

//Helper function tryDecrypt goes through each possible shift
  def solve(text: String): Unit = {
    def tryDecrypt(text: String, shift: Int): Unit = {
      if (shift < 27) {
        val encryptedText = encrypt(text, shift)
        println(s"Caesar $shift: $encryptedText")
        tryDecrypt(text, shift + 1)
      }
    }
  
  tryDecrypt(text, 1)
}  }
  def main(args: Array[String]): Unit = {
    var encryptedText: String = encrypt("abcdefghijklmnopqrstuvwxyz", 26)
    println(s"Encrypted text: $encryptedText")

    encryptedText= encrypt("Jackdaws love my big sphinx of quartz.", 5)
    println(s"Encrypted text: $encryptedText")

    encryptedText = decrypt("hello", 3)
    println(s"Decrypted text: $encryptedText")

    solve("hello")
  }
}
