pub mod run_command {
    use std::process::Command;
    pub fn ping(x: usize) {
        print!("value of x is {}", x);
        Command::new("/sbin/ping")
            .arg("-c")
            .arg("&x")
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
