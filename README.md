# ROS2 WSL Installer

Automated installer for:

- WSL2
- Ubuntu 24.04 / 22.04
- ROS2 Jazzy / Humble
- turtlesim
- colcon
- rosdep
- ROS2 workspace

---

# Supported Systems

| Ubuntu | ROS2 |
|---|---|
| 24.04 (noble) | Jazzy |
| 22.04 (jammy) | Humble |

---

# Installation

## 1. Install WSL2

Open PowerShell as Administrator:

```powershell
wsl --install
```

Restart Windows.

---

## 2. Install Ubuntu

```powershell
wsl --install -d Ubuntu-24.04
```

---

## 3. Clone repository

Inside Ubuntu:

```bash
git clone https://github.com/TheOnlyCoffeeman/ros2-wsl-installer.git
cd ros2-wsl-installer
```

---

## 4. Run installer

```bash
chmod +x install_ros2_wsl.sh
./install_ros2_wsl.sh
```

---

# Test ROS2

## Terminal 1

```bash
ros2 run turtlesim turtlesim_node
```

## Terminal 2

```bash
ros2 run turtlesim turtle_teleop_key
```

---

# Features

- Automatic ROS2 distro detection
- Cleans conflicting ROS apt sources
- Installs turtlesim
- Initializes rosdep
- Creates ROS2 workspace
- Updates ~/.bashrc automatically

---

# VSCode

Recommended:

- VSCode
- Remote WSL extension

Open project:

```bash
code .
```

---

# Troubleshooting

See:

```text
docs/troubleshooting.md
```

---

# License

MIT License

Copyright (c) 2026 TheOnlyCoffeeman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
