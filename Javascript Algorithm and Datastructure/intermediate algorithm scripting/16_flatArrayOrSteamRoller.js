// Steamroller
// Flatten a nested array. You must account for varying levels of nesting.


// steamrollArray([[["a"]], [["b"]]]) should return ["a", "b"].
// steamrollArray([1, [2], [3, [[4]]]]) should return [1, 2, 3, 4].
// steamrollArray([1, [], [3, [[4]]]]) should return [1, 3, 4].
// steamrollArray([1, {}, [3, [[4]]]]) should return [1, {}, 3, 4].
// Your solution should not use the Array.prototype.flat() or Array.prototype.flatMap() methods.
// Global variables should not be used.


function steamrollArray(arr) {
    const flattened_array = []

    function flatten(arr) {
        if (!(arr instanceof Array)) {
            flattened_array.push(arr);
            return
        }
        if (arr.length == 0) {
            return
        }
        flatten(arr[0])
        flatten(arr.slice(1, ))
    }

    flatten(arr)
    return flattened_array;
}

(steamrollArray([
    [
        ["a"]
    ],
    [
        ["b"]
    ]
]));