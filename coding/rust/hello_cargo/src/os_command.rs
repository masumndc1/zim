pub mod run_command {
    use std::process::Command;
    pub fn ping(x: i16) {
        print!("value of x is {}", x);
        Command::new("/sbin/ping")
            .arg("-c")
            .arg("2")
            .arg("localhost")
            .spawn()
            .expect("failed to execute process");
    }
    pub fn listing() {
        Command::new("ls")
            .arg("-a")
            .spawn()
            .expect("failed to execute process");
    }
}
