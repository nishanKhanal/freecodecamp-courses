// Make a
// function that looks through an array of objects(first argument) and returns an array of all objects that have matching name and value pairs(second argument).Each name and value pair of the source object has to be present in the object from the collection
// if it is to be included in the returned array.

// For example,
// if the first argument is[{ first: "Romeo", last: "Montague" }, { first: "Mercutio", last: null }, { first: "Tybalt", last: "Capulet" }], and the second argument is { last: "Capulet" }, then you must
// return the third object from the array(the first argument), because it contains the name and its value, that was passed on as the second argument.

function whatIsInAName(collection, source) {
    let source_length = Object.keys(source).length
    const to_return = [];
    let count = 0;
    for (let obj of collection) {
        count = 0;
        for (let src_key in source) {
            if (!(src_key in obj)) {
                break;
            } else if (obj[src_key] != source[src_key]) {
                break;
            }
            count++;
        }
        if (count == source_length) {
            to_return.push(obj)
        }
    }

    return to_return;
}

console.log(whatIsInAName([{ "apple": 1, "bat": 2 }, { "bat": 2 }, { "apple": 1, "bat": 2, "cookie": 2 }], { "apple": 1, "bat": 2 }));

// const a = [1,2,3,4]
// for(let i in a){
//   console.log(i)
// }