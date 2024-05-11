'
'Compiled in OnlineGDB
'

Module CaesarCipher
    Private Alphabet As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    Function Encrypt(ByVal text As String, ByVal shift As Integer) As String
        Dim result As String = ""
        For Each c As Char In text
            Dim index As Integer = Alphabet.IndexOf(Char.ToUpper(c))
            If index <> -1 Then
                Dim shiftedIndex As Integer = (index + shift + Alphabet.Length) Mod Alphabet.Length
                result &= Alphabet(shiftedIndex)
            Else
                result &= c
            End If
        Next
        Return result
    End Function

    Function Decrypt(ByVal text As String, ByVal shift As Integer) As String
        Return Encrypt(text, -shift)
    End Function

    Sub Solve(ByVal text As String)
        For i As Integer = 1 To Alphabet.Length - 1
            Dim encryptedText As String = Encrypt(text, i)
            Console.WriteLine("Encrypted text: " & encryptedText)
        Next
    End Sub

    Sub Main()
        Dim encryptedText As String = Encrypt("Hello Visual Basic", 3)
        Console.WriteLine("Encrypted text: " & encryptedText)

        encryptedText = Encrypt("abcdefghijklmnopqrstuvwxyz", 5)
        Console.WriteLine("Encrypted text: " & encryptedText)
        
        encryptedText = Decrypt("abcdefghijklmnopqrstuvwxyz", 5)
        Console.WriteLine("Encrypted text: " & encryptedText)
        
        Solve("hello")
    End Sub
End Module
