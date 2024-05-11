fun encrypt (ciphertext : string, shift : int) =
    let
        fun shiftChar c =
            if Char.isAlpha c then
                let
                    val base = if Char.isLower c then Char.ord #"a" else Char.ord #"A"
                    val shifted = (Char.ord c - base + shift) mod 26
                in
                    Char.chr (base + shifted)
                end
            else
                c
    in
        implode (map shiftChar (explode ciphertext)) 
    end;

(* Explode the string into a list of characters, apply shiftChar function to each character, then implode the result back into a string *)

fun decrypt (ciphertext : string, shift : int) =
    let
        val decryptShift = ~shift
    in
        encrypt (ciphertext, decrypt)
    end;

fun solve (ciphertext : string) =
    let
        fun tryDecrypt (shift : int) =
            if shift > 25 then
                []
            else
                let
                    val decrypted = decrypt (ciphertext, shift)
                in
                    decrypted :: tryDecrypt (shift + 1)
                end

        val attempts = tryDecrypt 0
    in
        attempts
    end;
