# Learning rkt
A definitive guide to teach you almost everything you need to know about how to best use rkt.

## What is rkt?

From the rkt GitHub page, "rkt (pronounced "rock-it") is a CLI for running app containers on Linux. rkt is designed to be secure, composable, and standards-based."

## Why rkt?

What is the benefit of app containers? How is this different from Docker? Well, Docker does one thing really really well, getting images up and running across many different platforms. However, there are some painpoints. In the simplest way:

1. You have to use Docker's daemon.
2. Docker does too much stuff.
3. You have to trust Docker.

Point 1 is addressed by rkt in the most beautiful way possible - it doesn't have a daemon. Instead, you use it with any init daemon, such as systemd.

Point 2 is addressed mostly by the way point 1 is addressed, Docker does many things. To do many things out of the box, Docker has a huge codebase, which leads to possible security issues; rkt handles this with a modular approach to adding on functionality.

Point 3 is addressed by being designed from the ground up with a focus on security. Everything Docker does goes through it's daemon, and the daemon has root access. This opens the door for security flaws, possibly flaws which could take control of your entire system if you don't take precautions with Docker.

## Requirements

1. Linux kernel 4.3+ -- execute `uname -r` to check
2. Not an OpenVZ VPS (OpenVZ doesn't work with rkt/acbuild) -- make sure `cat /proc/user_beancounters` doesn't run
3. systemd >= v222 -- execute `systemctl --version` to check


## Getting started

rkt uses Application Container Images also known as ACIs. To build ACIs, you need to use a tool called [acbuild](https://github.com/appc/acbuild). 

1. Pull down the latest rkt & acbuild via `curl https://github.com/farazfazli/learning-rkt/blob/master/update.sh | sh`.
2. Go ahead and read [this](https://github.com/appc/acbuild/blob/master/Documentation/getting-started.md).

Now, you should have a fundamental understanding with how to use acbuild. You probably noticed that when you run something, you can't just put it in the background. This is because to do that, you need to use an init daemon such as systemd, which we will talk about in a bit.

3. Let's make a file to run inside our ACI. `read -p "Hello, world" >> hello.sh`
4. And now let's put it inside an ACI.

// TODO: ACI example

To interact with rkt using systemd, we will make a unit file. Read [this article](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files) to learn more about unit files if you aren't familiar with them.

Now let's make a simple one ourselves.

// TODO: Unit file example





<!--
## Delete all pods

Testing pods frequently and need to clean up your rkt list? Delete all pods with a single command if you don't feel like changing your ```rkt gc``` grace period.
```
sudo rkt rm $(rkt list --no-legend=true | cut -c-5)
```
-->
