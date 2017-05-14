
function has(flag, set) {
    return (set & (1 << flag)) != 0
}

function set(flag, set) {
    return set | (1 << flag)
}

function clear(flag, set) {
    return set & ~(1 << flag)
}

function toggle(flag, set) {
    return set ^ (1 << flag)
}
