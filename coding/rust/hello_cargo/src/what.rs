pub mod bot {
    pub fn number(x: i8) {
        let guess: u32 = "42".parse().expect("Not a Number!");
        println!("The guess is {}", guess);
        println!("The guess is {}", x);
    }
//    pub fn number() {}
    pub fn five(x: i32) -> i32 {
        let x = x + 1;
        x
    }
}
