//Compiled in OnlineGDB

function encrypt(txt, shift) {
    var charArray = txt.split('').map(function(char) {
        // Check if it is in the alphabet
        if (/[a-zA-Z]/.test(char)) {
            // Case Determinant
            var offset = /[a-z]/.test(char) ? 97 : 65;
            // Apply Shift and convert back
            var c = (char.charCodeAt(0) - offset + shift) % 26 + offset;
            return String.fromCharCode(c);
        }
        // Don't Change non-characters
        return char;
    });
  
    // Rejoin characters to String
    return charArray.join('');
}

function decrypt(txt, shift) {
    return encrypt (txt, 26-shift);
}

function solve(txt, shift) {
    shift = typeof shift !== 'undefined' ? shift : 0;
    if (shift > 25) {
        return;
    }
    print('Shift # ' + (shift + 1), encrypt(txt, shift)); 
    solve(txt, shift + 1);
}
