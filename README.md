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

MIT
