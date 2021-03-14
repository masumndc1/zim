/*fn main() {
        println!("Hello, world!");
}*/

fn main() {
    use std::process::Command;

    let output = Command::new("sh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");

    let _hello = output.stdout;

    println("{}", _hello);

    //println!("{}", output.stdout);
}
