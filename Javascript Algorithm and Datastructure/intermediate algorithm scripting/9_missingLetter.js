// Missing letters
// Find the missing letter in the passed letter range and return it.

// If all letters are present in the range, return undefined.

// fearNotLetter("abce") should return the string d.
// fearNotLetter("abcdefghjklmno") should return the string i.
// fearNotLetter("stvwx") should return the string u.
// fearNotLetter("bcdf") should return the string e.
// fearNotLetter("abcdefghijklmnopqrstuvwxyz") should return undefined.

function fearNotLetter(str) {
    const alphabets = "abcdefghijklmnopqrstuvwxyz"
    let f_index = alphabets.indexOf(str[0]);
    let l_index = alphabets.indexOf(str[str.length - 1])

    for (let i = f_index + 1; i < l_index; i++) {
        if (str.indexOf(alphabets[i]) == -1) {
            return alphabets[i];
        }
    }

    return undefined;
}

fearNotLetter("abce");