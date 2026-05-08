# Troubleshooting

## WSL not installed

Run in PowerShell as Administrator:

```powershell
wsl --install
```

Restart Windows after installation.

---

## Ubuntu does not start

Check installed distros:

```powershell
wsl -l -v
```

Try launching explicitly:

```powershell
wsl -d Ubuntu-24.04
```

---

## Virtualization disabled

Enable virtualization in BIOS:

- Intel VT-x
- AMD-V / SVM Mode

Check status:

Task Manager → Performance → CPU

Expected:

```text
Virtualization: Enabled
```

---

## Unsupported Ubuntu version

Verify Ubuntu version:

```bash
lsb_release -a
```

Supported versions:

| Ubuntu | Codename | ROS2 |
|---|---|---|
| 24.04 | noble | Jazzy |
| 22.04 | jammy | Humble |

---

## ROS source conflicts

Remove conflicting sources:

```bash
sudo rm -f /etc/apt/sources.list.d/ros2.list
sudo rm -f /etc/apt/sources.list.d/ros2.sources
sudo rm -f /etc/apt/sources.list.d/ros-latest.list
sudo rm -f /etc/apt/sources.list.d/ros2-apt-source.list
sudo apt clean
sudo apt update
```

---

## setup.bash not found

Example error:

```text
/opt/ros/jazzy/setup.bash: No such file or directory
```

ROS2 was not installed correctly.

Reinstall:

```bash
sudo apt update
sudo apt install ros-jazzy-desktop -y
```

Verify installation:

```bash
ls /opt/ros
```

Expected output:

```text
jazzy
```

---

## turtlesim executable not found

Install turtlesim:

```bash
sudo apt install ros-jazzy-turtlesim -y
```

Run:

```bash
ros2 run turtlesim turtlesim_node
```

---

## GUI applications not opening

Update WSL:

```powershell
wsl --update
```

Restart WSL:

```powershell
wsl --shutdown
```

Then reopen Ubuntu.

---

## RViz does not start

Try:

```bash
rviz2
```

If it fails:

- update GPU drivers
- update WSL
- ensure Windows 11 WSLg is enabled

---

## Verify ROS2 installation

```bash
ros2 --help
```

---

## Verify ROS environment

```bash
printenv | grep ROS
```

---

## Reload ROS environment

```bash
source /opt/ros/jazzy/setup.bash
source ~/.bashrc
```

---

## Verify active ROS nodes

```bash
ros2 node list
```

---

## Verify active ROS topics

```bash
ros2 topic list
```
