# ROS2 WSL Installer

Automated installer for:

- WSL2
- Ubuntu 22.04 / 24.04
- ROS2 Humble
- ROS2 Jazzy
- ROS2 Kilted
- turtlesim
- colcon
- rosdep
- ROS2 workspace

---

# Supported ROS2 Distributions

| ROS2 | Ubuntu | Status |
|---|---|---|
| Humble | 22.04 (jammy) | LTS |
| Jazzy | 24.04 (noble) | LTS |
| Kilted | 24.04 (noble) | Latest |

---

# Features

- Interactive ROS2 distro selection
- Automatic Ubuntu compatibility checks
- Cleans conflicting ROS apt sources
- Installs turtlesim
- Initializes rosdep
- Creates ROS2 workspace
- Updates ~/.bashrc automatically
- Supports Humble, Jazzy, and Kilted

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

Recommended:

```powershell
wsl --install -d Ubuntu-24.04
```

For Humble:

```powershell
wsl --install -d Ubuntu-22.04
```

---

## 3. Clone repository

Inside Ubuntu:

```bash
git clone https://github.com/TheOnlyCoffeeman/ros2-wsl-installer.git
cd ros2-wsl-installer
```

---

## 4. Make script executable

```bash
chmod +x install_ros2_wsl.sh
```

---

## 5. Run installer

```bash
./install_ros2_wsl.sh
```

---

# ROS2 Selection

The installer supports:

```text
1) Humble
2) Jazzy
3) Kilted
```

The script automatically checks Ubuntu compatibility.

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
