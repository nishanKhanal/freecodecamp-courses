// Caesars Cipher
// One of the simplest and most widely known ciphers is a Caesar cipher, also known as a shift cipher. In a shift cipher the meanings of the letters are shifted by some set amount.

// A common modern use is the ROT13 cipher, where the values of the letters are shifted by 13 places. Thus A ↔ N, B ↔ O and so on.

// Write a function which takes a ROT13 encoded string as input and returns a decoded string.

// All letters will be uppercase. Do not transform any non-alphabetic character (i.e. spaces, punctuation), but do pass them on.


// Tests
// Passed:rot13("SERR PBQR PNZC") should decode to the string FREE CODE CAMP
// Passed:rot13("SERR CVMMN!") should decode to the string FREE PIZZA!
// Passed:rot13("SERR YBIR?") should decode to the string FREE LOVE?
// Passed:rot13("GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT.") should decode to the string THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.


function rot13(str) {
    let new_str = "";
    for (let char of str) {
        let ascii = char.charCodeAt();
        if (ascii >= 65 && ascii <= 90) {
            ascii = (ascii - 13 + 65) % 26 + 65;
        }
        new_str += String.fromCharCode(ascii)
    }
    return new_str;
}

console.log(rot13("SERR PBQR PNZC"));

// to convert from character to ascii
// console.log("M".charCodeAt())

// to convert from ascii to string
// console.log(String.fromCharCode(65-13))