// Compare two arrays and return a new array with any items only found in one of the two given arrays, but not both. In other words, return the symmetric difference of the two arrays.

// Note: You can return the array with its elements in any order.

function diffArray(arr1, arr2) {
    const newArr = [];
    for (let i = 0; i < arr1.length; i++) {
        if (arr2.includes(arr1[i])) {
            arr2.splice(arr2.indexOf(arr1[i]), 1);
        } else {
            newArr.push(arr1[i]);
        }
    }
    return newArr.concat(arr2);
}

diffArray([1, 2, 3, 5], [1, 2, 3, 4, 5]);