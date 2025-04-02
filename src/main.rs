#![no_std]
#![no_main]

#[macro_use]
extern crate log;
#[macro_use]
extern crate alloc;

extern crate axstd as std;

mod hal;
mod task_ext;
mod vmm;

mod libos;

#[unsafe(no_mangle)]
fn main() {
    info!("Starting virtualization...");

    info!("Hardware support: {:?}", axvm::has_hardware_support());

    hal::enable_virtualization();

    vmm::init();

    vmm::start();

    info!("VMM shutdown");
}
