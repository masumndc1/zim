fn main() {
    println!("Hello, world!");
    // this is nice. is not it?
    println!("Hello, masum!");

    number(8);

    // let y = five(6);
    println!("The value of y is: {}", y = five(6));
}

fn number(x: i8) {
    let guess: u32 = "42".parse().expect("Not a Number!");
    println!("The guess is {}", guess);
    println!("The guess is {}", x);
}

fn five(x: i32) -> i32 {
    let x = x + 1;
    x
}
